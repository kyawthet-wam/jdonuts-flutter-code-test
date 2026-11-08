import '../../../../core/result/failure.dart';
import '../../../../core/result/result.dart';
import '../quantity_rules.dart';
import '../repositories/cart_repository.dart';

/// Adds a product to the cart after checking the quantity rule, so the UI
/// can't store a zero or absurd quantity even if a button misbehaves.
class AddToCart {
  const AddToCart(this._repository);

  final CartRepository _repository;

  Future<Result<void>> call(String productId, int quantity) {
    if (quantity < minProductQuantity || quantity > maxProductQuantity) {
      return Future.value(const Result.err(InvalidInputFailure()));
    }
    return _repository.add(productId, quantity);
  }
}
