import 'dart:io';

import 'package:drift/native.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/sync/seed_loader.dart';

/// Reads the real bundled seed so tests exercise the same data as the app.
Future<String> loadSeedFromDisk(String path) => File(path).readAsString();

AppDatabase inMemoryDatabase() => AppDatabase(NativeDatabase.memory());

/// An in-memory database already seeded from `assets/seed/seed.json`.
Future<AppDatabase> seededDatabase() async {
  final db = inMemoryDatabase();
  await SeedLoader(db, loadSeedFromDisk).seedIfNeeded();
  return db;
}
