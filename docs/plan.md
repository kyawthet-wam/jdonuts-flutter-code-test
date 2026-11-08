# Build plan: J'Donuts (Senior Flutter code test)

Source brief: Madivizion_Flutter_Code_Test.pdf (client-owned; never commit it or the design screenshots).
Time allowed: 2 days from receipt (received 2026-11-07).

## Decisions (agreed with the user)

| Area | Decision |
|---|---|
| Toolchain | fvm, Flutter 3.47.9 / Dart 3.13.7 pinned in `.fvmrc`. Always `fvm flutter` / `fvm dart`. |
| State + DI | hooks_riverpod 3.5 + riverpod_annotation 4 + riverpod_generator 4 (`@riverpod`). Riverpod 3 removed `AutoDispose*Ref`, `FutureProviderRef`, `valueOrNull`; legacy providers live in `legacy.dart` (don't use). |
| Forms/animation | flutter_hooks (`HookConsumerWidget`, `useTextEditingController`, `useAnimationController`). Logic stays in notifiers/domain. |
| Models | freezed + json_serializable |
| Database | Drift (SQLite), versioned migrations, seeded from bundled JSON on first launch. The UI reads only the DB. |
| Network | Optional local mock server (`tool/mock_server`, `/v1`, `{data, error, meta}`). Dio client is simple: timeouts, retry with backoff (idempotent only), debug logging. No token refresh. |
| Errors | Repositories return `Result<T, Failure>` (sealed `Failure`). No swallowed exceptions. Every screen has loading/error/empty states. |
| Navigation | go_router, working auth redirect guard via `refreshListenable`, `/product/:id`. Router created once (keepAlive). |
| Session | flutter_secure_storage |
| Images | cached_network_image (disk cache) + seed images bundled as assets; placeholder + error widgets. Visuals are generated placeholders (no client assets available). |
| Cart | Persisted in Drift (bonus). |
| Text | ARB + gen-l10n (English). Burmese locale and CI are NOT in scope. |
| Git | Local commits only; user pushes. Small readable commits. |

## Architecture

`lib/features/{auth,home,product,rewards}/{presentation,domain,data}` + `lib/core/` (theme tokens, motion, router, l10n, connectivity, images, result/failure, network, database).
Domain is pure Dart. Data implements domain interfaces. See `CLAUDE.md` and `.claude/rules/flutter-style.md` for conventions (private widgets via `part`/`part of`, enums with bool getters, `///` why-comments, feature docs in `docs/`).

## Auth reference decisions (from reviewing ~/Development/royal_win)

- Keep: typed errors, single provided client, isolated Dio.
- Fix: no shared mutable headers; typed Result instead of throwing strings; working redirect guard (royal_win's is commented out); motion constants in one file; no pagination (not needed by the designs).
- Redirect rules: session unknown -> splash; logged out -> only onboarding/phone/OTP/name/dob; logged in -> auth routes redirect to Home, except mid-registration (name, dob, welcome). Log out clears secure storage and the guard redirects; no manual navigation.

## Task requirements checklist

### Task 1: fake login/registration with real validation
- `AuthRepository` interface + fake impl (~1s delay, local user store, secure session).
- Register: Phone -> OTP -> Name -> DOB -> Welcome -> Home. Log in: Phone -> OTP -> Home; an unregistered number gets an inline message with a link to register.
- Session: relaunch logged in -> Home; logged out -> Onboarding. Log out row in Settings tab.
- Back arrow returns to previous step and keeps input.
- Google/Apple/Facebook/Terms/Privacy: placeholder sheet or snackbar.
- Validators = pure functions in domain with unit tests:
  - Phone: after +95 strip spaces, dashes, one leading 0; must be 9 followed by 7-9 digits (09254135592 -> +959254135592). Continue disabled; inline message on focus loss.
  - OTP: 6 digits, `123456` passes. Wrong: boxes shake and clear, message under boxes, 3 wrong codes lock until Resend.
  - OTP input: auto-advance, backspace moves back, paste fills 6, numeric keyboard, SMS autofill hint.
  - Resend: countdown from 5:00, active at 0:00, restarts timer.
  - First name: required, 1-50 chars trimmed, letters and spaces incl. Myanmar script, no digits. Last name: optional, same rules.
  - DOB: real calendar date (29 Feb only in leap years), not in future, age >= 13 (named constant).
  - Every step: Continue shows loading during fake call; double tap sends one request.

### Task 2: Home + Product detail, offline data
- All data local (products, banners, sections, shops, member), seeded from bundled JSON.
- Works fully in airplane mode after first launch (Home, Product detail, Rewards, images).
- Refresh in background on network return and on pull-to-refresh; small offline banner.
- One member record for every screen (Home and Rewards must agree).
- Home: header (member name+photo, tier, "points left to next tier", bell with count), auto-playing banner carousel, horizontal lists (Seasonal specials, Popular, Order again) with discount badges, 4 nearby shop cards (Explore now / Order online are visual only), skeletons while loading, per-section empty and error states, staggered section entrance.
- Product detail: every tile opens `/product/:id`; code, name, price in MMK with thousands separators (3,200 MMK), New badge, image (Hero), "What's this?" description; stepper min 1 with animated number; Add to cart shows live total (qty x price); visual feedback; cart persisted.
- Product JSON shape: `{id, code, name, priceMmk, isNew, discountPercent, imageUrl, description}`.

### Task 3: Rewards (motion)
- Points ring sweeps 0 -> member progress while total counts up to 680,000 (CustomPainter).
- Tier ladder: Silver, Gold, Platinum appear in order; current tier highlighted; line to next tier fills.
- Tabs "Eat more earn more" / "Gift": moving indicator, card list transitions. Gift tab content is a simple placeholder (no design).
- Challenge cards enter staggered; donut colours in by quarters (1/4, 4/4); coffee arc fills 9/12.
- Earn button: active with attention cue when complete (4/4), grey otherwise; press feedback, no action.
- Rewards badge (3) pops in. Bottom nav pill slides between Home and Reward (other 3 icons -> simple placeholder; Settings tab holds Log out).

### Animations (minimum)
Onboarding: donuts drift in, title/buttons staggered. Registration: shared-axis/slide between steps; ring 25 -> 50 -> 75 -> 100% then morphs to check. Inputs: focus/error animate, OTP shake. Buttons: scale on press, Continue morphs to loading. Welcome: tiles slide in staggered, title fades up. Home: skeleton shimmer, staggered sections, banner auto-play. Product: Hero + quantity animation. Tab switch: pill slides, Rewards entrance.
- 60 fps profile mode (RepaintBoundary on painters), respect `MediaQuery.disableAnimations`, all durations/curves as named constants in one motion file, prefer Flutter's own animation APIs.

### Technical requirements
Theme tokens only (no hard-coded colours in widgets); strings in ARB; portrait 4.7-6.9", text scale up to 1.3 without overflow; `flutter analyze` clean; functions ~20 lines, files ~300 (UI files 200-250), named constants, no magic numbers.
Tests: unit (validators, use cases), widget (login/registration validation), one integration test Register -> Home -> Product detail; behaviour-describing names.

## Build order (small commits)

1. [x] Scaffold, CLAUDE.md, style rules, fvm pin, gitignore.
2. [x] Dependencies + analyzer (riverpod_lint plugin; no custom_lint), l10n, folders.
3. [x] Core foundations: design tokens/theme, motion file, Result/Failure, app shell (ProviderScope, theme, l10n).
4. [x] Task 1 domain: validators + unit tests.
5. [~] Task 1 auth. Done: repository, use cases, fake impl, secure session, session notifier, router + redirect guard (+ tests), placeholder screens. TODO: real screens 1-7 (shared widgets, onboarding, phone, OTP input, name, dob, welcome), registration flow state, progress ring, widget tests.
6. [ ] Data layer: Drift schema + migrations, JSON seed, image assets, repositories, connectivity, background refresh, optional mock server + Dio client.
7. [ ] Task 2: Home, Product detail, cart.
8. [ ] Task 3: Rewards painters, animations, bottom nav.
9. [ ] Motion pass across the flow + Reduce Motion.
10. [ ] Tests (unit/widget/integration), analyze clean, text scale 1.3 check.
11. [ ] Delivery: release APK, iOS simulator .app zip, README (run steps, Flutter/Dart versions, architecture + folder map, Riverpod rationale, offline strategy, animations, fake OTP `123456`, known gaps, time spent, links to docs/), feature docs in `docs/`.

User tasks: screen recording (2-4 min: register, log out, log in, Home, Product, Rewards, repeat in airplane mode), push to public repo, accept Android licences (`fvm flutter doctor --android-licenses`), email submission.

## Evaluation weights (from the brief)
Offline data 20, Motion/presentation 20, Architecture/code quality 20, UI fidelity 15, Validation/flow 10, Tests 10, Delivery 5. Auto-fail: doesn't build from README steps, crashes in main flow, or data hard-coded inside widgets.

## Environment notes
- Dart MCP server configured in `.mcp.json` (ignored by git; optional, not needed: analyze/test/run via `fvm` in the terminal; screenshots via `xcrun simctl io booted screenshot`). Package skills tool found none for our dependencies.
- Android SDK present; licences not accepted yet. iOS simulators available (iPhone 16 family, iOS 18.3).
- Design assets are not available: generate placeholder donut/coffee/banner/avatar art as bundled seed images; fonts approximated with a close Google Font (note in README).
