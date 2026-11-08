import 'package:drift/drift.dart';

// Row classes are suffixed `Row` so they never collide with domain entities.

@DataClassName('MemberRow')
class Members extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get photoAsset => text()();
  TextColumn get tier => text()();
  IntColumn get totalPoints => integer()();
  IntColumn get pointsToNextTier => integer()();
  RealColumn get tierProgress => real()();
  IntColumn get unreadNotifications => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BannerRow')
class Banners extends Table {
  TextColumn get id => text()();
  TextColumn get badge => text().nullable()();
  TextColumn get title => text()();
  TextColumn get imageAsset => text()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProductRow')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  IntColumn get priceMmk => integer()();
  BoolColumn get isNew => boolean()();
  IntColumn get discountPercent => integer().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get imageAsset => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SectionRow')
class Sections extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get kind => text()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SectionProductRow')
class SectionProducts extends Table {
  TextColumn get sectionId => text()();
  TextColumn get productId => text()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {sectionId, productId};
}

@DataClassName('ShopRow')
class Shops extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get imageAsset => text()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ChallengeRow')
class Challenges extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get kind => text()();
  IntColumn get current => integer()();
  IntColumn get target => integer()();
  IntColumn get rewardPoints => integer()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Added in schema v2. Survives catalog refreshes (user data, not catalog).
@DataClassName('CartItemRow')
class CartItems extends Table {
  TextColumn get productId => text()();
  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {productId};
}

/// Small key/value table: seed version, last sync time.
@DataClassName('MetaRow')
class AppMeta extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
