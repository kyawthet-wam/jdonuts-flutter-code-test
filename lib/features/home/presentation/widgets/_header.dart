part of '../home_screen.dart';

/// Peach top block: member row, "points left" pill and the banner carousel.
class _HeaderSection extends ConsumerWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider);
    return Container(
      color: AppColors.homeBackground,
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + AppSpacing.md,
        bottom: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: member.when(
              data: (m) => m == null ? const _MemberSkeleton() : _MemberRow(m),
              loading: () => const _MemberSkeleton(),
              error: (_, _) => const SizedBox(height: AppSizes.fieldHeight),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const _BannerCarousel(),
        ],
      ),
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow(this.member);

  final Member member;

  static const double _avatar = 52;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextTier = member.tier.next;
    final points = formatThousands(context, member.pointsToNextTier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: SizedBox.square(
                dimension: _avatar,
                child: AppImage(asset: member.photoAsset),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: _NameAndTier(member)),
            _NotificationBell(count: member.unreadNotifications),
          ],
        ),
        if (nextTier != null) ...[
          const SizedBox(height: AppSpacing.sm),
          _PointsPill(l10n.pointsLeft(points, nextTier.label(l10n))),
        ],
      ],
    );
  }
}

class _NameAndTier extends StatelessWidget {
  const _NameAndTier(this.member);

  final Member member;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(member.name, style: AppTypography.title),
        Text(
          l10n.tierMember(member.tier.label(l10n)),
          style: AppTypography.caption,
        ),
      ],
    );
  }
}

class _PointsPill extends StatelessWidget {
  const _PointsPill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(text, style: AppTypography.caption),
    );
  }
}

class _NotificationBell extends StatelessWidget {
  const _NotificationBell({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: l10n.notificationsLabel(count),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.promo,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.notifications_none,
              color: AppColors.textOnPrimary,
              size: 18,
            ),
            const SizedBox(width: AppSpacing.xxs),
            Text(
              '$count',
              style: AppTypography.caption.copyWith(
                color: AppColors.textOnPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
