part of '../product_detail_screen.dart';

/// `- 1 +` pill. The minus is dimmed at the minimum, and the number slides
/// in the direction of the change.
class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({required this.quantity, required this.onChanged});

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: l10n.quantityLabel,
      value: '$quantity',
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xxs),
        decoration: BoxDecoration(
          color: AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(color: AppColors.surface, width: 4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StepButton(
              icon: Icons.remove,
              label: l10n.decreaseQuantity,
              enabled: quantity > minProductQuantity,
              onTap: () => onChanged(quantity - 1),
            ),
            _AnimatedCount(quantity),
            _StepButton(
              icon: Icons.add,
              label: l10n.increaseQuantity,
              enabled: quantity < maxProductQuantity,
              onTap: () => onChanged(quantity + 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedCount extends StatelessWidget {
  const _AnimatedCount(this.value);

  final int value;

  static const double _width = 56;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: AnimatedSwitcher(
        duration: AppMotion.resolve(context, AppMotion.fast),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: Text(
          '$value',
          key: ValueKey(value),
          textAlign: TextAlign.center,
          style: AppTypography.title,
        ),
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: PressScale(
        onTap: enabled ? onTap : null,
        child: AnimatedContainer(
          duration: AppMotion.resolve(context, AppMotion.fast),
          width: AppSizes.iconButton,
          height: AppSizes.iconButton,
          decoration: BoxDecoration(
            color: enabled ? AppColors.primary : AppColors.disabled,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.textOnPrimary),
        ),
      ),
    );
  }
}
