import '../../features/auth/domain/entities/session_status.dart';
import 'app_routes.dart';

/// Screens of the sign-in/registration flow a signed-in user must not see.
const Set<String> _entryRoutes = {
  AppRoutes.splash,
  AppRoutes.onboarding,
  AppRoutes.phone,
  AppRoutes.otp,
  AppRoutes.name,
  AppRoutes.dateOfBirth,
};

/// Screens reachable while signed out.
///
/// Welcome is included because registration only starts the session when the
/// user taps "Let's explore" there (see docs/auth-domain.md).
const Set<String> _publicRoutes = {
  AppRoutes.onboarding,
  AppRoutes.phone,
  AppRoutes.otp,
  AppRoutes.name,
  AppRoutes.dateOfBirth,
  AppRoutes.welcome,
};

/// Pure redirect rule: returns the path to go to, or null to stay.
///
/// Kept free of Flutter and Riverpod so every branch is unit-testable.
String? authRedirect({
  required SessionStatus status,
  required String location,
}) {
  return switch (status) {
    SessionStatus.unknown =>
      location == AppRoutes.splash ? null : AppRoutes.splash,
    SessionStatus.loggedOut => _redirectLoggedOut(location),
    SessionStatus.loggedIn =>
      _entryRoutes.contains(location) ? AppRoutes.home : null,
  };
}

String? _redirectLoggedOut(String location) {
  if (_publicRoutes.contains(location)) return null;
  return AppRoutes.onboarding;
}
