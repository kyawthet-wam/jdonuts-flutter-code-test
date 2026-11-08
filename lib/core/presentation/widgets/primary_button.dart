import 'package:flutter/material.dart';

import '../../motion/app_motion.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import 'press_scale.dart';

/// Where the button sits: on a light page (brand fill) or on a brand-coloured
/// block, where it needs a white fill to stay visible.
enum PrimaryButtonVariant { filled, onBrand }

extension PrimaryButtonVariantX on PrimaryButtonVariant {
  bool get isFilled => this == PrimaryButtonVariant.filled;
  bool get isOnBrand => this == PrimaryButtonVariant.onBrand;
}

/// Full-width pill button. While [isLoading] it morphs into a small circle
/// with a spinner and ignores taps, so a double tap sends one request.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = PrimaryButtonVariant.filled,
  });

  final String label;

  /// Null disables the button (rendered grey).
  final VoidCallback? onPressed;
  final bool isLoading;
  final PrimaryButtonVariant variant;

  bool get _enabled => onPressed != null && !isLoading;

  Color get _background {
    if (onPressed == null && !isLoading) return AppColors.disabled;
    return variant.isOnBrand ? AppColors.surface : AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = isLoading ? AppSizes.buttonHeight : constraints.maxWidth;
        return Center(
          child: PressScale(
            onTap: _enabled ? onPressed : null,
            child: AnimatedContainer(
              duration: AppMotion.resolve(context, AppMotion.medium),
              curve: AppMotion.standard,
              width: width,
              height: AppSizes.buttonHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _background,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: AnimatedSwitcher(
                duration: AppMotion.resolve(context, AppMotion.fast),
                child: isLoading ? const _Spinner() : _Label(label, variant),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, this.variant);

  final String text;
  final PrimaryButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final style = variant.isOnBrand
        ? AppTypography.button.copyWith(color: AppColors.primaryDark)
        : AppTypography.button;
    return Text(text, key: ValueKey(text), style: style);
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  static const double _size = 22;
  static const double _stroke = 2.5;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: _size,
      height: _size,
      child: CircularProgressIndicator(
        strokeWidth: _stroke,
        color: AppColors.textOnPrimary,
      ),
    );
  }
}
