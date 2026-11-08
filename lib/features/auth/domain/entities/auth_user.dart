import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

/// A registered customer.
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String phoneE164,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  }) = _AuthUser;
}

/// What the registration form collects before an account exists.
@freezed
abstract class RegistrationData with _$RegistrationData {
  const factory RegistrationData({
    required String phoneE164,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  }) = _RegistrationData;
}

/// Outcome of a correct OTP: [existingUser] is set when the number already has
/// an account, which sends the user straight to Home.
@freezed
abstract class OtpVerification with _$OtpVerification {
  const factory OtpVerification({AuthUser? existingUser}) = _OtpVerification;
}
