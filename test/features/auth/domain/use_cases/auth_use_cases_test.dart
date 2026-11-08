import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/result/failure.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/features/auth/data/fake_auth_repository.dart';
import 'package:jdonuts/features/auth/domain/repositories/auth_repository.dart';
import 'package:jdonuts/features/auth/domain/use_cases/auth_use_cases.dart';

final _now = DateTime(2026, 11, 8);

void main() {
  late FakeAuthRepository repo;

  setUp(() {
    repo = FakeAuthRepository(InMemoryKeyValueStore(), latency: Duration.zero);
  });

  group('RequestOtp', () {
    test('returns the normalised E.164 number on success', () async {
      final result = await RequestOtp(repo)(
        '09 254-135 592',
        AuthIntent.register,
      );

      expect(result.valueOrNull, '+959254135592');
    });

    test('rejects an invalid number as invalid input', () async {
      final result = await RequestOtp(repo)('123', AuthIntent.register);

      expect(result.failureOrNull, isA<InvalidInputFailure>());
    });

    test(
      'surfaces userNotFound when logging in with an unknown number',
      () async {
        final result = await RequestOtp(repo)('09254135592', AuthIntent.login);

        expect(
          (result.failureOrNull! as AuthFailure).reason.isUserNotFound,
          isTrue,
        );
      },
    );
  });

  group('VerifyOtp', () {
    test('rejects a code that is not six digits', () async {
      final result = await VerifyOtp(repo)('+959254135592', '123');

      expect(result.failureOrNull, isA<InvalidInputFailure>());
    });

    test('accepts the fake code', () async {
      final result = await VerifyOtp(repo)('+959254135592', fakeOtpCode);

      expect(result.isOk, isTrue);
    });

    test('rejects a wrong six-digit code', () async {
      final result = await VerifyOtp(repo)('+959254135592', '654321');

      expect(
        (result.failureOrNull! as AuthFailure).reason.isInvalidCode,
        isTrue,
      );
    });
  });

  group('CompleteRegistration', () {
    Future<dynamic> register({
      String first = 'Ye Min',
      String last = '',
      DateTime? dob,
    }) {
      return CompleteRegistration(repo, () => _now)(
        phoneE164: '+959254135592',
        firstName: first,
        lastName: last,
        dateOfBirth: dob ?? DateTime(1980, 5, 1),
      );
    }

    test('creates an account without a last name', () async {
      final result = await register();

      expect(result.isOk, isTrue);
    });

    test('trims the names it stores', () async {
      final result = await register(first: '  Ye Min ', last: ' Win ');

      expect(result.valueOrNull.firstName, 'Ye Min');
      expect(result.valueOrNull.lastName, 'Win');
    });

    test('rejects a missing first name', () async {
      expect(
        (await register(first: ' ')).failureOrNull,
        isA<InvalidInputFailure>(),
      );
    });

    test('rejects a user younger than the minimum age', () async {
      final result = await register(dob: DateTime(2020, 1, 1));

      expect(result.failureOrNull, isA<InvalidInputFailure>());
    });
  });
}
