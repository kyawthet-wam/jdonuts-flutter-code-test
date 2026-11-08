import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/database_providers.dart';
import '../domain/entities/cart_line.dart';
import '../domain/entities/product.dart';
import '../domain/repositories/cart_repository.dart';
import '../domain/repositories/product_repository.dart';
import 'drift_cart_repository.dart';
import 'drift_product_repository.dart';

part 'product_providers.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) =>
    DriftProductRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) =>
    DriftCartRepository(ref.watch(appDatabaseProvider));

@riverpod
Stream<Product?> product(Ref ref, String id) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(productRepositoryProvider).watchProduct(id);
}

@riverpod
Stream<List<CartLine>> cartLines(Ref ref) =>
    ref.watch(cartRepositoryProvider).watchCart();
