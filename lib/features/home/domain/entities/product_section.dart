import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/domain/entities/product.dart';

part 'product_section.freezed.dart';

enum SectionKind { seasonal, popular, orderAgain }

extension SectionKindX on SectionKind {
  bool get isSeasonal => this == SectionKind.seasonal;
  bool get isPopular => this == SectionKind.popular;
  bool get isOrderAgain => this == SectionKind.orderAgain;
}

/// A titled horizontal list on Home.
@freezed
abstract class ProductSection with _$ProductSection {
  const factory ProductSection({
    required String id,
    required String title,
    required SectionKind kind,
    required List<Product> products,
  }) = _ProductSection;
}
