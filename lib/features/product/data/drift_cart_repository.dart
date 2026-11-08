import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/result/failure.dart';
import '../../../core/result/result.dart';
import '../domain/entities/cart_line.dart';
import '../domain/repositories/cart_repository.dart';
import 'product_mapper.dart';

/// Cart persisted in SQLite so it survives restarts and works offline.
class DriftCartRepository implements CartRepository {
  const DriftCartRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<CartLine>> watchCart() {
    final query = _db.select(_db.cartItems).join([
      innerJoin(
        _db.products,
        _db.products.id.equalsExp(_db.cartItems.productId),
      ),
    ]);
    return query.watch().map(
      (rows) => [
        for (final row in rows)
          CartLine(
            product: row.readTable(_db.products).toDomain(),
            quantity: row.readTable(_db.cartItems).quantity,
          ),
      ],
    );
  }

  @override
  Future<Result<void>> add(String productId, int quantity) async {
    try {
      await _db.transaction(() async {
        final existing = await (_db.select(
          _db.cartItems,
        )..where((c) => c.productId.equals(productId))).getSingleOrNull();
        await _db
            .into(_db.cartItems)
            .insertOnConflictUpdate(
              CartItemsCompanion.insert(
                productId: productId,
                quantity: (existing?.quantity ?? 0) + quantity,
              ),
            );
      });
      return const Result.ok(null);
    } on Object catch (error) {
      return Result.err(StorageFailure('$error'));
    }
  }
}
