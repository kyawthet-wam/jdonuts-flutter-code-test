# J'Donuts: Flutter code test

An offline-first slice of the J'Donuts customer app: onboarding with fake login and registration (real validation), Home and Product detail from a local database, and an animated Rewards screen.

| | |
|---|---|
| Flutter | **3.47.9** (stable), pinned with [fvm](https://fvm.app) in `.fvmrc` |
| Dart | **3.13.7** |
| Platforms | Android and iOS (portrait only) |
| Backend | none required; an optional local mock server is included |
| Time spent | _fill in before sending_ |

## Run it

```bash
dart pub global activate fvm        # or: brew install fvm
fvm install                         # installs the pinned Flutter
fvm flutter pub get                 # generated files (freezed, drift, riverpod) are committed
fvm flutter run                     # pick an iOS simulator or Android emulator
```

**Fake OTP code: `123456`.** Any other 6-digit code is wrong; three wrong codes lock entry until Resend.

Phone numbers: type `09254135592` (spaces and dashes are fine) and it becomes `+959254135592`. To test **login**, register a number first, log out from the Settings tab, then log in with it. An unregistered number shows an inline message with a link to register.

### Tests and analysis

```bash
fvm flutter analyze                                      # clean
fvm flutter test                                         # unit + widget tests
fvm flutter test integration_test -d <simulator-id>      # Register -> Home -> Product, log out/in
```

If you change annotated classes (freezed, drift, riverpod): `fvm dart run build_runner build -d`. After editing `lib/l10n/*.arb`: `fvm flutter gen-l10n`.

### Builds

```bash
fvm flutter build apk --release                   # build/app/outputs/flutter-apk/app-release.apk
fvm flutter build ios --simulator                 # build/ios/iphonesimulator/Runner.app
```

## Architecture

Feature-first folders, each split into `presentation / domain / data`. The domain layer is pure Dart (no Flutter imports); data implements the domain's interfaces; the UI never touches a service directly.

```
lib/
  core/          theme tokens, motion constants, router + auth guard, l10n helpers,
                 Result/Failure, Drift database, seed + sync, network, connectivity,
                 shared widgets (buttons, fields, shimmer, bottom nav, ...)
  features/
    auth/        phone -> OTP -> name -> date of birth -> welcome; validators, fake repository
    home/        banners, product sections, nearby shops
    product/     product detail, cart
    rewards/     points ring, tier ladder, challenges
    member/      the single member record shared by Home and Rewards
    settings/    Log out
```

```
UI (Riverpod notifiers/providers) -> use cases / repository interfaces (domain)
                                          ^ implemented by
                    repositories (Drift, fake auth)  ->  local DB, mock server, secure storage
```

Highlights:
- **Typed errors:** repositories return `Result<T>` with a sealed `Failure`; nothing is swallowed. Every screen and section has loading, error and empty states.
- **Pure validators** in `features/auth/domain/validators/` (phone, OTP, names including Myanmar script, date of birth with a named minimum age), each unit tested.
- **Design tokens** (colours, type, spacing) live in `core/theme`; no hard-coded colours in widgets. Strings are in `lib/l10n/app_en.arb` (gen-l10n).
- **All motion constants** (durations, curves) are in one file: `core/motion/app_motion.dart`.
- Short design notes per feature are in [`docs/`](docs): [plan](docs/plan.md), [validation](docs/auth-validation.md), [auth domain](docs/auth-domain.md), [auth UI](docs/auth-ui.md), [routing and session](docs/routing-and-session.md), [offline data](docs/offline-data.md), [Home and Product](docs/home-and-product.md), [Rewards](docs/rewards.md).

## State management: Riverpod

`hooks_riverpod 3` with `@riverpod` code generation, plus `flutter_hooks` for forms and animation controllers.

- **It fits the offline-first design.** Drift exposes `Stream`s; providers turn them into `AsyncValue`, which gives loading, data and error states directly, one provider per Home section so each fails on its own.
- **Dependency injection is built in.** Providers replace a service locator, nothing is created inside a widget, and swapping `FakeAuthRepository` for a real API is one provider override. Tests override providers instead of mocking.
- **Compile-time safety and little boilerplate** compared with BLoC's event/state classes.
- **Trade-off:** it is harder to read for people who don't know Riverpod, and BLoC gives stricter event traceability. Riverpod 3 and its generator 4 are new, so I used only stable APIs (no experimental mutations or offline persistence).
- Logic stays in notifiers and pure domain code; hooks only manage widget-local things (text controllers, animation controllers, timers).

## Offline strategy

The UI reads **only** the local Drift (SQLite) database, so the whole app, images included, works in airplane mode from the first launch.

- **Seed:** `assets/seed/seed.json` is written to the database on first launch in a single transaction (members, banners, products, sections, shops, challenges). It reseeds only if the bundled `version` is newer.
- **Versioned migrations:** schema v1 = catalog tables, v2 = persistent cart. A test upgrades a hand-built v1 database and checks nothing is lost.
- **One member record** feeds Home and Rewards, so tier and points can never disagree (the mock-ups did).
- **Images:** bundled PNGs always work offline; an optional `imageUrl` is cached on disk by `cached_network_image`, with the bundled art as placeholder and error state.
- **Refresh:** when the device comes back online (and on pull-to-refresh) the app fetches the catalog and replaces the database rows in one transaction; screens repaint from their streams. Failures never block the UI. An offline banner shows while there is no connection, and connectivity combines `connectivity_plus` with a real reachability check.
- **Optional mock server** (no packages needed):
  ```bash
  dart run tool/mock_server/bin/server.dart              # http://localhost:8080
  fvm flutter run --dart-define=API_BASE_URL=http://localhost:8080   # Android emulator: http://10.0.2.2:8080
  ```
  It serves `GET /v1/catalog` in a `{data, error, meta}` envelope plus the images. Each fetch bumps the member's notification count so a refresh is visible. Dio has timeouts, retry with backoff (idempotent requests only) and debug logging. Without `API_BASE_URL` refresh is a no-op and the app is fully usable.

## Animations built

- **Onboarding:** five donut circles drift in one after another; title, buttons, social icons and footer enter staggered.
- **Registration:** shared-axis slide between steps; the progress ring sweeps 25 -> 50 -> 75 -> 100% and morphs into a check; inputs animate focus and error; OTP boxes shake and clear on a wrong code; buttons scale on press and Continue morphs into a spinner.
- **Welcome:** four tiles slide in staggered, then the title fades up.
- **Home:** shimmer skeletons, staggered sections, auto-playing banner carousel, Hero from tile to detail.
- **Product detail:** the quantity number scales and fades on change; the total updates live.
- **Rewards:** `CustomPainter` points ring sweeping while the total counts up to 680,000; tier ladder appearing in order with the connecting line filling; sliding tab indicator with a slide/fade card switch; staggered challenge cards with painted progress art (donut colours in by quarters, coffee arc to 9/12); Earn button pulses a few times when a challenge is complete; the Rewards badge pops in.
- **Bottom navigation:** one pink pill slides between tabs.
- **Reduce Motion** (`MediaQuery.disableAnimations`) is respected everywhere: animations skip to their final state.

## Tests

Unit tests for validators, use cases, the fake repository, sync, retry and the redirect guard; widget tests for login and registration validation, Home, Product detail, Rewards, the bottom bar and motion; layout tests at text scale 1.3 on small and large phones; integration tests for Register -> Home -> Product detail and Register -> Log out -> Log in.

## Known gaps

- **Artwork and fonts are placeholders.** The client's photos were not available, so donuts, boxes, banners and shops are drawn (`tool/build_seed_assets.sh`), the font is the platform default, and the Home shops block has no cloud/grass illustration. Social icons are simple logo shapes.
- **Gift tab has no design**, so it shows a short message. Explore and Wallet tabs are placeholders, as allowed.
- **60 fps in profile mode on a mid-range Android phone is not measured.** Painters sit in `RepaintBoundary`s and only painted widgets rebuild per frame, but I have not profiled on a device.
- **Layout is tested at 1.3x text on 360x640 and 440x956**, not on every size in the 4.7"-6.9" range.
- No Burmese locale and no CI (both optional).
- Resend after a lock is available immediately (the brief says Resend becomes active at 0:00; waiting 5 minutes while locked seemed unhelpful).
- The release build is https-only; the http mock server works in debug/profile builds and the iOS simulator.
