import '../entities/home_banner.dart';
import '../entities/product_section.dart';
import '../entities/shop.dart';

/// Read side of Home. Everything comes from the local database; refreshing
/// from the network is a separate concern (see `CatalogSync`).
abstract interface class HomeRepository {
  Stream<List<HomeBanner>> watchBanners();
  Stream<List<ProductSection>> watchSections();
  Stream<List<Shop>> watchShops();
}
