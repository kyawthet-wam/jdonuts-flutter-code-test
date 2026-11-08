import '../../../core/database/app_database.dart';
import '../domain/entities/product.dart';

extension ProductRowX on ProductRow {
  Product toDomain() => Product(
    id: id,
    code: code,
    name: name,
    priceMmk: priceMmk,
    isNew: isNew,
    discountPercent: discountPercent,
    imageUrl: imageUrl,
    imageAsset: imageAsset,
    description: description,
  );
}
