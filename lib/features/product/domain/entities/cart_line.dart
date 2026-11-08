import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'cart_line.freezed.dart';

@freezed
abstract class CartLine with _$CartLine {
  const CartLine._();

  const factory CartLine({required Product product, required int quantity}) =
      _CartLine;

  int get totalMmk => product.priceMmk * quantity;
}
