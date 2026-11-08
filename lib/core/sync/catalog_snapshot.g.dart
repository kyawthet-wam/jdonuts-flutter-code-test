// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogSnapshot _$CatalogSnapshotFromJson(Map<String, dynamic> json) =>
    _CatalogSnapshot(
      version: (json['version'] as num).toInt(),
      member: MemberDto.fromJson(json['member'] as Map<String, dynamic>),
      banners: (json['banners'] as List<dynamic>)
          .map((e) => BannerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      shops: (json['shops'] as List<dynamic>)
          .map((e) => ShopDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      challenges: (json['challenges'] as List<dynamic>)
          .map((e) => ChallengeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatalogSnapshotToJson(_CatalogSnapshot instance) =>
    <String, dynamic>{
      'version': instance.version,
      'member': instance.member,
      'banners': instance.banners,
      'products': instance.products,
      'sections': instance.sections,
      'shops': instance.shops,
      'challenges': instance.challenges,
    };

_MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) => _MemberDto(
  id: json['id'] as String,
  name: json['name'] as String,
  photoAsset: json['photoAsset'] as String,
  tier: json['tier'] as String,
  totalPoints: (json['totalPoints'] as num).toInt(),
  pointsToNextTier: (json['pointsToNextTier'] as num).toInt(),
  tierProgress: (json['tierProgress'] as num).toDouble(),
  unreadNotifications: (json['unreadNotifications'] as num).toInt(),
);

Map<String, dynamic> _$MemberDtoToJson(_MemberDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoAsset': instance.photoAsset,
      'tier': instance.tier,
      'totalPoints': instance.totalPoints,
      'pointsToNextTier': instance.pointsToNextTier,
      'tierProgress': instance.tierProgress,
      'unreadNotifications': instance.unreadNotifications,
    };

_BannerDto _$BannerDtoFromJson(Map<String, dynamic> json) => _BannerDto(
  id: json['id'] as String,
  badge: json['badge'] as String?,
  title: json['title'] as String,
  imageAsset: json['imageAsset'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$BannerDtoToJson(_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'title': instance.title,
      'imageAsset': instance.imageAsset,
      'imageUrl': instance.imageUrl,
    };

_ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => _ProductDto(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  priceMmk: (json['priceMmk'] as num).toInt(),
  isNew: json['isNew'] as bool,
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  imageAsset: json['imageAsset'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$ProductDtoToJson(_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'priceMmk': instance.priceMmk,
      'isNew': instance.isNew,
      'discountPercent': instance.discountPercent,
      'imageUrl': instance.imageUrl,
      'imageAsset': instance.imageAsset,
      'description': instance.description,
    };

_SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) => _SectionDto(
  id: json['id'] as String,
  title: json['title'] as String,
  kind: json['kind'] as String,
  productIds: (json['productIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SectionDtoToJson(_SectionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'kind': instance.kind,
      'productIds': instance.productIds,
    };

_ShopDto _$ShopDtoFromJson(Map<String, dynamic> json) => _ShopDto(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  imageAsset: json['imageAsset'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$ShopDtoToJson(_ShopDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'imageAsset': instance.imageAsset,
  'imageUrl': instance.imageUrl,
};

_ChallengeDto _$ChallengeDtoFromJson(Map<String, dynamic> json) =>
    _ChallengeDto(
      id: json['id'] as String,
      title: json['title'] as String,
      kind: json['kind'] as String,
      current: (json['current'] as num).toInt(),
      target: (json['target'] as num).toInt(),
      rewardPoints: (json['rewardPoints'] as num).toInt(),
    );

Map<String, dynamic> _$ChallengeDtoToJson(_ChallengeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'kind': instance.kind,
      'current': instance.current,
      'target': instance.target,
      'rewardPoints': instance.rewardPoints,
    };
