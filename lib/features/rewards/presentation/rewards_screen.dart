import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/format/number_format.dart';
import '../../../core/layout/text_scale.dart';
import '../../../core/motion/app_motion.dart';
import '../../../core/presentation/widgets/delayed_progress.dart';
import '../../../core/presentation/widgets/press_scale.dart';
import '../../../core/presentation/widgets/section_message.dart';
import '../../../core/presentation/widgets/shimmer.dart';
import '../../../core/presentation/widgets/staggered_entrance.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../member/data/member_providers.dart';
import '../../member/domain/entities/member.dart';
import '../../member/presentation/tier_labels.dart';
import '../data/rewards_providers.dart';
import '../domain/entities/challenge.dart';
import 'painting/challenge_art_painters.dart';
import 'painting/points_ring_painter.dart';
import 'painting/tier_shield_painter.dart';
import 'reward_tab.dart';

part 'widgets/_challenge_card.dart';
part 'widgets/_earn_button.dart';
part 'widgets/_gift_placeholder.dart';
part 'widgets/_header.dart';
part 'widgets/_points_ring.dart';
part 'widgets/_tabs.dart';
part 'widgets/_tier_ladder.dart';

/// Rewards tab: tier ladder, animated points ring, and challenge cards.
///
/// Reads the same member record as Home, so tier and points always agree.
class RewardsScreen extends HookConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = useState(RewardTab.earn);
    final challenges = ref.watch(challengesProvider);
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        children: [
          _Header(count: challenges.value?.length),
          const _Summary(),
          _TabBar(selected: tab.value, onChanged: (t) => tab.value = t),
          _CardsPanel(tab: tab.value),
        ],
      ),
    );
  }
}

/// Ladder on the left, ring on the right, from the single member record.
class _Summary extends ConsumerWidget {
  const _Summary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenGutter),
      child: member.when(
        data: (m) => m == null
            ? const SectionEmpty()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 5, child: _TierLadder(member: m)),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(flex: 6, child: _PointsRing(member: m)),
                ],
              ),
        loading: () => const Shimmer(
          child: SkeletonBox(height: 260, width: double.infinity),
        ),
        error: (_, _) =>
            SectionError(onRetry: () => ref.invalidate(memberProvider)),
      ),
    );
  }
}

/// Grey panel holding the active tab's content, which slides and fades when
/// the tab changes.
class _CardsPanel extends ConsumerWidget {
  const _CardsPanel({required this.tab});

  final RewardTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSpacing.sm),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        AppSpacing.lg,
        AppSpacing.screenGutter,
        AppSpacing.lg + bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: AnimatedSwitcher(
        duration: AppMotion.resolve(context, AppMotion.medium),
        switchInCurve: AppMotion.standard,
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0.08, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
        // Keep both children in a Stack-free layout so heights can differ.
        layoutBuilder: (current, previous) =>
            Column(children: [...previous, ?current]),
        child: tab.isEarn
            ? _EarnList(key: const ValueKey(RewardTab.earn))
            : const _GiftPlaceholder(key: ValueKey(RewardTab.gift)),
      ),
    );
  }
}

class _EarnList extends ConsumerWidget {
  const _EarnList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenges = ref.watch(challengesProvider);
    return challenges.when(
      data: (items) => items.isEmpty
          ? const SectionEmpty()
          : Column(
              children: [
                for (final (i, c) in items.indexed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: StaggeredEntrance(
                      index: i,
                      child: _ChallengeCard(challenge: c, index: i),
                    ),
                  ),
              ],
            ),
      loading: () => const Shimmer(
        child: SkeletonBox(height: 140, width: double.infinity),
      ),
      error: (_, _) =>
          SectionError(onRetry: () => ref.invalidate(challengesProvider)),
    );
  }
}
