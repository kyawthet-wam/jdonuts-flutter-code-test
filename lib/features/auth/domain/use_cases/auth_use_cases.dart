import '../../../../core/result/failure.dart';
import '../../../../core/result/result.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';
import '../validators/date_of_birth_validator.dart';
import '../validators/name_validator.dart';
import '../validators/otp_validator.dart';
import '../validators/phone_validator.dart';

/// Validates the phone number, then asks the repository to send a code.
///
/// Why a use case: validation belongs next to the rule, not in widgets, and
/// invalid input must never reach the repository.
class RequestOtp {
  const RequestOtp(this._repository);

  final AuthRepository _repository;

  Future<Result<String>> call(String rawPhone, AuthIntent intent) async {
    final e164 = toE164(rawPhone);
    if (e164 == null) return const Result.err(InvalidInputFailure());
    final sent = await _repository.requestOtp(phoneE164: e164, intent: intent);
    return sent.map((_) => e164);
  }
}

/// Validates the code's shape, then verifies it.
class VerifyOtp {
  const VerifyOtp(this._repository);

  final AuthRepository _repository;

  Future<Result<OtpVerification>> call(String phoneE164, String code) async {
    if (validateOtp(code) != null) {
      return const Result.err(InvalidInputFailure());
    }
    return _repository.verifyOtp(phoneE164: phoneE164, code: code);
  }
}

/// Validates the profile fields and creates the account.
class CompleteRegistration {
  const CompleteRegistration(this._repository, this._clock);

  final AuthRepository _repository;
  final DateTime Function() _clock;

  Future<Result<AuthUser>> call({
    required String phoneE164,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  }) {
    final invalid = _validate(firstName, lastName, dateOfBirth);
    if (invalid) return Future.value(const Result.err(InvalidInputFailure()));
    return _repository.completeRegistration(
      RegistrationData(
        phoneE164: phoneE164,
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        dateOfBirth: dateOfBirth,
      ),
    );
  }

  bool _validate(String first, String last, DateTime dob) {
    final dobError = validateDateOfBirth(
      year: dob.year,
      month: dob.month,
      day: dob.day,
      now: _clock(),
    );
    return validateFirstName(first) != null ||
        validateLastName(last) != null ||
        dobError != null;
  }
}
