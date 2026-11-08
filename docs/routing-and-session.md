# Routing and session

**Why**: one router, created once, whose redirect reacts to the session without rebuilding the navigation stack.

- `SessionNotifier` (keepAlive `AsyncNotifier<AuthUser?>`) restores the stored session on launch; `signIn` / `signOut` call the repository and update state. A failed restore counts as logged out so the user never sticks on splash.
- `sessionStatusProvider` reduces it to `SessionStatus {unknown, loggedOut, loggedIn}`.
- `appRouterProvider` feeds that status into a `ValueNotifier` used as `refreshListenable`; `redirect` calls the pure `authRedirect(status, location)` in `core/router/auth_redirect.dart`.
- Rules: unknown -> splash; logged out -> only onboarding/phone/otp/name/dob/welcome; logged in -> entry screens redirect to Home (Welcome stays reachable so registration can finish).
- Nobody navigates after login/logout by hand: starting or clearing the session triggers the redirect. Exception: the Welcome screen (session starts there) and in-flow `go`/`push` between registration steps.
- Tabs: `StatefulShellRoute.indexedStack` with Home, Rewards, Explore, Wallet, Settings. Explore and Wallet are `PlaceholderScreen`; Settings holds Log out. `/product/:id` sits outside the shell.

Tests: `test/core/router/auth_redirect_test.dart` (every rule), `session_routing_test.dart` (real router: relaunch logged out/in, log out from Settings). Widget tests that use the fake repository need `tester.runAsync` for setup because `Future.delayed` never fires in fake-async time.
