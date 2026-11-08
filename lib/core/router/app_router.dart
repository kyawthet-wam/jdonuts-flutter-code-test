import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/entities/session_status.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/date_of_birth_screen.dart';
import '../../features/auth/presentation/screens/name_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/phone_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/product/presentation/product_detail_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import 'app_routes.dart';
import 'app_shell.dart';
import 'auth_redirect.dart';
import 'page_transitions.dart';
import 'placeholder_screen.dart';

part 'app_router.g.dart';

/// The one router instance.
///
/// Why keepAlive and a ValueNotifier: rebuilding the router on every session
/// change would reset the navigation stack. Instead the session status feeds
/// `refreshListenable`, which only re-runs the redirect.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final status = ValueNotifier<SessionStatus>(ref.read(sessionStatusProvider));
  ref.listen(sessionStatusProvider, (_, next) => status.value = next);

  final router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: status,
    redirect: (_, state) =>
        authRedirect(status: status.value, location: state.matchedLocation),
    routes: _routes,
  );
  ref.onDispose(() {
    router.dispose();
    status.dispose();
  });
  return router;
}

Widget _placeholder(String title) => PlaceholderScreen(title: title);

final List<RouteBase> _routes = [
  _page(AppRoutes.splash, fadePage, const SplashScreen()),
  _page(AppRoutes.onboarding, fadePage, const OnboardingScreen()),
  _page(AppRoutes.phone, stepPage, const PhoneScreen()),
  _page(AppRoutes.otp, stepPage, const OtpScreen()),
  _page(AppRoutes.name, stepPage, const NameScreen()),
  _page(AppRoutes.dateOfBirth, stepPage, const DateOfBirthScreen()),
  _page(AppRoutes.welcome, fadePage, const WelcomeScreen()),
  GoRoute(
    path: AppRoutes.productPattern,
    builder: (_, state) => ProductDetailScreen(
      id: state.pathParameters['id']!,
      heroTag: state.extra as String?,
    ),
  ),
  StatefulShellRoute.indexedStack(
    builder: (_, _, shell) => AppShell(navigationShell: shell),
    branches: [
      _branch(AppRoutes.home, (_) => const HomeScreen()),
      _branch(AppRoutes.rewards, (_) => _placeholder('rewards')),
      _branch(AppRoutes.explore, (_) => _placeholder('explore')),
      _branch(AppRoutes.wallet, (_) => _placeholder('wallet')),
      _branch(AppRoutes.settings, (_) => const SettingsScreen()),
    ],
  ),
];

typedef _PageBuilder = Page<void> Function(
  BuildContext context,
  GoRouterState state,
  Widget child,
);

GoRoute _page(String path, _PageBuilder page, Widget screen) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => page(context, state, screen),
  );
}

StatefulShellBranch _branch(String path, WidgetBuilder builder) {
  return StatefulShellBranch(
    routes: [GoRoute(path: path, builder: (context, _) => builder(context))],
  );
}
