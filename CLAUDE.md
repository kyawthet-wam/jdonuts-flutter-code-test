# CLAUDE.md

@.claude/rules/flutter-style.md

J'Donuts customer app (Senior Flutter code test). Offline-first, Riverpod, Drift, go_router.

## Toolchain (fvm)

Always use `fvm flutter` / `fvm dart`, never the global `flutter`. SDK is pinned in `.fvmrc`.
Record the exact Flutter/Dart versions in README.md.

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs   # after changing @freezed/@riverpod/drift/json files
fvm flutter gen-l10n                                            # after editing lib/l10n/*.arb
fvm flutter analyze                                             # must stay clean
fvm flutter test
fvm flutter test integration_test
fvm flutter run
fvm flutter build apk --release
fvm flutter build ios --simulator
dart run tool/mock_server/bin/server.dart                       # optional mock /v1 server
```

## Architecture

Feature-first under `lib/features/{auth,home,product,rewards}`, each with `presentation/`, `domain/`, `data/`.
Shared code in `lib/core/` (theme tokens, motion, router, l10n, connectivity, image cache, Result/Failure, network).

- Domain: pure Dart, NO Flutter imports. Entities, use cases, repository interfaces, validators (pure functions).
- Data implements domain interfaces. The UI reads ONLY the local Drift database; the mock server (Dio) just refreshes it.
- Repositories return `Result<T, Failure>`; no swallowed exceptions. Every screen has loading, error and empty states.
- State: hooks_riverpod 3.x + riverpod_annotation/generator (`@riverpod`). DI via providers; no services created in widgets.
  Use `HookConsumerWidget` for forms/animations (flutter_hooks). Logic stays in notifiers/domain, not hooks.
- Navigation: go_router with a working auth redirect guard (`refreshListenable`) and `/product/:id`.
- Session: flutter_secure_storage. Auth sits behind `AuthRepository` with a fake impl (~1s delay, local store).
- Dio client is simple: timeouts, retry (backoff, idempotent only), debug logging. No token refresh.

## Conventions (from the test brief)

- No hard-coded colours/text styles/spacing in widgets: design tokens in one theme.
- Strings via ARB + gen-l10n (Burmese is out of scope unless asked).
- All animation durations/curves are named constants in one motion file. Respect `MediaQuery.disableAnimations`.
- Functions ~20 lines max, files ~300 lines, no magic numbers, descriptive names.
- Models immutable (freezed + json_serializable). Never edit generated files (*.g.dart, *.freezed.dart).
- Fixed values: fake OTP `123456`; min age 13 as a named constant; phone `+95` then 9 followed by 7-9 digits.
- One member record feeds both Home and Rewards.
- Layout: portrait phones 4.7-6.9", text scale up to 1.3 without overflow. Target 60 fps (RepaintBoundary on painters).

## Rules

- Do NOT commit the design PDF or screenshots (client property).
- Small, readable commits. Commit only when asked or at agreed build milestones.
- Run `fvm flutter analyze` and tests before each commit.
