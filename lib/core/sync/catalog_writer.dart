import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'catalog_snapshot.dart';

/// Replaces the local catalog with a snapshot inside one transaction.
///
/// Why replace instead of merge: the server is the authority for catalog
/// data, and a single transaction means the UI (watching the tables) never
/// sees a half-written catalog. The cart is user data and is left untouched.
class CatalogWriter {
  const CatalogWriter(this._db);

  final AppDatabase _db;

  Future<void> replaceAll(CatalogSnapshot s) {
    return _db.transaction(() async {
      await _clearCatalog();
      await _writeMember(s.member);
      await _writeProducts(s.products);
      await _writeBanners(s.banners);
      await _writeSections(s.sections);
      await _writeShops(s.shops);
      await _writeChallenges(s.challenges);
    });
  }

  Future<void> _clearCatalog() async {
    final tables = <TableInfo<Table, Object?>>[
      _db.members,
      _db.banners,
      _db.products,
      _db.sections,
      _db.sectionProducts,
      _db.shops,
      _db.challenges,
    ];
    for (final table in tables) {
      await _db.delete(table).go();
    }
  }

  Future<void> _writeMember(MemberDto m) {
    return _db
        .into(_db.members)
        .insert(
          MembersCompanion.insert(
            id: m.id,
            name: m.name,
            photoAsset: m.photoAsset,
            tier: m.tier,
            totalPoints: m.totalPoints,
            pointsToNextTier: m.pointsToNextTier,
            tierProgress: m.tierProgress,
            unreadNotifications: m.unreadNotifications,
          ),
        );
  }

  Future<void> _writeProducts(List<ProductDto> items) {
    return _db.batch(
      (b) => b.insertAll(_db.products, [
        for (final p in items)
          ProductsCompanion.insert(
            id: p.id,
            code: p.code,
            name: p.name,
            priceMmk: p.priceMmk,
            isNew: p.isNew,
            discountPercent: Value(p.discountPercent),
            imageUrl: Value(p.imageUrl),
            imageAsset: p.imageAsset,
            description: p.description,
          ),
      ]),
    );
  }

  Future<void> _writeBanners(List<BannerDto> items) {
    return _db.batch(
      (b) => b.insertAll(_db.banners, [
        for (final (i, x) in items.indexed)
          BannersCompanion.insert(
            id: x.id,
            badge: Value(x.badge),
            title: x.title,
            imageAsset: x.imageAsset,
            imageUrl: Value(x.imageUrl),
            position: i,
          ),
      ]),
    );
  }

  Future<void> _writeSections(List<SectionDto> items) async {
    await _db.batch((b) {
      for (final (i, s) in items.indexed) {
        b.insert(
          _db.sections,
          SectionsCompanion.insert(
            id: s.id,
            title: s.title,
            kind: s.kind,
            position: i,
          ),
        );
        b.insertAll(_db.sectionProducts, [
          for (final (j, productId) in s.productIds.indexed)
            SectionProductsCompanion.insert(
              sectionId: s.id,
              productId: productId,
              position: j,
            ),
        ]);
      }
    });
  }

  Future<void> _writeShops(List<ShopDto> items) {
    return _db.batch(
      (b) => b.insertAll(_db.shops, [
        for (final (i, x) in items.indexed)
          ShopsCompanion.insert(
            id: x.id,
            name: x.name,
            address: x.address,
            imageAsset: x.imageAsset,
            imageUrl: Value(x.imageUrl),
            position: i,
          ),
      ]),
    );
  }

  Future<void> _writeChallenges(List<ChallengeDto> items) {
    return _db.batch(
      (b) => b.insertAll(_db.challenges, [
        for (final (i, x) in items.indexed)
          ChallengesCompanion.insert(
            id: x.id,
            title: x.title,
            kind: x.kind,
            current: x.current,
            target: x.target,
            rewardPoints: x.rewardPoints,
            position: i,
          ),
      ]),
    );
  }
}
