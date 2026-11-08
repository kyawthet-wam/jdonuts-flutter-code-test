import 'package:drift/drift.dart';

import 'tables.dart';

part 'app_database.g.dart';

/// Schema history (bump [schemaVersion] and extend [_upgrade] together):
/// - v1: catalog tables (member, banners, products, sections, shops, challenges)
/// - v2: cart_items (persistent cart)
@DriftDatabase(
  tables: [
    Members,
    Banners,
    Products,
    Sections,
    SectionProducts,
    Shops,
    Challenges,
    CartItems,
    AppMeta,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onCreate: (m) => m.createAll(), onUpgrade: _upgrade);

  /// Each step runs once, in order, so a v1 install reaches the latest schema
  /// without losing data.
  Future<void> _upgrade(Migrator m, int from, int to) async {
    if (from < 2) await m.createTable(cartItems);
  }
}
