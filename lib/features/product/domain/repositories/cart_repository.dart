import '../../../../core/result/result.dart';
import '../entities/cart_line.dart';

abstract interface class CartRepository {
  Stream<List<CartLine>> watchCart();

  /// Adds [quantity] of the product, merging with an existing line.
  Future<Result<void>> add(String productId, int quantity);
}
