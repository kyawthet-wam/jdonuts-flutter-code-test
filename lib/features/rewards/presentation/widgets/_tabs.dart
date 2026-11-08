part of '../rewards_screen.dart';

const double _tabBarHeight = 48;
const double _earnTabShare = 0.62;

/// "Eat more earn more" and "Gift". One blue indicator slides between them.
class _TabBar extends StatelessWidget {
  const _TabBar({required this.selected, required this.onChanged});

  final RewardTab selected;
  final ValueChanged<RewardTab> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final height = context.scaledHeight(_tabBarHeight);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final earn = constraints.maxWidth * _earnTabShare;
          final gift = constraints.maxWidth - earn;
          return SizedBox(
            height: height,
            child: Stack(
              children: [
                // Both tabs are white outlined pills; the blue indicator slides
                // over whichever is active.
                Row(
                  children: [
                    _TabPill(width: earn),
                    _TabPill(width: gift),
                  ],
                ),
                _Indicator(
                  left: selected.isEarn ? 0 : earn,
                  width: selected.isEarn ? earn : gift,
                ),
                Row(
                  children: [
                    _TabLabel(
                      width: earn,
                      text: l10n.tabEarn,
                      active: selected.isEarn,
                      onTap: () => onChanged(RewardTab.earn),
                    ),
                    _TabLabel(
                      width: gift,
                      text: l10n.tabGift,
                      active: selected.isGift,
                      onTap: () => onChanged(RewardTab.gift),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: AppColors.border, width: 2),
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.left, required this.width});

  final double left;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: AppMotion.resolve(context, AppMotion.medium),
      curve: AppMotion.emphasized,
      left: left,
      width: width,
      top: 0,
      bottom: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: AppColors.surface, width: 2),
          boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 8)],
        ),
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({
    required this.width,
    required this.text,
    required this.active,
    required this.onTap,
  });

  final double width;
  final String text;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: active,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: width,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: AppMotion.resolve(context, AppMotion.fast),
              style: AppTypography.subtitle.copyWith(
                color: active
                    ? AppColors.textOnPrimary
                    : AppColors.textSecondary,
              ),
              child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ),
    );
  }
}
