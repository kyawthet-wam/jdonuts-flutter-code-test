# Home and Product detail (Task 2)

**Why**: both screens only read the local database (see [offline-data.md](offline-data.md)), so they render in airplane mode; a refresh just writes new rows and the streams repaint.

## Home (`features/home/presentation/home_screen.dart`)
- Peach header: member avatar, name, "<Tier> member", orange bell with unread count, "N points left to become <next tier> Member" pill (hidden at the top tier). All from the single member record shared with Rewards.
- Banner carousel (`PageView`, viewport 0.88) auto-plays every `AppMotion.bannerAutoPlay`; auto-play is skipped under Reduce Motion.
- Three product rows (Seasonal specials, Popular, Order again) with discount badges from `discountPercent`; seasonal uses wide cards, others tiles (`_ProductCardStyle` enum). Sections enter staggered (`StaggeredEntrance`).
- Blue "shops near you" block: pluralised count, display-only "Explore now" and "Order Online", horizontal shop cards.
- Each part (member, banners, sections, shops) is its own provider, so each has its own shimmer skeleton, empty and error state with retry. A failing section never blanks the screen.
- Pull-to-refresh calls `SyncController.refresh()`; the offline banner (`OfflineBannerLayout`) lives in the tab shell and on Product detail.
- Private widgets live in `widgets/_*.dart` joined with `part of`.

## Product detail (`features/product/presentation/product_detail_screen.dart`)
- Route `/product/:id`; the tapped tile passes a Hero tag through `extra`. Tags are per section (`product-<section>-<id>`) because the same product can appear in several rows at once. A direct link falls back to `product-<id>` and just doesn't fly.
- Shows code, New badge, name, price (`3,200 MMK`, thousands separators), image, "What's this?" description. Unknown id shows an unavailable message; loading shows a skeleton; errors offer retry.
- Quantity stepper: min 1, max 99 (`quantity_rules.dart`); the number scales/fades on change and the button shows the live total (`ADD TO CART | 6,400 MMK`).
- Add to cart goes through the `AddToCart` use case (rejects out-of-range quantities) into the Drift cart, which merges lines and persists across restarts. The button confirms with "ADDED TO CART" for 1.5s.

Tests: `test/features/home/home_screen_test.dart`, `test/features/product/*`. Widget tests use `testApp` (test/support/pump_app.dart): the database is seeded up front because asset I/O can't complete in fake-async time, and a final pump flushes the zero-length timer Drift schedules when streams are cancelled.

## Refresh errors and text scale
- Pull-to-refresh: a server/timeout failure shows "Couldn't refresh right now. Showing saved data." and the screen keeps its local data. While offline it stays quiet because the offline banner already says so; with no server configured it is a silent no-op. Background refreshes never show messages.
- Text scale: fixed-height rows (banner, product rows, shop cards) use `context.scaledHeight(base)` so they grow with the user's text size instead of overflowing. `test/features/layout_test.dart` renders onboarding, phone step, Home (scrolled end to end) and Product detail at 360x640 and 440x956 with text scale 1.3; the test font is wider than real fonts, so this is a strict check.
