import 'dart:convert';

import '../../../core/result/failure.dart';
import '../../../core/result/result.dart';
import '../../../core/storage/key_value_store.dart';
import '../domain/entities/auth_user.dart';
import '../domain/repositories/auth_repository.dart';

/// The only code the fake backend accepts.
const String fakeOtpCode = '123456';

/// Simulated network time so loading states are visible.
const Duration fakeAuthLatency = Duration(seconds: 1);

const String _usersKey = 'auth.users';
const String _sessionKey = 'auth.session_user_id';

/// Local stand-in for a real auth API; accounts live in [KeyValueStore].
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this._store, {this.latency = fakeAuthLatency});

  final KeyValueStore _store;
  final Duration latency;

  @override
  Future<Result<void>> requestOtp({
    required String phoneE164,
    required AuthIntent intent,
  }) {
    return _guard(() async {
      await Future<void>.delayed(latency);
      if (intent.isLogin && await _findByPhone(phoneE164) == null) {
        return const Result<void>.err(_notRegistered);
      }
      return const Result<void>.ok(null);
    });
  }

  @override
  Future<Result<OtpVerification>> verifyOtp({
    required String phoneE164,
    required String code,
  }) {
    return _guard(() async {
      await Future<void>.delayed(latency);
      if (code != fakeOtpCode) return const Result.err(_wrongCode);
      final existing = await _findByPhone(phoneE164);
      return Result.ok(OtpVerification(existingUser: existing));
    });
  }

  @override
  Future<Result<AuthUser>> completeRegistration(RegistrationData data) {
    return _guard(() async {
      await Future<void>.delayed(latency);
      final user = AuthUser(
        id: 'user_${data.phoneE164.replaceAll('+', '')}',
        phoneE164: data.phoneE164,
        firstName: data.firstName,
        lastName: data.lastName,
        dateOfBirth: data.dateOfBirth,
      );
      final users = await _readUsers();
      users[user.id] = user;
      await _writeUsers(users);
      return Result.ok(user);
    });
  }

  @override
  Future<Result<void>> startSession(AuthUser user) {
    return _guard(() async {
      await _store.write(_sessionKey, user.id);
      return const Result<void>.ok(null);
    });
  }

  @override
  Future<Result<AuthUser?>> restoreSession() {
    return _guard(() async {
      final id = await _store.read(_sessionKey);
      if (id == null) return const Result<AuthUser?>.ok(null);
      return Result.ok((await _readUsers())[id]);
    });
  }

  @override
  Future<Result<void>> signOut() {
    return _guard(() async {
      await _store.delete(_sessionKey);
      return const Result<void>.ok(null);
    });
  }

  Future<AuthUser?> _findByPhone(String phoneE164) async {
    final users = await _readUsers();
    return users.values.where((u) => u.phoneE164 == phoneE164).firstOrNull;
  }

  Future<Map<String, AuthUser>> _readUsers() async {
    final raw = await _store.read(_usersKey);
    if (raw == null) return {};
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map(
      (id, json) => MapEntry(id, _fromJson(json as Map<String, dynamic>)),
    );
  }

  Future<void> _writeUsers(Map<String, AuthUser> users) {
    final encoded = users.map((id, user) => MapEntry(id, _toJson(user)));
    return _store.write(_usersKey, jsonEncode(encoded));
  }

  /// Turns any storage error into a typed failure instead of throwing.
  Future<Result<T>> _guard<T>(Future<Result<T>> Function() action) async {
    try {
      return await action();
    } on Object catch (error) {
      return Result.err(StorageFailure('$error'));
    }
  }

  static const AuthFailure _notRegistered = AuthFailure(
    'Phone number is not registered',
    reason: AuthFailureReason.userNotFound,
  );
  static const AuthFailure _wrongCode = AuthFailure(
    'Incorrect code',
    reason: AuthFailureReason.invalidCode,
  );

  static Map<String, dynamic> _toJson(AuthUser u) => {
    'id': u.id,
    'phone': u.phoneE164,
    'firstName': u.firstName,
    'lastName': u.lastName,
    'dob': u.dateOfBirth.toIso8601String(),
  };

  static AuthUser _fromJson(Map<String, dynamic> j) => AuthUser(
    id: j['id'] as String,
    phoneE164: j['phone'] as String,
    firstName: j['firstName'] as String,
    lastName: j['lastName'] as String,
    dateOfBirth: DateTime.parse(j['dob'] as String),
  );
}
