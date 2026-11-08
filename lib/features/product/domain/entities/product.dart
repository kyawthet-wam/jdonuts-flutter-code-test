import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    required bool isNew,
    int? discountPercent,

    /// Remote image, cached on disk once downloaded. May be null.
    String? imageUrl,

    /// Bundled fallback so the first launch works without a network.
    required String imageAsset,
    required String description,
  }) = _Product;
}
