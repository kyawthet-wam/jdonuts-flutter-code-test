import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/features/auth/domain/validators/name_validator.dart';

void main() {
  group('validateFirstName', () {
    test('accepts a Latin name with a space', () {
      expect(validateFirstName('Ye Min'), isNull);
    });

    test('accepts Myanmar script', () {
      expect(validateFirstName('မောင်မောင်'), isNull);
    });

    test('requires a value', () {
      expect(validateFirstName('   '), NameError.empty);
    });

    test('rejects digits', () {
      expect(validateFirstName('Ye2'), NameError.invalidCharacters);
    });

    test('rejects punctuation', () {
      expect(validateFirstName('Ye!'), NameError.invalidCharacters);
    });

    test('accepts exactly 50 characters after trimming', () {
      expect(validateFirstName('  ${'a' * maxNameLength}  '), isNull);
    });

    test('rejects 51 characters', () {
      expect(validateFirstName('a' * (maxNameLength + 1)), NameError.tooLong);
    });
  });

  group('validateLastName', () {
    test('is optional', () {
      expect(validateLastName(''), isNull);
    });

    test('applies the same character rules when provided', () {
      expect(validateLastName('Win9'), NameError.invalidCharacters);
    });

    test('accepts Myanmar script', () {
      expect(validateLastName('ဖြိုးဝင်း'), isNull);
    });
  });
}
