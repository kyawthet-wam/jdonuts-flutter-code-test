import 'package:flutter/material.dart';

import '../../motion/app_motion.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';
import 'press_scale.dart';

/// Full-width pill button. While [isLoading] it morphs into a small circle
/// with a spinner and ignores taps, so a double tap sends one request.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;

  /// Null disables the button (rendered grey).
  final VoidCallback? onPressed;
  final bool isLoading;

  bool get _enabled => onPressed != null && !isLoading;

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
                color: onPressed == null && !isLoading
                    ? AppColors.disabled
                    : AppColors.primary,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: AnimatedSwitcher(
                duration: AppMotion.resolve(context, AppMotion.fast),
                child: isLoading ? const _Spinner() : _Label(label),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, key: ValueKey(text), style: AppTypography.button);
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
