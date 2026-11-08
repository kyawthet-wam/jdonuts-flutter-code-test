import '../connectivity/connectivity_service.dart';
import '../network/remote_catalog_source.dart';
import '../result/failure.dart';
import '../result/result.dart';
import 'catalog_writer.dart';

/// Refreshes the local database from the server.
///
/// The UI never waits for this: screens read the database, and a successful
/// refresh simply updates it. With no server configured it is a no-op.
class CatalogSync {
  CatalogSync({
    required this.remote,
    required this.writer,
    required this.connectivity,
  });

  /// Null when no server is configured. Fields are public because older Dart
  /// versions reject private named parameters (`required this._remote`).
  final RemoteCatalogSource? remote;
  final CatalogWriter writer;
  final ConnectivityService connectivity;

  Future<Result<void>>? _inFlight;

  /// Concurrent callers (pull-to-refresh during a background sync) share one
  /// request instead of racing two writes.
  Future<Result<void>> refresh() =>
      _inFlight ??= _run().whenComplete(() => _inFlight = null);

  Future<Result<void>> _run() async {
    final source = remote;
    if (source == null) return const Result.ok(null);
    if (!await connectivity.isOnline()) {
      return const Result.err(NetworkFailure());
    }
    final fetched = await source.fetchCatalog();
    return fetched.when(
      ok: (snapshot) async {
        await writer.replaceAll(snapshot);
        return const Result<void>.ok(null);
      },
      err: (failure) async => Result<void>.err(failure),
    );
  }
}
