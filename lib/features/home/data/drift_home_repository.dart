import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../product/data/product_mapper.dart';
import '../domain/entities/home_banner.dart';
import '../domain/entities/product_section.dart';
import '../domain/entities/shop.dart';
import '../domain/repositories/home_repository.dart';

class DriftHomeRepository implements HomeRepository {
  const DriftHomeRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<HomeBanner>> watchBanners() {
    final query = _db.select(_db.banners)
      ..orderBy([(b) => OrderingTerm.asc(b.position)]);
    return query.watch().map(
      (rows) => [
        for (final r in rows)
          HomeBanner(
            id: r.id,
            badge: r.badge,
            title: r.title,
            imageAsset: r.imageAsset,
            imageUrl: r.imageUrl,
          ),
      ],
    );
  }

  @override
  Stream<List<Shop>> watchShops() {
    final query = _db.select(_db.shops)
      ..orderBy([(s) => OrderingTerm.asc(s.position)]);
    return query.watch().map(
      (rows) => [
        for (final r in rows)
          Shop(
            id: r.id,
            name: r.name,
            address: r.address,
            imageAsset: r.imageAsset,
            imageUrl: r.imageUrl,
          ),
      ],
    );
  }

  @override
  Stream<List<ProductSection>> watchSections() {
    final query =
        _db.select(_db.sections).join([
          leftOuterJoin(
            _db.sectionProducts,
            _db.sectionProducts.sectionId.equalsExp(_db.sections.id),
          ),
          leftOuterJoin(
            _db.products,
            _db.products.id.equalsExp(_db.sectionProducts.productId),
          ),
        ])..orderBy([
          OrderingTerm.asc(_db.sections.position),
          OrderingTerm.asc(_db.sectionProducts.position),
        ]);
    return query.watch().map(_groupBySection);
  }

  /// Rows arrive ordered, one per (section, product); fold them back into
  /// sections while keeping that order.
  List<ProductSection> _groupBySection(List<TypedResult> rows) {
    final sections = <String, ProductSection>{};
    for (final row in rows) {
      final section = row.readTable(_db.sections);
      final product = row.readTableOrNull(_db.products);
      final current =
          sections[section.id] ??
          ProductSection(
            id: section.id,
            title: section.title,
            kind: SectionKind.values.byName(section.kind),
            products: const [],
          );
      sections[section.id] = product == null
          ? current
          : current.copyWith(
              products: [...current.products, product.toDomain()],
            );
    }
    return sections.values.toList();
  }
}
