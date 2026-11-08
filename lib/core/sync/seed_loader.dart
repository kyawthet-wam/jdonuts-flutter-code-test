import 'dart:convert';

import '../database/app_database.dart';
import 'catalog_snapshot.dart';
import 'catalog_writer.dart';

/// Path of the bundled first-launch data.
const String seedAssetPath = 'assets/seed/seed.json';

const String _seedVersionKey = 'seed_version';

/// Fills an empty database from the bundled JSON on first launch.
///
/// Why: the app must be fully usable offline from the very first run, so the
/// UI never waits for a server.
class SeedLoader {
  SeedLoader(this._db, this._loadString);

  final AppDatabase _db;

  /// `rootBundle.loadString` in the app; a fake in tests.
  final Future<String> Function(String path) _loadString;

  /// Seeds when nothing has been seeded yet or the bundled version is newer.
  /// Returns true if it wrote data.
  Future<bool> seedIfNeeded() async {
    final json =
        jsonDecode(await _loadString(seedAssetPath)) as Map<String, dynamic>;
    final snapshot = CatalogSnapshot.fromJson(json);
    final current = await _storedVersion();
    if (current != null && current >= snapshot.version) return false;
    await CatalogWriter(_db).replaceAll(snapshot);
    await _db
        .into(_db.appMeta)
        .insertOnConflictUpdate(
          AppMetaCompanion.insert(
            key: _seedVersionKey,
            value: '${snapshot.version}',
          ),
        );
    return true;
  }

  Future<int?> _storedVersion() async {
    final row = await (_db.select(
      _db.appMeta,
    )..where((t) => t.key.equals(_seedVersionKey))).getSingleOrNull();
    return row == null ? null : int.tryParse(row.value);
  }
}
