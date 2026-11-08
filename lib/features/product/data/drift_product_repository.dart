import '../../../core/database/app_database.dart';
import '../domain/entities/product.dart';
import '../domain/repositories/product_repository.dart';
import 'product_mapper.dart';

class DriftProductRepository implements ProductRepository {
  const DriftProductRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<Product?> watchProduct(String id) {
    final query = _db.select(_db.products)..where((p) => p.id.equals(id));
    return query.watchSingleOrNull().map((row) => row?.toDomain());
  }
}
