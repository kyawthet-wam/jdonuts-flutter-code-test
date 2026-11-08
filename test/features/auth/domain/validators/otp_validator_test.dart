import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/features/auth/domain/validators/otp_validator.dart';

void main() {
  group('validateOtp', () {
    test('accepts exactly six digits', () {
      expect(validateOtp('123456'), isNull);
    });

    test('rejects fewer than six digits as incomplete', () {
      expect(validateOtp('12345'), OtpError.incomplete);
    });

    test('rejects an empty code as incomplete', () {
      expect(validateOtp(''), OtpError.incomplete);
    });

    test('rejects non-digits', () {
      expect(validateOtp('12a456'), OtpError.notNumeric);
    });
  });

  group('sanitizeOtpPaste', () {
    test('keeps digits only', () {
      expect(sanitizeOtpPaste('12 34-56'), '123456');
    });

    test('truncates to six digits', () {
      expect(sanitizeOtpPaste('12345678'), '123456');
    });

    test('returns empty for text without digits', () {
      expect(sanitizeOtpPaste('abc'), '');
    });
  });
}
