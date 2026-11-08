import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/router/app_routes.dart';
import 'package:jdonuts/core/router/auth_redirect.dart';
import 'package:jdonuts/features/auth/domain/entities/session_status.dart';

String? _go(SessionStatus status, String location) =>
    authRedirect(status: status, location: location);

void main() {
  group('while the session is loading', () {
    test('every route redirects to splash', () {
      expect(_go(SessionStatus.unknown, AppRoutes.home), AppRoutes.splash);
    });

    test('splash stays put', () {
      expect(_go(SessionStatus.unknown, AppRoutes.splash), isNull);
    });
  });

  group('when logged out', () {
    test('splash resolves to onboarding', () {
      expect(
        _go(SessionStatus.loggedOut, AppRoutes.splash),
        AppRoutes.onboarding,
      );
    });

    test('registration steps are reachable', () {
      for (final path in [
        AppRoutes.onboarding,
        AppRoutes.phone,
        AppRoutes.otp,
        AppRoutes.name,
        AppRoutes.dateOfBirth,
        AppRoutes.welcome,
      ]) {
        expect(_go(SessionStatus.loggedOut, path), isNull, reason: path);
      }
    });

    test('app screens redirect to onboarding', () {
      for (final path in [
        AppRoutes.home,
        AppRoutes.rewards,
        AppRoutes.settings,
        AppRoutes.product('p_coconut'),
      ]) {
        expect(
          _go(SessionStatus.loggedOut, path),
          AppRoutes.onboarding,
          reason: path,
        );
      }
    });
  });

  group('when logged in', () {
    test('entry screens redirect to home', () {
      for (final path in [
        AppRoutes.splash,
        AppRoutes.onboarding,
        AppRoutes.phone,
        AppRoutes.otp,
        AppRoutes.name,
        AppRoutes.dateOfBirth,
      ]) {
        expect(_go(SessionStatus.loggedIn, path), AppRoutes.home, reason: path);
      }
    });

    test('welcome is allowed so registration can finish', () {
      expect(_go(SessionStatus.loggedIn, AppRoutes.welcome), isNull);
    });

    test('app screens are allowed', () {
      for (final path in [
        AppRoutes.home,
        AppRoutes.rewards,
        AppRoutes.product('p_coconut'),
      ]) {
        expect(_go(SessionStatus.loggedIn, path), isNull, reason: path);
      }
    });
  });
}
