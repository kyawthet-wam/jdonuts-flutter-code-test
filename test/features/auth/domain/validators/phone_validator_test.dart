import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/features/auth/domain/validators/phone_validator.dart';

void main() {
  group('normalizePhoneInput', () {
    test('removes one leading zero', () {
      expect(normalizePhoneInput('09254135592'), '9254135592');
    });

    test('removes spaces and dashes', () {
      expect(normalizePhoneInput('09 254-135 592'), '9254135592');
    });

    test('removes only a single leading zero', () {
      expect(normalizePhoneInput('0092541355'), '092541355');
    });
  });

  group('validatePhone', () {
    test('accepts a 9-digit local number with leading zero', () {
      expect(validatePhone('09254135592'), isNull);
    });

    test('accepts the shortest valid number (9 plus 7 digits)', () {
      expect(validatePhone('91234567'), isNull);
    });

    test('accepts the longest valid number (9 plus 9 digits)', () {
      expect(validatePhone('9123456789'), isNull);
    });

    test('rejects a number that is too short', () {
      expect(validatePhone('9123456'), PhoneError.invalidFormat);
    });

    test('rejects a number that is too long', () {
      expect(validatePhone('91234567890'), PhoneError.invalidFormat);
    });

    test('rejects a number not starting with 9', () {
      expect(validatePhone('08254135592'), PhoneError.invalidFormat);
    });

    test('rejects letters', () {
      expect(validatePhone('09abc135592'), PhoneError.invalidFormat);
    });

    test('reports empty input as empty', () {
      expect(validatePhone('  '), PhoneError.empty);
    });
  });

  group('toE164', () {
    test('formats the example from the brief', () {
      expect(toE164('09254135592'), '+959254135592');
    });

    test('returns null for an invalid number', () {
      expect(toE164('123'), isNull);
    });
  });
}
