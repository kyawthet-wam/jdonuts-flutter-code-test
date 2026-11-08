import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../sync/seed_loader.dart';
import 'app_database.dart';

part 'database_providers.g.dart';

const String _databaseName = 'jdonuts';

/// The single SQLite database, closed when the container is disposed.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase(driftDatabase(name: _databaseName));
  ref.onDispose(db.close);
  return db;
}

/// Completes once the bundled seed is in the database (a no-op after the
/// first launch). Anything reading catalog data awaits this first.
@Riverpod(keepAlive: true)
Future<void> databaseSeed(Ref ref) async {
  final loader = SeedLoader(
    ref.watch(appDatabaseProvider),
    rootBundle.loadString,
  );
  await loader.seedIfNeeded();
}
