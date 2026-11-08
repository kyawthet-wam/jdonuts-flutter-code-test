import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/result/failure.dart';
import 'package:jdonuts/core/storage/key_value_store.dart';
import 'package:jdonuts/features/auth/data/fake_auth_repository.dart';
import 'package:jdonuts/features/auth/domain/entities/auth_user.dart';
import 'package:jdonuts/features/auth/domain/repositories/auth_repository.dart';

const _phone = '+959254135592';

final _registration = RegistrationData(
  phoneE164: _phone,
  firstName: 'Ye Min',
  lastName: 'Phyoe Win',
  dateOfBirth: DateTime(1980, 5, 1),
);

FakeAuthRepository _repo(KeyValueStore store) =>
    FakeAuthRepository(store, latency: Duration.zero);

void main() {
  late InMemoryKeyValueStore store;
  late FakeAuthRepository repo;

  setUp(() {
    store = InMemoryKeyValueStore();
    repo = _repo(store);
  });

  test(
    'login for a number that never registered fails with userNotFound',
    () async {
      final result = await repo.requestOtp(
        phoneE164: _phone,
        intent: AuthIntent.login,
      );

      final failure = result.failureOrNull! as AuthFailure;
      expect(failure.reason.isUserNotFound, isTrue);
    },
  );

  test('registering with an unknown number sends a code', () async {
    final result = await repo.requestOtp(
      phoneE164: _phone,
      intent: AuthIntent.register,
    );

    expect(result.isOk, isTrue);
  });

  test('a wrong code fails with invalidCode', () async {
    final result = await repo.verifyOtp(phoneE164: _phone, code: '000000');

    final failure = result.failureOrNull! as AuthFailure;
    expect(failure.reason.isInvalidCode, isTrue);
  });

  test(
    'the fake code verifies a new number without an existing user',
    () async {
      final result = await repo.verifyOtp(phoneE164: _phone, code: fakeOtpCode);

      expect(result.valueOrNull!.existingUser, isNull);
    },
  );

  test(
    'after registration the same number logs in as an existing user',
    () async {
      await repo.completeRegistration(_registration);

      final login = await repo.requestOtp(
        phoneE164: _phone,
        intent: AuthIntent.login,
      );
      final verified = await repo.verifyOtp(
        phoneE164: _phone,
        code: fakeOtpCode,
      );

      expect(login.isOk, isTrue);
      expect(verified.valueOrNull!.existingUser!.firstName, 'Ye Min');
    },
  );

  test('registration alone does not start a session', () async {
    await repo.completeRegistration(_registration);

    expect((await repo.restoreSession()).valueOrNull, isNull);
  });

  test(
    'a started session survives a relaunch (new repository instance)',
    () async {
      final user = (await repo.completeRegistration(_registration))
          .valueOrNull!;
      await repo.startSession(user);

      final restored = await _repo(store).restoreSession();

      expect(restored.valueOrNull, user);
    },
  );

  test('signing out clears the session', () async {
    final user = (await repo.completeRegistration(_registration)).valueOrNull!;
    await repo.startSession(user);

    await repo.signOut();

    expect((await repo.restoreSession()).valueOrNull, isNull);
  });

  test('registering the same number twice keeps a single account', () async {
    await repo.completeRegistration(_registration);
    final again = await repo.completeRegistration(
      _registration.copyWith(firstName: 'Aye'),
    );

    final verified = await repo.verifyOtp(phoneE164: _phone, code: fakeOtpCode);
    expect(again.isOk, isTrue);
    expect(verified.valueOrNull!.existingUser!.firstName, 'Aye');
  });
}
