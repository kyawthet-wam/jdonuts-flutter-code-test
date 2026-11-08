// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationFlowState {

 AuthIntent get intent; String get phoneInput; String? get phoneE164; String get firstName; String get lastName; int? get dobMonth; String get dobDay; String get dobYear; bool get isBusy; int get wrongOtpCount; AuthUser? get registeredUser;
/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationFlowStateCopyWith<RegistrationFlowState> get copyWith => _$RegistrationFlowStateCopyWithImpl<RegistrationFlowState>(this as RegistrationFlowState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RegistrationFlowState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationFlowState&&(identical(other.intent, _this.intent) || other.intent == _this.intent)&&(identical(other.phoneInput, _this.phoneInput) || other.phoneInput == _this.phoneInput)&&(identical(other.phoneE164, _this.phoneE164) || other.phoneE164 == _this.phoneE164)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.dobMonth, _this.dobMonth) || other.dobMonth == _this.dobMonth)&&(identical(other.dobDay, _this.dobDay) || other.dobDay == _this.dobDay)&&(identical(other.dobYear, _this.dobYear) || other.dobYear == _this.dobYear)&&(identical(other.isBusy, _this.isBusy) || other.isBusy == _this.isBusy)&&(identical(other.wrongOtpCount, _this.wrongOtpCount) || other.wrongOtpCount == _this.wrongOtpCount)&&(identical(other.registeredUser, _this.registeredUser) || other.registeredUser == _this.registeredUser));
}


@override
int get hashCode {
  final _this = this as RegistrationFlowState;
  return Object.hash(runtimeType,_this.intent,_this.phoneInput,_this.phoneE164,_this.firstName,_this.lastName,_this.dobMonth,_this.dobDay,_this.dobYear,_this.isBusy,_this.wrongOtpCount,_this.registeredUser);
}

@override
String toString() {
  final _this = this as RegistrationFlowState;
  return 'RegistrationFlowState(intent: ${_this.intent}, phoneInput: ${_this.phoneInput}, phoneE164: ${_this.phoneE164}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, dobMonth: ${_this.dobMonth}, dobDay: ${_this.dobDay}, dobYear: ${_this.dobYear}, isBusy: ${_this.isBusy}, wrongOtpCount: ${_this.wrongOtpCount}, registeredUser: ${_this.registeredUser})';
}


}

/// @nodoc
abstract mixin class $RegistrationFlowStateCopyWith<$Res>  {
  factory $RegistrationFlowStateCopyWith(RegistrationFlowState value, $Res Function(RegistrationFlowState) _then) = _$RegistrationFlowStateCopyWithImpl;
@useResult
$Res call({
 AuthIntent intent, String phoneInput, String? phoneE164, String firstName, String lastName, int? dobMonth, String dobDay, String dobYear, bool isBusy, int wrongOtpCount, AuthUser? registeredUser
});


$AuthUserCopyWith<$Res>? get registeredUser;

}
/// @nodoc
class _$RegistrationFlowStateCopyWithImpl<$Res>
    implements $RegistrationFlowStateCopyWith<$Res> {
  _$RegistrationFlowStateCopyWithImpl(this._self, this._then);

  final RegistrationFlowState _self;
  final $Res Function(RegistrationFlowState) _then;

/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intent = null,Object? phoneInput = null,Object? phoneE164 = freezed,Object? firstName = null,Object? lastName = null,Object? dobMonth = freezed,Object? dobDay = null,Object? dobYear = null,Object? isBusy = null,Object? wrongOtpCount = null,Object? registeredUser = freezed,}) {
  return _then(RegistrationFlowState(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as AuthIntent,phoneInput: null == phoneInput ? _self.phoneInput : phoneInput // ignore: cast_nullable_to_non_nullable
as String,phoneE164: freezed == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dobMonth: freezed == dobMonth ? _self.dobMonth : dobMonth // ignore: cast_nullable_to_non_nullable
as int?,dobDay: null == dobDay ? _self.dobDay : dobDay // ignore: cast_nullable_to_non_nullable
as String,dobYear: null == dobYear ? _self.dobYear : dobYear // ignore: cast_nullable_to_non_nullable
as String,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,wrongOtpCount: null == wrongOtpCount ? _self.wrongOtpCount : wrongOtpCount // ignore: cast_nullable_to_non_nullable
as int,registeredUser: freezed == registeredUser ? _self.registeredUser : registeredUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,
  ));
}
/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get registeredUser {
    if (_self.registeredUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.registeredUser!, (value) {
    return _then(_self.copyWith(registeredUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegistrationFlowState].
extension RegistrationFlowStatePatterns on RegistrationFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationFlowState value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthIntent intent,  String phoneInput,  String? phoneE164,  String firstName,  String lastName,  int? dobMonth,  String dobDay,  String dobYear,  bool isBusy,  int wrongOtpCount,  AuthUser? registeredUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationFlowState() when $default != null:
return $default(_that.intent,_that.phoneInput,_that.phoneE164,_that.firstName,_that.lastName,_that.dobMonth,_that.dobDay,_that.dobYear,_that.isBusy,_that.wrongOtpCount,_that.registeredUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthIntent intent,  String phoneInput,  String? phoneE164,  String firstName,  String lastName,  int? dobMonth,  String dobDay,  String dobYear,  bool isBusy,  int wrongOtpCount,  AuthUser? registeredUser)  $default,) {final _that = this;
switch (_that) {
case _RegistrationFlowState():
return $default(_that.intent,_that.phoneInput,_that.phoneE164,_that.firstName,_that.lastName,_that.dobMonth,_that.dobDay,_that.dobYear,_that.isBusy,_that.wrongOtpCount,_that.registeredUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthIntent intent,  String phoneInput,  String? phoneE164,  String firstName,  String lastName,  int? dobMonth,  String dobDay,  String dobYear,  bool isBusy,  int wrongOtpCount,  AuthUser? registeredUser)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationFlowState() when $default != null:
return $default(_that.intent,_that.phoneInput,_that.phoneE164,_that.firstName,_that.lastName,_that.dobMonth,_that.dobDay,_that.dobYear,_that.isBusy,_that.wrongOtpCount,_that.registeredUser);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationFlowState extends RegistrationFlowState {
  const _RegistrationFlowState({this.intent = AuthIntent.register, this.phoneInput = '', this.phoneE164, this.firstName = '', this.lastName = '', this.dobMonth, this.dobDay = '', this.dobYear = '', this.isBusy = false, this.wrongOtpCount = 0, this.registeredUser}): super._();
  

@override@JsonKey() final  AuthIntent intent;
@override@JsonKey() final  String phoneInput;
@override final  String? phoneE164;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override final  int? dobMonth;
@override@JsonKey() final  String dobDay;
@override@JsonKey() final  String dobYear;
@override@JsonKey() final  bool isBusy;
@override@JsonKey() final  int wrongOtpCount;
@override final  AuthUser? registeredUser;

/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationFlowStateCopyWith<_RegistrationFlowState> get copyWith => __$RegistrationFlowStateCopyWithImpl<_RegistrationFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationFlowState&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.phoneInput, phoneInput) || other.phoneInput == phoneInput)&&(identical(other.phoneE164, phoneE164) || other.phoneE164 == phoneE164)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dobMonth, dobMonth) || other.dobMonth == dobMonth)&&(identical(other.dobDay, dobDay) || other.dobDay == dobDay)&&(identical(other.dobYear, dobYear) || other.dobYear == dobYear)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.wrongOtpCount, wrongOtpCount) || other.wrongOtpCount == wrongOtpCount)&&(identical(other.registeredUser, registeredUser) || other.registeredUser == registeredUser));
}


@override
int get hashCode {
    return Object.hash(runtimeType,intent,phoneInput,phoneE164,firstName,lastName,dobMonth,dobDay,dobYear,isBusy,wrongOtpCount,registeredUser);
}

@override
String toString() {
    return 'RegistrationFlowState(intent: $intent, phoneInput: $phoneInput, phoneE164: $phoneE164, firstName: $firstName, lastName: $lastName, dobMonth: $dobMonth, dobDay: $dobDay, dobYear: $dobYear, isBusy: $isBusy, wrongOtpCount: $wrongOtpCount, registeredUser: $registeredUser)';
}


}

/// @nodoc
abstract mixin class _$RegistrationFlowStateCopyWith<$Res> implements $RegistrationFlowStateCopyWith<$Res> {
  factory _$RegistrationFlowStateCopyWith(_RegistrationFlowState value, $Res Function(_RegistrationFlowState) _then) = __$RegistrationFlowStateCopyWithImpl;
@override @useResult
$Res call({
 AuthIntent intent, String phoneInput, String? phoneE164, String firstName, String lastName, int? dobMonth, String dobDay, String dobYear, bool isBusy, int wrongOtpCount, AuthUser? registeredUser
});


@override $AuthUserCopyWith<$Res>? get registeredUser;

}
/// @nodoc
class __$RegistrationFlowStateCopyWithImpl<$Res>
    implements _$RegistrationFlowStateCopyWith<$Res> {
  __$RegistrationFlowStateCopyWithImpl(this._self, this._then);

  final _RegistrationFlowState _self;
  final $Res Function(_RegistrationFlowState) _then;

/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intent = null,Object? phoneInput = null,Object? phoneE164 = freezed,Object? firstName = null,Object? lastName = null,Object? dobMonth = freezed,Object? dobDay = null,Object? dobYear = null,Object? isBusy = null,Object? wrongOtpCount = null,Object? registeredUser = freezed,}) {
  return _then(_RegistrationFlowState(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as AuthIntent,phoneInput: null == phoneInput ? _self.phoneInput : phoneInput // ignore: cast_nullable_to_non_nullable
as String,phoneE164: freezed == phoneE164 ? _self.phoneE164 : phoneE164 // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dobMonth: freezed == dobMonth ? _self.dobMonth : dobMonth // ignore: cast_nullable_to_non_nullable
as int?,dobDay: null == dobDay ? _self.dobDay : dobDay // ignore: cast_nullable_to_non_nullable
as String,dobYear: null == dobYear ? _self.dobYear : dobYear // ignore: cast_nullable_to_non_nullable
as String,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,wrongOtpCount: null == wrongOtpCount ? _self.wrongOtpCount : wrongOtpCount // ignore: cast_nullable_to_non_nullable
as int,registeredUser: freezed == registeredUser ? _self.registeredUser : registeredUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,
  ));
}

/// Create a copy of RegistrationFlowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get registeredUser {
    if (_self.registeredUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.registeredUser!, (value) {
    return _then(_self.copyWith(registeredUser: value));
  });
}
}

// dart format on
