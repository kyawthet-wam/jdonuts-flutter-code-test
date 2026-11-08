// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogSnapshot {

 int get version; MemberDto get member; List<BannerDto> get banners; List<ProductDto> get products; List<SectionDto> get sections; List<ShopDto> get shops; List<ChallengeDto> get challenges;
/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogSnapshotCopyWith<CatalogSnapshot> get copyWith => _$CatalogSnapshotCopyWithImpl<CatalogSnapshot>(this as CatalogSnapshot, _$identity);

  /// Serializes this CatalogSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CatalogSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogSnapshot&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.member, _this.member) || other.member == _this.member)&&const DeepCollectionEquality().equals(other.banners, _this.banners)&&const DeepCollectionEquality().equals(other.products, _this.products)&&const DeepCollectionEquality().equals(other.sections, _this.sections)&&const DeepCollectionEquality().equals(other.shops, _this.shops)&&const DeepCollectionEquality().equals(other.challenges, _this.challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CatalogSnapshot;
  return Object.hash(runtimeType,_this.version,_this.member,const DeepCollectionEquality().hash(_this.banners),const DeepCollectionEquality().hash(_this.products),const DeepCollectionEquality().hash(_this.sections),const DeepCollectionEquality().hash(_this.shops),const DeepCollectionEquality().hash(_this.challenges));
}

@override
String toString() {
  final _this = this as CatalogSnapshot;
  return 'CatalogSnapshot(version: ${_this.version}, member: ${_this.member}, banners: ${_this.banners}, products: ${_this.products}, sections: ${_this.sections}, shops: ${_this.shops}, challenges: ${_this.challenges})';
}


}

/// @nodoc
abstract mixin class $CatalogSnapshotCopyWith<$Res>  {
  factory $CatalogSnapshotCopyWith(CatalogSnapshot value, $Res Function(CatalogSnapshot) _then) = _$CatalogSnapshotCopyWithImpl;
@useResult
$Res call({
 int version, MemberDto member, List<BannerDto> banners, List<ProductDto> products, List<SectionDto> sections, List<ShopDto> shops, List<ChallengeDto> challenges
});


$MemberDtoCopyWith<$Res> get member;

}
/// @nodoc
class _$CatalogSnapshotCopyWithImpl<$Res>
    implements $CatalogSnapshotCopyWith<$Res> {
  _$CatalogSnapshotCopyWithImpl(this._self, this._then);

  final CatalogSnapshot _self;
  final $Res Function(CatalogSnapshot) _then;

/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? member = null,Object? banners = null,Object? products = null,Object? sections = null,Object? shops = null,Object? challenges = null,}) {
  return _then(CatalogSnapshot(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberDto,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as List<ShopDto>,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeDto>,
  ));
}
/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberDtoCopyWith<$Res> get member {
  
  return $MemberDtoCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogSnapshot].
extension CatalogSnapshotPatterns on CatalogSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _CatalogSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  MemberDto member,  List<BannerDto> banners,  List<ProductDto> products,  List<SectionDto> sections,  List<ShopDto> shops,  List<ChallengeDto> challenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogSnapshot() when $default != null:
return $default(_that.version,_that.member,_that.banners,_that.products,_that.sections,_that.shops,_that.challenges);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  MemberDto member,  List<BannerDto> banners,  List<ProductDto> products,  List<SectionDto> sections,  List<ShopDto> shops,  List<ChallengeDto> challenges)  $default,) {final _that = this;
switch (_that) {
case _CatalogSnapshot():
return $default(_that.version,_that.member,_that.banners,_that.products,_that.sections,_that.shops,_that.challenges);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  MemberDto member,  List<BannerDto> banners,  List<ProductDto> products,  List<SectionDto> sections,  List<ShopDto> shops,  List<ChallengeDto> challenges)?  $default,) {final _that = this;
switch (_that) {
case _CatalogSnapshot() when $default != null:
return $default(_that.version,_that.member,_that.banners,_that.products,_that.sections,_that.shops,_that.challenges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogSnapshot implements CatalogSnapshot {
  const _CatalogSnapshot({required this.version, required this.member, required  List<BannerDto> banners, required  List<ProductDto> products, required  List<SectionDto> sections, required  List<ShopDto> shops, required  List<ChallengeDto> challenges}): _banners = banners,_products = products,_sections = sections,_shops = shops,_challenges = challenges;
  factory _CatalogSnapshot.fromJson(Map<String, dynamic> json) => _$CatalogSnapshotFromJson(json);

@override final  int version;
@override final  MemberDto member;
 final  List<BannerDto> _banners;
@override List<BannerDto> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<ProductDto> _products;
@override List<ProductDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<SectionDto> _sections;
@override List<SectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

 final  List<ShopDto> _shops;
@override List<ShopDto> get shops {
  if (_shops is EqualUnmodifiableListView) return _shops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shops);
}

 final  List<ChallengeDto> _challenges;
@override List<ChallengeDto> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}


/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogSnapshotCopyWith<_CatalogSnapshot> get copyWith => __$CatalogSnapshotCopyWithImpl<_CatalogSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogSnapshot&&(identical(other.version, version) || other.version == version)&&(identical(other.member, member) || other.member == member)&&const DeepCollectionEquality().equals(other.banners, _banners)&&const DeepCollectionEquality().equals(other.products, _products)&&const DeepCollectionEquality().equals(other.sections, _sections)&&const DeepCollectionEquality().equals(other.shops, _shops)&&const DeepCollectionEquality().equals(other.challenges, _challenges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,version,member,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_sections),const DeepCollectionEquality().hash(_shops),const DeepCollectionEquality().hash(_challenges));
}

@override
String toString() {
    return 'CatalogSnapshot(version: $version, member: $member, banners: $banners, products: $products, sections: $sections, shops: $shops, challenges: $challenges)';
}


}

/// @nodoc
abstract mixin class _$CatalogSnapshotCopyWith<$Res> implements $CatalogSnapshotCopyWith<$Res> {
  factory _$CatalogSnapshotCopyWith(_CatalogSnapshot value, $Res Function(_CatalogSnapshot) _then) = __$CatalogSnapshotCopyWithImpl;
@override @useResult
$Res call({
 int version, MemberDto member, List<BannerDto> banners, List<ProductDto> products, List<SectionDto> sections, List<ShopDto> shops, List<ChallengeDto> challenges
});


@override $MemberDtoCopyWith<$Res> get member;

}
/// @nodoc
class __$CatalogSnapshotCopyWithImpl<$Res>
    implements _$CatalogSnapshotCopyWith<$Res> {
  __$CatalogSnapshotCopyWithImpl(this._self, this._then);

  final _CatalogSnapshot _self;
  final $Res Function(_CatalogSnapshot) _then;

/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? member = null,Object? banners = null,Object? products = null,Object? sections = null,Object? shops = null,Object? challenges = null,}) {
  return _then(_CatalogSnapshot(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberDto,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerDto>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionDto>,shops: null == shops ? _self._shops : shops // ignore: cast_nullable_to_non_nullable
as List<ShopDto>,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeDto>,
  ));
}

/// Create a copy of CatalogSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberDtoCopyWith<$Res> get member {
  
  return $MemberDtoCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// @nodoc
mixin _$MemberDto {

 String get id; String get name; String get photoAsset; String get tier; int get totalPoints; int get pointsToNextTier; double get tierProgress; int get unreadNotifications;
/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDtoCopyWith<MemberDto> get copyWith => _$MemberDtoCopyWithImpl<MemberDto>(this as MemberDto, _$identity);

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MemberDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.photoAsset, _this.photoAsset) || other.photoAsset == _this.photoAsset)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.totalPoints, _this.totalPoints) || other.totalPoints == _this.totalPoints)&&(identical(other.pointsToNextTier, _this.pointsToNextTier) || other.pointsToNextTier == _this.pointsToNextTier)&&(identical(other.tierProgress, _this.tierProgress) || other.tierProgress == _this.tierProgress)&&(identical(other.unreadNotifications, _this.unreadNotifications) || other.unreadNotifications == _this.unreadNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MemberDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.photoAsset,_this.tier,_this.totalPoints,_this.pointsToNextTier,_this.tierProgress,_this.unreadNotifications);
}

@override
String toString() {
  final _this = this as MemberDto;
  return 'MemberDto(id: ${_this.id}, name: ${_this.name}, photoAsset: ${_this.photoAsset}, tier: ${_this.tier}, totalPoints: ${_this.totalPoints}, pointsToNextTier: ${_this.pointsToNextTier}, tierProgress: ${_this.tierProgress}, unreadNotifications: ${_this.unreadNotifications})';
}


}

/// @nodoc
abstract mixin class $MemberDtoCopyWith<$Res>  {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) _then) = _$MemberDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String photoAsset, String tier, int totalPoints, int pointsToNextTier, double tierProgress, int unreadNotifications
});




}
/// @nodoc
class _$MemberDtoCopyWithImpl<$Res>
    implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._self, this._then);

  final MemberDto _self;
  final $Res Function(MemberDto) _then;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photoAsset = null,Object? tier = null,Object? totalPoints = null,Object? pointsToNextTier = null,Object? tierProgress = null,Object? unreadNotifications = null,}) {
  return _then(MemberDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberDto].
extension MemberDtoPatterns on MemberDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String photoAsset,  String tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that.id,_that.name,_that.photoAsset,_that.tier,_that.totalPoints,_that.pointsToNextTier,_that.tierProgress,_that.unreadNotifications);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String photoAsset,  String tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)  $default,) {final _that = this;
switch (_that) {
case _MemberDto():
return $default(_that.id,_that.name,_that.photoAsset,_that.tier,_that.totalPoints,_that.pointsToNextTier,_that.tierProgress,_that.unreadNotifications);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String photoAsset,  String tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)?  $default,) {final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that.id,_that.name,_that.photoAsset,_that.tier,_that.totalPoints,_that.pointsToNextTier,_that.tierProgress,_that.unreadNotifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberDto implements MemberDto {
  const _MemberDto({required this.id, required this.name, required this.photoAsset, required this.tier, required this.totalPoints, required this.pointsToNextTier, required this.tierProgress, required this.unreadNotifications});
  factory _MemberDto.fromJson(Map<String, dynamic> json) => _$MemberDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String photoAsset;
@override final  String tier;
@override final  int totalPoints;
@override final  int pointsToNextTier;
@override final  double tierProgress;
@override final  int unreadNotifications;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberDtoCopyWith<_MemberDto> get copyWith => __$MemberDtoCopyWithImpl<_MemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.pointsToNextTier, pointsToNextTier) || other.pointsToNextTier == pointsToNextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.unreadNotifications, unreadNotifications) || other.unreadNotifications == unreadNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,photoAsset,tier,totalPoints,pointsToNextTier,tierProgress,unreadNotifications);
}

@override
String toString() {
    return 'MemberDto(id: $id, name: $name, photoAsset: $photoAsset, tier: $tier, totalPoints: $totalPoints, pointsToNextTier: $pointsToNextTier, tierProgress: $tierProgress, unreadNotifications: $unreadNotifications)';
}


}

/// @nodoc
abstract mixin class _$MemberDtoCopyWith<$Res> implements $MemberDtoCopyWith<$Res> {
  factory _$MemberDtoCopyWith(_MemberDto value, $Res Function(_MemberDto) _then) = __$MemberDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String photoAsset, String tier, int totalPoints, int pointsToNextTier, double tierProgress, int unreadNotifications
});




}
/// @nodoc
class __$MemberDtoCopyWithImpl<$Res>
    implements _$MemberDtoCopyWith<$Res> {
  __$MemberDtoCopyWithImpl(this._self, this._then);

  final _MemberDto _self;
  final $Res Function(_MemberDto) _then;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photoAsset = null,Object? tier = null,Object? totalPoints = null,Object? pointsToNextTier = null,Object? tierProgress = null,Object? unreadNotifications = null,}) {
  return _then(_MemberDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BannerDto {

 String get id; String? get badge; String get title; String get imageAsset; String? get imageUrl;
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDtoCopyWith<BannerDto> get copyWith => _$BannerDtoCopyWithImpl<BannerDto>(this as BannerDto, _$identity);

  /// Serializes this BannerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BannerDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.badge, _this.badge) || other.badge == _this.badge)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.imageAsset, _this.imageAsset) || other.imageAsset == _this.imageAsset)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BannerDto;
  return Object.hash(runtimeType,_this.id,_this.badge,_this.title,_this.imageAsset,_this.imageUrl);
}

@override
String toString() {
  final _this = this as BannerDto;
  return 'BannerDto(id: ${_this.id}, badge: ${_this.badge}, title: ${_this.title}, imageAsset: ${_this.imageAsset}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $BannerDtoCopyWith<$Res>  {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) _then) = _$BannerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? badge, String title, String imageAsset, String? imageUrl
});




}
/// @nodoc
class _$BannerDtoCopyWithImpl<$Res>
    implements $BannerDtoCopyWith<$Res> {
  _$BannerDtoCopyWithImpl(this._self, this._then);

  final BannerDto _self;
  final $Res Function(BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? badge = freezed,Object? title = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(BannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerDto].
extension BannerDtoPatterns on BannerDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerDto value)  $default,){
final _that = this;
switch (_that) {
case _BannerDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerDto value)?  $default,){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? badge,  String title,  String imageAsset,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.badge,_that.title,_that.imageAsset,_that.imageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? badge,  String title,  String imageAsset,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _BannerDto():
return $default(_that.id,_that.badge,_that.title,_that.imageAsset,_that.imageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? badge,  String title,  String imageAsset,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.badge,_that.title,_that.imageAsset,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerDto implements BannerDto {
  const _BannerDto({required this.id, this.badge, required this.title, required this.imageAsset, this.imageUrl});
  factory _BannerDto.fromJson(Map<String, dynamic> json) => _$BannerDtoFromJson(json);

@override final  String id;
@override final  String? badge;
@override final  String title;
@override final  String imageAsset;
@override final  String? imageUrl;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerDtoCopyWith<_BannerDto> get copyWith => __$BannerDtoCopyWithImpl<_BannerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,badge,title,imageAsset,imageUrl);
}

@override
String toString() {
    return 'BannerDto(id: $id, badge: $badge, title: $title, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$BannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory _$BannerDtoCopyWith(_BannerDto value, $Res Function(_BannerDto) _then) = __$BannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? badge, String title, String imageAsset, String? imageUrl
});




}
/// @nodoc
class __$BannerDtoCopyWithImpl<$Res>
    implements _$BannerDtoCopyWith<$Res> {
  __$BannerDtoCopyWithImpl(this._self, this._then);

  final _BannerDto _self;
  final $Res Function(_BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? badge = freezed,Object? title = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(_BannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductDto {

 String get id; String get code; String get name; int get priceMmk; bool get isNew; int? get discountPercent; String? get imageUrl; String get imageAsset; String get description;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.priceMmk, _this.priceMmk) || other.priceMmk == _this.priceMmk)&&(identical(other.isNew, _this.isNew) || other.isNew == _this.isNew)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.imageAsset, _this.imageAsset) || other.imageAsset == _this.imageAsset)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductDto;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.priceMmk,_this.isNew,_this.discountPercent,_this.imageUrl,_this.imageAsset,_this.description);
}

@override
String toString() {
  final _this = this as ProductDto;
  return 'ProductDto(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, priceMmk: ${_this.priceMmk}, isNew: ${_this.isNew}, discountPercent: ${_this.discountPercent}, imageUrl: ${_this.imageUrl}, imageAsset: ${_this.imageAsset}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, int? discountPercent, String? imageUrl, String imageAsset, String description
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? discountPercent = freezed,Object? imageUrl = freezed,Object? imageAsset = null,Object? description = null,}) {
  return _then(ProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDto].
extension ProductDtoPatterns on ProductDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String? imageUrl,  String imageAsset,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageUrl,_that.imageAsset,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String? imageUrl,  String imageAsset,  String description)  $default,) {final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageUrl,_that.imageAsset,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  int? discountPercent,  String? imageUrl,  String imageAsset,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.discountPercent,_that.imageUrl,_that.imageAsset,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDto implements ProductDto {
  const _ProductDto({required this.id, required this.code, required this.name, required this.priceMmk, required this.isNew, this.discountPercent, this.imageUrl, required this.imageAsset, required this.description});
  factory _ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  int priceMmk;
@override final  bool isNew;
@override final  int? discountPercent;
@override final  String? imageUrl;
@override final  String imageAsset;
@override final  String description;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDtoCopyWith<_ProductDto> get copyWith => __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceMmk, priceMmk) || other.priceMmk == priceMmk)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,priceMmk,isNew,discountPercent,imageUrl,imageAsset,description);
}

@override
String toString() {
    return 'ProductDto(id: $id, code: $code, name: $name, priceMmk: $priceMmk, isNew: $isNew, discountPercent: $discountPercent, imageUrl: $imageUrl, imageAsset: $imageAsset, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(_ProductDto value, $Res Function(_ProductDto) _then) = __$ProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, int? discountPercent, String? imageUrl, String imageAsset, String description
});




}
/// @nodoc
class __$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(this._self, this._then);

  final _ProductDto _self;
  final $Res Function(_ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? discountPercent = freezed,Object? imageUrl = freezed,Object? imageAsset = null,Object? description = null,}) {
  return _then(_ProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SectionDto {

 String get id; String get title; String get kind; List<String> get productIds;
/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDtoCopyWith<SectionDto> get copyWith => _$SectionDtoCopyWithImpl<SectionDto>(this as SectionDto, _$identity);

  /// Serializes this SectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SectionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&const DeepCollectionEquality().equals(other.productIds, _this.productIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SectionDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.kind,const DeepCollectionEquality().hash(_this.productIds));
}

@override
String toString() {
  final _this = this as SectionDto;
  return 'SectionDto(id: ${_this.id}, title: ${_this.title}, kind: ${_this.kind}, productIds: ${_this.productIds})';
}


}

/// @nodoc
abstract mixin class $SectionDtoCopyWith<$Res>  {
  factory $SectionDtoCopyWith(SectionDto value, $Res Function(SectionDto) _then) = _$SectionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String kind, List<String> productIds
});




}
/// @nodoc
class _$SectionDtoCopyWithImpl<$Res>
    implements $SectionDtoCopyWith<$Res> {
  _$SectionDtoCopyWithImpl(this._self, this._then);

  final SectionDto _self;
  final $Res Function(SectionDto) _then;

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? productIds = null,}) {
  return _then(SectionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,productIds: null == productIds ? _self.productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionDto].
extension SectionDtoPatterns on SectionDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionDto value)  $default,){
final _that = this;
switch (_that) {
case _SectionDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  List<String> productIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.productIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  List<String> productIds)  $default,) {final _that = this;
switch (_that) {
case _SectionDto():
return $default(_that.id,_that.title,_that.kind,_that.productIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String kind,  List<String> productIds)?  $default,) {final _that = this;
switch (_that) {
case _SectionDto() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.productIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionDto implements SectionDto {
  const _SectionDto({required this.id, required this.title, required this.kind, required  List<String> productIds}): _productIds = productIds;
  factory _SectionDto.fromJson(Map<String, dynamic> json) => _$SectionDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String kind;
 final  List<String> _productIds;
@override List<String> get productIds {
  if (_productIds is EqualUnmodifiableListView) return _productIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productIds);
}


/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionDtoCopyWith<_SectionDto> get copyWith => __$SectionDtoCopyWithImpl<_SectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.productIds, _productIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,kind,const DeepCollectionEquality().hash(_productIds));
}

@override
String toString() {
    return 'SectionDto(id: $id, title: $title, kind: $kind, productIds: $productIds)';
}


}

/// @nodoc
abstract mixin class _$SectionDtoCopyWith<$Res> implements $SectionDtoCopyWith<$Res> {
  factory _$SectionDtoCopyWith(_SectionDto value, $Res Function(_SectionDto) _then) = __$SectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String kind, List<String> productIds
});




}
/// @nodoc
class __$SectionDtoCopyWithImpl<$Res>
    implements _$SectionDtoCopyWith<$Res> {
  __$SectionDtoCopyWithImpl(this._self, this._then);

  final _SectionDto _self;
  final $Res Function(_SectionDto) _then;

/// Create a copy of SectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? productIds = null,}) {
  return _then(_SectionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,productIds: null == productIds ? _self._productIds : productIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ShopDto {

 String get id; String get name; String get address; String get imageAsset; String? get imageUrl;
/// Create a copy of ShopDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopDtoCopyWith<ShopDto> get copyWith => _$ShopDtoCopyWithImpl<ShopDto>(this as ShopDto, _$identity);

  /// Serializes this ShopDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShopDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.imageAsset, _this.imageAsset) || other.imageAsset == _this.imageAsset)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShopDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.address,_this.imageAsset,_this.imageUrl);
}

@override
String toString() {
  final _this = this as ShopDto;
  return 'ShopDto(id: ${_this.id}, name: ${_this.name}, address: ${_this.address}, imageAsset: ${_this.imageAsset}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $ShopDtoCopyWith<$Res>  {
  factory $ShopDtoCopyWith(ShopDto value, $Res Function(ShopDto) _then) = _$ShopDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String imageAsset, String? imageUrl
});




}
/// @nodoc
class _$ShopDtoCopyWithImpl<$Res>
    implements $ShopDtoCopyWith<$Res> {
  _$ShopDtoCopyWithImpl(this._self, this._then);

  final ShopDto _self;
  final $Res Function(ShopDto) _then;

/// Create a copy of ShopDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(ShopDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopDto].
extension ShopDtoPatterns on ShopDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopDto value)  $default,){
final _that = this;
switch (_that) {
case _ShopDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopDto value)?  $default,){
final _that = this;
switch (_that) {
case _ShopDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String imageAsset,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopDto() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.imageAsset,_that.imageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String imageAsset,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _ShopDto():
return $default(_that.id,_that.name,_that.address,_that.imageAsset,_that.imageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String imageAsset,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _ShopDto() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.imageAsset,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopDto implements ShopDto {
  const _ShopDto({required this.id, required this.name, required this.address, required this.imageAsset, this.imageUrl});
  factory _ShopDto.fromJson(Map<String, dynamic> json) => _$ShopDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String imageAsset;
@override final  String? imageUrl;

/// Create a copy of ShopDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopDtoCopyWith<_ShopDto> get copyWith => __$ShopDtoCopyWithImpl<_ShopDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,address,imageAsset,imageUrl);
}

@override
String toString() {
    return 'ShopDto(id: $id, name: $name, address: $address, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ShopDtoCopyWith<$Res> implements $ShopDtoCopyWith<$Res> {
  factory _$ShopDtoCopyWith(_ShopDto value, $Res Function(_ShopDto) _then) = __$ShopDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String imageAsset, String? imageUrl
});




}
/// @nodoc
class __$ShopDtoCopyWithImpl<$Res>
    implements _$ShopDtoCopyWith<$Res> {
  __$ShopDtoCopyWithImpl(this._self, this._then);

  final _ShopDto _self;
  final $Res Function(_ShopDto) _then;

/// Create a copy of ShopDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(_ShopDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChallengeDto {

 String get id; String get title; String get kind; int get current; int get target; int get rewardPoints;
/// Create a copy of ChallengeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeDtoCopyWith<ChallengeDto> get copyWith => _$ChallengeDtoCopyWithImpl<ChallengeDto>(this as ChallengeDto, _$identity);

  /// Serializes this ChallengeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChallengeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.rewardPoints, _this.rewardPoints) || other.rewardPoints == _this.rewardPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChallengeDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.kind,_this.current,_this.target,_this.rewardPoints);
}

@override
String toString() {
  final _this = this as ChallengeDto;
  return 'ChallengeDto(id: ${_this.id}, title: ${_this.title}, kind: ${_this.kind}, current: ${_this.current}, target: ${_this.target}, rewardPoints: ${_this.rewardPoints})';
}


}

/// @nodoc
abstract mixin class $ChallengeDtoCopyWith<$Res>  {
  factory $ChallengeDtoCopyWith(ChallengeDto value, $Res Function(ChallengeDto) _then) = _$ChallengeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String kind, int current, int target, int rewardPoints
});




}
/// @nodoc
class _$ChallengeDtoCopyWithImpl<$Res>
    implements $ChallengeDtoCopyWith<$Res> {
  _$ChallengeDtoCopyWithImpl(this._self, this._then);

  final ChallengeDto _self;
  final $Res Function(ChallengeDto) _then;

/// Create a copy of ChallengeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? current = null,Object? target = null,Object? rewardPoints = null,}) {
  return _then(ChallengeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeDto].
extension ChallengeDtoPatterns on ChallengeDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeDto value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  int current,  int target,  int rewardPoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeDto() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.current,_that.target,_that.rewardPoints);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  int current,  int target,  int rewardPoints)  $default,) {final _that = this;
switch (_that) {
case _ChallengeDto():
return $default(_that.id,_that.title,_that.kind,_that.current,_that.target,_that.rewardPoints);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String kind,  int current,  int target,  int rewardPoints)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeDto() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.current,_that.target,_that.rewardPoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeDto implements ChallengeDto {
  const _ChallengeDto({required this.id, required this.title, required this.kind, required this.current, required this.target, required this.rewardPoints});
  factory _ChallengeDto.fromJson(Map<String, dynamic> json) => _$ChallengeDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String kind;
@override final  int current;
@override final  int target;
@override final  int rewardPoints;

/// Create a copy of ChallengeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeDtoCopyWith<_ChallengeDto> get copyWith => __$ChallengeDtoCopyWithImpl<_ChallengeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.current, current) || other.current == current)&&(identical(other.target, target) || other.target == target)&&(identical(other.rewardPoints, rewardPoints) || other.rewardPoints == rewardPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,kind,current,target,rewardPoints);
}

@override
String toString() {
    return 'ChallengeDto(id: $id, title: $title, kind: $kind, current: $current, target: $target, rewardPoints: $rewardPoints)';
}


}

/// @nodoc
abstract mixin class _$ChallengeDtoCopyWith<$Res> implements $ChallengeDtoCopyWith<$Res> {
  factory _$ChallengeDtoCopyWith(_ChallengeDto value, $Res Function(_ChallengeDto) _then) = __$ChallengeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String kind, int current, int target, int rewardPoints
});




}
/// @nodoc
class __$ChallengeDtoCopyWithImpl<$Res>
    implements _$ChallengeDtoCopyWith<$Res> {
  __$ChallengeDtoCopyWithImpl(this._self, this._then);

  final _ChallengeDto _self;
  final $Res Function(_ChallengeDto) _then;

/// Create a copy of ChallengeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? current = null,Object? target = null,Object? rewardPoints = null,}) {
  return _then(_ChallengeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
