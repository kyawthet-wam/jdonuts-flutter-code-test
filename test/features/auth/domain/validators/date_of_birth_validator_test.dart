import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/features/auth/domain/validators/date_of_birth_validator.dart';

void main() {
  final now = DateTime(2026, 11, 8);

  DateOfBirthError? check(int? y, int? m, int? d) =>
      validateDateOfBirth(year: y, month: m, day: d, now: now);

  group('validateDateOfBirth', () {
    test('accepts the design example 1 May 1980', () {
      expect(check(1980, 5, 1), isNull);
    });

    test('requires all three fields', () {
      expect(check(1980, 5, null), DateOfBirthError.incomplete);
    });

    test('rejects 31 April', () {
      expect(check(1990, 4, 31), DateOfBirthError.invalidDate);
    });

    test('rejects 29 February in a non-leap year', () {
      expect(check(2001, 2, 29), DateOfBirthError.invalidDate);
    });

    test('accepts 29 February in a leap year', () {
      expect(check(2000, 2, 29), isNull);
    });

    test('rejects month 13', () {
      expect(check(1990, 13, 1), DateOfBirthError.invalidDate);
    });

    test('rejects a year before the earliest allowed', () {
      expect(check(earliestBirthYear - 1, 1, 1), DateOfBirthError.invalidDate);
    });

    test('rejects a future date', () {
      expect(check(2027, 1, 1), DateOfBirthError.inFuture);
    });

    test('rejects someone one day short of the minimum age', () {
      final year = now.year - minimumRegistrationAge;
      expect(check(year, 11, 9), DateOfBirthError.tooYoung);
    });

    test('accepts someone exactly at the minimum age today', () {
      final year = now.year - minimumRegistrationAge;
      expect(check(year, 11, 8), isNull);
    });
  });
}
