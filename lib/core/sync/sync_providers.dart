import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/app_config.dart';
import '../connectivity/connectivity_providers.dart';
import '../database/database_providers.dart';
import '../network/dio_factory.dart';
import '../network/remote_catalog_source.dart';
import '../result/result.dart';
import 'catalog_sync.dart';
import 'catalog_writer.dart';

part 'sync_providers.g.dart';

/// Null when no server is configured, which makes sync a no-op.
@Riverpod(keepAlive: true)
RemoteCatalogSource? remoteCatalogSource(Ref ref) {
  if (!AppConfig.hasRemote) return null;
  final dio = createDio(AppConfig.apiBaseUrl);
  ref.onDispose(dio.close);
  return DioRemoteCatalogSource(dio);
}

@Riverpod(keepAlive: true)
CatalogSync catalogSync(Ref ref) => CatalogSync(
  remote: ref.watch(remoteCatalogSourceProvider),
  writer: CatalogWriter(ref.watch(appDatabaseProvider)),
  connectivity: ref.watch(connectivityServiceProvider),
);

/// Starts a background refresh whenever the device comes back online (and on
/// launch if already online). Screens call [refresh] for pull-to-refresh.
///
/// Why state is the last result: a failed background sync is silent (the UI
/// keeps showing local data), but the failure stays inspectable.
@Riverpod(keepAlive: true)
class SyncController extends _$SyncController {
  @override
  Result<void>? build() {
    ref.listen(isOnlineProvider, (previous, next) {
      final online = next.value ?? false;
      final wasOnline = previous?.value ?? false;
      if (online && !wasOnline) refresh();
    }, fireImmediately: true);
    return null;
  }

  Future<Result<void>> refresh() async {
    await ref.read(databaseSeedProvider.future);
    final result = await ref.read(catalogSyncProvider).refresh();
    if (ref.mounted) state = result;
    return result;
  }
}
