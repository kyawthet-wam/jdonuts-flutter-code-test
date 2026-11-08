// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeBanner {

 String get id; String? get badge; String get title; String get imageAsset; String? get imageUrl;
/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBannerCopyWith<HomeBanner> get copyWith => _$HomeBannerCopyWithImpl<HomeBanner>(this as HomeBanner, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeBanner;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBanner&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.badge, _this.badge) || other.badge == _this.badge)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.imageAsset, _this.imageAsset) || other.imageAsset == _this.imageAsset)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}


@override
int get hashCode {
  final _this = this as HomeBanner;
  return Object.hash(runtimeType,_this.id,_this.badge,_this.title,_this.imageAsset,_this.imageUrl);
}

@override
String toString() {
  final _this = this as HomeBanner;
  return 'HomeBanner(id: ${_this.id}, badge: ${_this.badge}, title: ${_this.title}, imageAsset: ${_this.imageAsset}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $HomeBannerCopyWith<$Res>  {
  factory $HomeBannerCopyWith(HomeBanner value, $Res Function(HomeBanner) _then) = _$HomeBannerCopyWithImpl;
@useResult
$Res call({
 String id, String? badge, String title, String imageAsset, String? imageUrl
});




}
/// @nodoc
class _$HomeBannerCopyWithImpl<$Res>
    implements $HomeBannerCopyWith<$Res> {
  _$HomeBannerCopyWithImpl(this._self, this._then);

  final HomeBanner _self;
  final $Res Function(HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? badge = freezed,Object? title = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeBanner].
extension HomeBannerPatterns on HomeBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBanner value)  $default,){
final _that = this;
switch (_that) {
case _HomeBanner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBanner value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
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
case _HomeBanner() when $default != null:
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
case _HomeBanner():
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
case _HomeBanner() when $default != null:
return $default(_that.id,_that.badge,_that.title,_that.imageAsset,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _HomeBanner implements HomeBanner {
  const _HomeBanner({required this.id, this.badge, required this.title, required this.imageAsset, this.imageUrl});
  

@override final  String id;
@override final  String? badge;
@override final  String title;
@override final  String imageAsset;
@override final  String? imageUrl;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBannerCopyWith<_HomeBanner> get copyWith => __$HomeBannerCopyWithImpl<_HomeBanner>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,badge,title,imageAsset,imageUrl);
}

@override
String toString() {
    return 'HomeBanner(id: $id, badge: $badge, title: $title, imageAsset: $imageAsset, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HomeBannerCopyWith<$Res> implements $HomeBannerCopyWith<$Res> {
  factory _$HomeBannerCopyWith(_HomeBanner value, $Res Function(_HomeBanner) _then) = __$HomeBannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String? badge, String title, String imageAsset, String? imageUrl
});




}
/// @nodoc
class __$HomeBannerCopyWithImpl<$Res>
    implements _$HomeBannerCopyWith<$Res> {
  __$HomeBannerCopyWithImpl(this._self, this._then);

  final _HomeBanner _self;
  final $Res Function(_HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? badge = freezed,Object? title = null,Object? imageAsset = null,Object? imageUrl = freezed,}) {
  return _then(_HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageAsset: null == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
