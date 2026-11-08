import '../entities/product.dart';

abstract interface class ProductRepository {
  /// Emits null when no product has [id].
  Stream<Product?> watchProduct(String id);
}
