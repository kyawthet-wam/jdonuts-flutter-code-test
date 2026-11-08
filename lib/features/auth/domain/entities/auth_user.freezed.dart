// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthUser {

 String get id; String get phoneE164; String get firstName; String get lastName; DateTime get dateOfBirth;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuthUser;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.phoneE164, _this.phoneE164) || other.phoneE164 == _this.phoneE164)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth));
}


@override
int get hashCode {
  final _this = this as AuthUser;
  return Object.hash(runtimeType,_this.id,_this.phoneE164,_this.firstName,_this.lastName,_this.dateOfBirth);
}

@override
String toString() {
  final _this = this as AuthUser;
  return 'AuthUser(id: ${_this.id}, phoneE164: ${_this.phoneE164}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, dateOfBirth: ${_this.dateOfBirth})';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
 String id, String phoneE164, String firstName, String lastName, DateTime dateOfBirth
});




}
/// @nodoc
class _$AuthUserCopyWithImpl<$Res>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._self, this._then);

  final AuthUser _self;
  final $Res Function(AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phoneE164 = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,}) {
  return _then(AuthUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phoneE164: null == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUser].
extension AuthUserPatterns on AuthUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.id,_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)  $default,) {final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that.id,_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)?  $default,) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.id,_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
  return null;

}
}

}

/// @nodoc


class _AuthUser implements AuthUser {
  const _AuthUser({required this.id, required this.phoneE164, required this.firstName, required this.lastName, required this.dateOfBirth});
  

@override final  String id;
@override final  String phoneE164;
@override final  String firstName;
@override final  String lastName;
@override final  DateTime dateOfBirth;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserCopyWith<_AuthUser> get copyWith => __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneE164, phoneE164) || other.phoneE164 == phoneE164)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,phoneE164,firstName,lastName,dateOfBirth);
}

@override
String toString() {
    return 'AuthUser(id: $id, phoneE164: $phoneE164, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String phoneE164, String firstName, String lastName, DateTime dateOfBirth
});




}
/// @nodoc
class __$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(this._self, this._then);

  final _AuthUser _self;
  final $Res Function(_AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phoneE164 = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,}) {
  return _then(_AuthUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phoneE164: null == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$RegistrationData {

 String get phoneE164; String get firstName; String get lastName; DateTime get dateOfBirth;
/// Create a copy of RegistrationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationDataCopyWith<RegistrationData> get copyWith => _$RegistrationDataCopyWithImpl<RegistrationData>(this as RegistrationData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RegistrationData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationData&&(identical(other.phoneE164, _this.phoneE164) || other.phoneE164 == _this.phoneE164)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth));
}


@override
int get hashCode {
  final _this = this as RegistrationData;
  return Object.hash(runtimeType,_this.phoneE164,_this.firstName,_this.lastName,_this.dateOfBirth);
}

@override
String toString() {
  final _this = this as RegistrationData;
  return 'RegistrationData(phoneE164: ${_this.phoneE164}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, dateOfBirth: ${_this.dateOfBirth})';
}


}

/// @nodoc
abstract mixin class $RegistrationDataCopyWith<$Res>  {
  factory $RegistrationDataCopyWith(RegistrationData value, $Res Function(RegistrationData) _then) = _$RegistrationDataCopyWithImpl;
@useResult
$Res call({
 String phoneE164, String firstName, String lastName, DateTime dateOfBirth
});




}
/// @nodoc
class _$RegistrationDataCopyWithImpl<$Res>
    implements $RegistrationDataCopyWith<$Res> {
  _$RegistrationDataCopyWithImpl(this._self, this._then);

  final RegistrationData _self;
  final $Res Function(RegistrationData) _then;

/// Create a copy of RegistrationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneE164 = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,}) {
  return _then(RegistrationData(
phoneE164: null == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationData].
extension RegistrationDataPatterns on RegistrationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationData value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationData value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationData() when $default != null:
return $default(_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)  $default,) {final _that = this;
switch (_that) {
case _RegistrationData():
return $default(_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneE164,  String firstName,  String lastName,  DateTime dateOfBirth)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationData() when $default != null:
return $default(_that.phoneE164,_that.firstName,_that.lastName,_that.dateOfBirth);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationData implements RegistrationData {
  const _RegistrationData({required this.phoneE164, required this.firstName, required this.lastName, required this.dateOfBirth});
  

@override final  String phoneE164;
@override final  String firstName;
@override final  String lastName;
@override final  DateTime dateOfBirth;

/// Create a copy of RegistrationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationDataCopyWith<_RegistrationData> get copyWith => __$RegistrationDataCopyWithImpl<_RegistrationData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationData&&(identical(other.phoneE164, phoneE164) || other.phoneE164 == phoneE164)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode {
    return Object.hash(runtimeType,phoneE164,firstName,lastName,dateOfBirth);
}

@override
String toString() {
    return 'RegistrationData(phoneE164: $phoneE164, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class _$RegistrationDataCopyWith<$Res> implements $RegistrationDataCopyWith<$Res> {
  factory _$RegistrationDataCopyWith(_RegistrationData value, $Res Function(_RegistrationData) _then) = __$RegistrationDataCopyWithImpl;
@override @useResult
$Res call({
 String phoneE164, String firstName, String lastName, DateTime dateOfBirth
});




}
/// @nodoc
class __$RegistrationDataCopyWithImpl<$Res>
    implements _$RegistrationDataCopyWith<$Res> {
  __$RegistrationDataCopyWithImpl(this._self, this._then);

  final _RegistrationData _self;
  final $Res Function(_RegistrationData) _then;

/// Create a copy of RegistrationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneE164 = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,}) {
  return _then(_RegistrationData(
phoneE164: null == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$OtpVerification {

 AuthUser? get existingUser;
/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpVerificationCopyWith<OtpVerification> get copyWith => _$OtpVerificationCopyWithImpl<OtpVerification>(this as OtpVerification, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OtpVerification;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerification&&(identical(other.existingUser, _this.existingUser) || other.existingUser == _this.existingUser));
}


@override
int get hashCode {
  final _this = this as OtpVerification;
  return Object.hash(runtimeType,_this.existingUser);
}

@override
String toString() {
  final _this = this as OtpVerification;
  return 'OtpVerification(existingUser: ${_this.existingUser})';
}


}

/// @nodoc
abstract mixin class $OtpVerificationCopyWith<$Res>  {
  factory $OtpVerificationCopyWith(OtpVerification value, $Res Function(OtpVerification) _then) = _$OtpVerificationCopyWithImpl;
@useResult
$Res call({
 AuthUser? existingUser
});


$AuthUserCopyWith<$Res>? get existingUser;

}
/// @nodoc
class _$OtpVerificationCopyWithImpl<$Res>
    implements $OtpVerificationCopyWith<$Res> {
  _$OtpVerificationCopyWithImpl(this._self, this._then);

  final OtpVerification _self;
  final $Res Function(OtpVerification) _then;

/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? existingUser = freezed,}) {
  return _then(OtpVerification(
existingUser: freezed == existingUser ? _self.existingUser : existingUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,
  ));
}
/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get existingUser {
    if (_self.existingUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.existingUser!, (value) {
    return _then(_self.copyWith(existingUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [OtpVerification].
extension OtpVerificationPatterns on OtpVerification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpVerification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpVerification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpVerification value)  $default,){
final _that = this;
switch (_that) {
case _OtpVerification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpVerification value)?  $default,){
final _that = this;
switch (_that) {
case _OtpVerification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthUser? existingUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpVerification() when $default != null:
return $default(_that.existingUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthUser? existingUser)  $default,) {final _that = this;
switch (_that) {
case _OtpVerification():
return $default(_that.existingUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthUser? existingUser)?  $default,) {final _that = this;
switch (_that) {
case _OtpVerification() when $default != null:
return $default(_that.existingUser);case _:
  return null;

}
}

}

/// @nodoc


class _OtpVerification implements OtpVerification {
  const _OtpVerification({this.existingUser});
  

@override final  AuthUser? existingUser;

/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpVerificationCopyWith<_OtpVerification> get copyWith => __$OtpVerificationCopyWithImpl<_OtpVerification>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerification&&(identical(other.existingUser, existingUser) || other.existingUser == existingUser));
}


@override
int get hashCode {
    return Object.hash(runtimeType,existingUser);
}

@override
String toString() {
    return 'OtpVerification(existingUser: $existingUser)';
}


}

/// @nodoc
abstract mixin class _$OtpVerificationCopyWith<$Res> implements $OtpVerificationCopyWith<$Res> {
  factory _$OtpVerificationCopyWith(_OtpVerification value, $Res Function(_OtpVerification) _then) = __$OtpVerificationCopyWithImpl;
@override @useResult
$Res call({
 AuthUser? existingUser
});


@override $AuthUserCopyWith<$Res>? get existingUser;

}
/// @nodoc
class __$OtpVerificationCopyWithImpl<$Res>
    implements _$OtpVerificationCopyWith<$Res> {
  __$OtpVerificationCopyWithImpl(this._self, this._then);

  final _OtpVerification _self;
  final $Res Function(_OtpVerification) _then;

/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? existingUser = freezed,}) {
  return _then(_OtpVerification(
existingUser: freezed == existingUser ? _self.existingUser : existingUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,
  ));
}

/// Create a copy of OtpVerification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get existingUser {
    if (_self.existingUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.existingUser!, (value) {
    return _then(_self.copyWith(existingUser: value));
  });
}
}

// dart format on
