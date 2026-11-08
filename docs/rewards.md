# Rewards (Task 3)

**Why**: the Rewards tab is where motion is judged, so each animated piece is driven from one place (`DelayedProgress`, durations/curves from `AppMotion`) and everything reads the same local data as Home (member + challenges from Drift).

## Screen (`features/rewards/presentation/rewards_screen.dart`, parts in `widgets/`)
- **Header**: "J' Donuts Rewards" and an orange "Rewards (n)" badge (n = number of challenges) that pops in (`AppMotion.pop`, scale from 0).
- **Points ring** (`painting/points_ring_painter.dart`, `CustomPainter`): grey track plus a pink glazed arc with white sprinkles. One eased value drives both the sweep from 0 to the member's `tierProgress` and the total counting up from 0 to 680,000. Sprinkles appear as the sweep reaches them.
- **Tier ladder**: Silver, Gold, Platinum appear in order (`StaggeredEntrance`); the member's tier is highlighted (bigger shield, glow, bold). Status text: "You're here now", "N pts Remaining to become Gold", "You'll be here soon" (or "Achieved" below the current tier). The connector under a tier fills to the member's progress after the tiers have appeared.
- **Tabs**: "Eat more earn more" and "Gift" are white outlined pills; one blue indicator slides between them (`AnimatedPositioned`). The card list swaps with a slide + fade (`AnimatedSwitcher`). The Gift tab has no design, so it shows a simple message with no hard-coded data.
- **Challenge cards** enter staggered. Progress art is painted from the challenge's own numbers: the donut colours in quarter by quarter (`DonutQuartersPainter`, 4/4 = all four, 1/4 = one wedge), the coffee arc fills to current/target (9/12 = 75%).
- **Earn**: active (blue) and pulsing `AppMotion.attentionPulseCycles` times when a challenge is complete (4/4), grey otherwise. A tap gives press feedback and does nothing. It is exposed to accessibility as a button with enabled/disabled state.
- Reduce Motion: every animation jumps to its final state; the pulse is skipped.
- Performance: painters sit in `RepaintBoundary`s, and only the painted widgets rebuild per frame.

## Tests
`test/features/rewards/rewards_screen_test.dart`: content, tier text, agreement with Home (same member record), count-up and Reduce Motion, badge pop-in, tab swap and indicator, Earn semantics. `test/features/layout_test.dart` also renders Rewards at 1.3x text on small and large phones.
