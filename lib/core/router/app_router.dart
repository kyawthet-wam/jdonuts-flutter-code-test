import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/entities/session_status.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/settings/presentation/settings_screen.dart';
import 'app_routes.dart';
import 'app_shell.dart';
import 'auth_redirect.dart';
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
  _screen(AppRoutes.splash, 'splash'),
  _screen(AppRoutes.onboarding, 'onboarding'),
  _screen(AppRoutes.phone, 'phone'),
  _screen(AppRoutes.otp, 'otp'),
  _screen(AppRoutes.name, 'name'),
  _screen(AppRoutes.dateOfBirth, 'date of birth'),
  _screen(AppRoutes.welcome, 'welcome'),
  GoRoute(
    path: AppRoutes.productPattern,
    builder: (_, state) =>
        _placeholder('product ${state.pathParameters['id']}'),
  ),
  StatefulShellRoute.indexedStack(
    builder: (_, _, shell) => AppShell(navigationShell: shell),
    branches: [
      _branch(AppRoutes.home, (_) => _placeholder('home')),
      _branch(AppRoutes.rewards, (_) => _placeholder('rewards')),
      _branch(AppRoutes.explore, (_) => _placeholder('explore')),
      _branch(AppRoutes.wallet, (_) => _placeholder('wallet')),
      _branch(AppRoutes.settings, (_) => const SettingsScreen()),
    ],
  ),
];

GoRoute _screen(String path, String title) =>
    GoRoute(path: path, builder: (_, _) => _placeholder(title));

StatefulShellBranch _branch(String path, WidgetBuilder builder) {
  return StatefulShellBranch(
    routes: [GoRoute(path: path, builder: (context, _) => builder(context))],
  );
}
