// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Member {

 String get id; String get name; String get photoAsset; MemberTier get tier; int get totalPoints; int get pointsToNextTier;/// 0..1 progress through the current tier.
 double get tierProgress; int get unreadNotifications;
/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberCopyWith<Member> get copyWith => _$MemberCopyWithImpl<Member>(this as Member, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Member;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Member&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.photoAsset, _this.photoAsset) || other.photoAsset == _this.photoAsset)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.totalPoints, _this.totalPoints) || other.totalPoints == _this.totalPoints)&&(identical(other.pointsToNextTier, _this.pointsToNextTier) || other.pointsToNextTier == _this.pointsToNextTier)&&(identical(other.tierProgress, _this.tierProgress) || other.tierProgress == _this.tierProgress)&&(identical(other.unreadNotifications, _this.unreadNotifications) || other.unreadNotifications == _this.unreadNotifications));
}


@override
int get hashCode {
  final _this = this as Member;
  return Object.hash(runtimeType,_this.id,_this.name,_this.photoAsset,_this.tier,_this.totalPoints,_this.pointsToNextTier,_this.tierProgress,_this.unreadNotifications);
}

@override
String toString() {
  final _this = this as Member;
  return 'Member(id: ${_this.id}, name: ${_this.name}, photoAsset: ${_this.photoAsset}, tier: ${_this.tier}, totalPoints: ${_this.totalPoints}, pointsToNextTier: ${_this.pointsToNextTier}, tierProgress: ${_this.tierProgress}, unreadNotifications: ${_this.unreadNotifications})';
}


}

/// @nodoc
abstract mixin class $MemberCopyWith<$Res>  {
  factory $MemberCopyWith(Member value, $Res Function(Member) _then) = _$MemberCopyWithImpl;
@useResult
$Res call({
 String id, String name, String photoAsset, MemberTier tier, int totalPoints, int pointsToNextTier, double tierProgress, int unreadNotifications
});




}
/// @nodoc
class _$MemberCopyWithImpl<$Res>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._self, this._then);

  final Member _self;
  final $Res Function(Member) _then;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photoAsset = null,Object? tier = null,Object? totalPoints = null,Object? pointsToNextTier = null,Object? tierProgress = null,Object? unreadNotifications = null,}) {
  return _then(Member(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as MemberTier,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Member].
extension MemberPatterns on Member {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Member value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Member() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Member value)  $default,){
final _that = this;
switch (_that) {
case _Member():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Member value)?  $default,){
final _that = this;
switch (_that) {
case _Member() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String photoAsset,  MemberTier tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Member() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String photoAsset,  MemberTier tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)  $default,) {final _that = this;
switch (_that) {
case _Member():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String photoAsset,  MemberTier tier,  int totalPoints,  int pointsToNextTier,  double tierProgress,  int unreadNotifications)?  $default,) {final _that = this;
switch (_that) {
case _Member() when $default != null:
return $default(_that.id,_that.name,_that.photoAsset,_that.tier,_that.totalPoints,_that.pointsToNextTier,_that.tierProgress,_that.unreadNotifications);case _:
  return null;

}
}

}

/// @nodoc


class _Member implements Member {
  const _Member({required this.id, required this.name, required this.photoAsset, required this.tier, required this.totalPoints, required this.pointsToNextTier, required this.tierProgress, required this.unreadNotifications});
  

@override final  String id;
@override final  String name;
@override final  String photoAsset;
@override final  MemberTier tier;
@override final  int totalPoints;
@override final  int pointsToNextTier;
/// 0..1 progress through the current tier.
@override final  double tierProgress;
@override final  int unreadNotifications;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberCopyWith<_Member> get copyWith => __$MemberCopyWithImpl<_Member>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Member&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoAsset, photoAsset) || other.photoAsset == photoAsset)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.pointsToNextTier, pointsToNextTier) || other.pointsToNextTier == pointsToNextTier)&&(identical(other.tierProgress, tierProgress) || other.tierProgress == tierProgress)&&(identical(other.unreadNotifications, unreadNotifications) || other.unreadNotifications == unreadNotifications));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,photoAsset,tier,totalPoints,pointsToNextTier,tierProgress,unreadNotifications);
}

@override
String toString() {
    return 'Member(id: $id, name: $name, photoAsset: $photoAsset, tier: $tier, totalPoints: $totalPoints, pointsToNextTier: $pointsToNextTier, tierProgress: $tierProgress, unreadNotifications: $unreadNotifications)';
}


}

/// @nodoc
abstract mixin class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) _then) = __$MemberCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String photoAsset, MemberTier tier, int totalPoints, int pointsToNextTier, double tierProgress, int unreadNotifications
});




}
/// @nodoc
class __$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(this._self, this._then);

  final _Member _self;
  final $Res Function(_Member) _then;

/// Create a copy of Member
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photoAsset = null,Object? tier = null,Object? totalPoints = null,Object? pointsToNextTier = null,Object? tierProgress = null,Object? unreadNotifications = null,}) {
  return _then(_Member(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoAsset: null == photoAsset ? _self.photoAsset : photoAsset // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as MemberTier,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,tierProgress: null == tierProgress ? _self.tierProgress : tierProgress // ignore: cast_nullable_to_non_nullable
as double,unreadNotifications: null == unreadNotifications ? _self.unreadNotifications : unreadNotifications // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
