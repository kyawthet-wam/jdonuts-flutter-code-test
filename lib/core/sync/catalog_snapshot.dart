import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_snapshot.freezed.dart';
part 'catalog_snapshot.g.dart';

/// Wire format shared by the bundled seed file and the mock server's
/// `data` payload, so both go through the same writer.
@freezed
abstract class CatalogSnapshot with _$CatalogSnapshot {
  const factory CatalogSnapshot({
    required int version,
    required MemberDto member,
    required List<BannerDto> banners,
    required List<ProductDto> products,
    required List<SectionDto> sections,
    required List<ShopDto> shops,
    required List<ChallengeDto> challenges,
  }) = _CatalogSnapshot;

  factory CatalogSnapshot.fromJson(Map<String, dynamic> json) =>
      _$CatalogSnapshotFromJson(json);
}

@freezed
abstract class MemberDto with _$MemberDto {
  const factory MemberDto({
    required String id,
    required String name,
    required String photoAsset,
    required String tier,
    required int totalPoints,
    required int pointsToNextTier,
    required double tierProgress,
    required int unreadNotifications,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}

@freezed
abstract class BannerDto with _$BannerDto {
  const factory BannerDto({
    required String id,
    String? badge,
    required String title,
    required String imageAsset,
    String? imageUrl,
  }) = _BannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}

@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    required bool isNew,
    int? discountPercent,
    String? imageUrl,
    required String imageAsset,
    required String description,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}

@freezed
abstract class SectionDto with _$SectionDto {
  const factory SectionDto({
    required String id,
    required String title,
    required String kind,
    required List<String> productIds,
  }) = _SectionDto;

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);
}

@freezed
abstract class ShopDto with _$ShopDto {
  const factory ShopDto({
    required String id,
    required String name,
    required String address,
    required String imageAsset,
    String? imageUrl,
  }) = _ShopDto;

  factory ShopDto.fromJson(Map<String, dynamic> json) =>
      _$ShopDtoFromJson(json);
}

@freezed
abstract class ChallengeDto with _$ChallengeDto {
  const factory ChallengeDto({
    required String id,
    required String title,
    required String kind,
    required int current,
    required int target,
    required int rewardPoints,
  }) = _ChallengeDto;

  factory ChallengeDto.fromJson(Map<String, dynamic> json) =>
      _$ChallengeDtoFromJson(json);
}
