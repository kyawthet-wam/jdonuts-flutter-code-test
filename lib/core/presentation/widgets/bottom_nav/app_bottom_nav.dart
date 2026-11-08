import 'package:flutter/material.dart';

import '../../../layout/text_scale.dart';
import '../../../motion/app_motion.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_typography.dart';

/// One tab: an icon (built per colour so it can be recoloured) and a label.
class BottomNavItem {
  const BottomNavItem({required this.iconBuilder, required this.label});

  final Widget Function(Color color) iconBuilder;
  final String label;
}

const double _barPadding = AppSpacing.sm;
const double _pillHeight = 46;
const double _barRadius = 26;
const double _activeSlotWidth = 108;
const double _shadowBlur = 16;

/// Space between the pill's edge and its slot's edge, so neighbouring icons
/// never touch it.
const double _pillInset = 3;
const double _pillBorder = 1.5;

/// Share of the bottom safe-area inset kept as bar padding.
const double _safeAreaShare = 0.8;

/// How far up the bar the pink backdrop rises (fraction of bar height).
const double _backdropHeight = 0.55;
const double _iconSize = 24;

/// Blue bar with white icons, inset from the screen sides, rounded only at the
/// top and flush with the bottom edge (it fills the home-indicator area).
/// The active tab is a pink pill showing its label; the pill slides to the
/// newly selected tab.
///
/// Why one pill that moves (instead of each tab drawing its own): it reads as
/// a single object travelling between tabs, which is the requested motion.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    // Only part of the home-indicator inset is kept as padding: the indicator
    // is thin, so a full inset would make the bar needlessly tall.
    final inset = MediaQuery.paddingOf(context).bottom * _safeAreaShare;
    final bottomPadding = inset < _barPadding ? _barPadding : inset;
    // The shell sets `extendBody`, so page content runs behind the bar.
    return Stack(
      children: [
        const _PinkBackdrop(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(_barRadius),
              ),
              boxShadow: [
                BoxShadow(color: AppColors.shadow, blurRadius: _shadowBlur),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                _barPadding,
                _barPadding,
                _barPadding,
                bottomPadding,
              ),
              child: LayoutBuilder(builder: _buildBar),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBar(BuildContext context, BoxConstraints constraints) {
    final height = context.scaledHeight(_pillHeight);
    final active = (context.scaledHeight(_activeSlotWidth))
        .clamp(0.0, constraints.maxWidth * 0.5);
    final other = (constraints.maxWidth - active) / (items.length - 1);
    final duration = AppMotion.resolve(context, AppMotion.medium);
    double slotWidth(int i) => i == currentIndex ? active : other;
    final pillLeft = [for (var i = 0; i < currentIndex; i++) slotWidth(i)]
        .fold<double>(0, (a, b) => a + b);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: duration,
            curve: AppMotion.emphasized,
            left: pillLeft + _pillInset,
            width: active - _pillInset * 2,
            top: 0,
            bottom: 0,
            child: const _Pill(),
          ),
          Row(
            children: [
              for (final (i, item) in items.indexed)
                AnimatedContainer(
                  duration: duration,
                  curve: AppMotion.emphasized,
                  width: slotWidth(i),
                  child: _Slot(
                    item: item,
                    selected: i == currentIndex,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Pink band behind the bar, visible in the strips either side of it (the
/// design has this accent rising to about half the bar's height).
class _PinkBackdrop extends StatelessWidget {
  const _PinkBackdrop();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: FractionallySizedBox(
        heightFactor: _backdropHeight,
        alignment: Alignment.bottomCenter,
        child: ColoredBox(color: AppColors.accent),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        // Thin white rim keeps the pill crisp against the blue bar.
        border: Border.all(color: AppColors.surface, width: _pillBorder),
      ),
    );
  }
}

class _Slot extends StatelessWidget {
  const _Slot({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final BottomNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        // Centred, and scaled down (never overflowing) while the slot is still
        // narrow mid-slide.
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: ExcludeSemantics(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.iconBuilder(AppColors.textOnPrimary),
                  if (selected) ...[
                    const SizedBox(width: AppSpacing.xs),
                    _Label(item.label),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: AppMotion.resolve(context, AppMotion.medium),
      curve: AppMotion.standard,
      builder: (context, opacity, child) =>
          Opacity(opacity: opacity, child: child),
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        style: AppTypography.caption.copyWith(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Convenience for the common case of a Material icon.
Widget materialNavIcon(IconData icon, Color color) =>
    Icon(icon, color: color, size: _iconSize);
