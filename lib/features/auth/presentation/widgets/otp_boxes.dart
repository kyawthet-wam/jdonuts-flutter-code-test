import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/motion/app_motion.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/validators/otp_validator.dart';

/// Six display boxes driven by one hidden numeric field.
///
/// Why one hidden field: paste, backspace, SMS autofill and IME quirks are all
/// handled by a single real text input instead of six fragile ones.
/// Bump [shakeSignal] to shake the boxes (wrong code).
class OtpBoxes extends HookWidget {
  const OtpBoxes({
    super.key,
    required this.controller,
    required this.onCompleted,
    this.shakeSignal = 0,
    this.enabled = true,
    this.hasError = false,
  });

  final TextEditingController controller;
  final ValueChanged<String> onCompleted;
  final int shakeSignal;
  final bool enabled;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final shake = useAnimationController(duration: AppMotion.shake);
    useEffect(() {
      if (shakeSignal > 0) shake.forward(from: 0);
      return null;
    }, [shakeSignal]);
    final code = useValueListenable(controller).text;
    final hasFocus = useListenableSelector(focusNode, () => focusNode.hasFocus);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled ? focusNode.requestFocus : null,
      child: Stack(
        children: [
          _HiddenInput(
            controller: controller,
            focusNode: focusNode,
            enabled: enabled,
            onCompleted: onCompleted,
          ),
          AnimatedBuilder(
            animation: shake,
            builder: (context, child) => Transform.translate(
              offset: Offset(_shakeOffset(shake.value), 0),
              child: child,
            ),
            child: _BoxRow(
              code: code,
              activeIndex: hasFocus ? code.length : -1,
              hasError: hasError,
            ),
          ),
        ],
      ),
    );
  }

  static const double _shakeAmplitude = 10;
  static const int _shakeCycles = 3;

  double _shakeOffset(double t) =>
      math.sin(t * math.pi * 2 * _shakeCycles) * _shakeAmplitude * (1 - t);
}

class _HiddenInput extends StatelessWidget {
  const _HiddenInput({
    required this.controller,
    required this.focusNode,
    required this.enabled,
    required this.onCompleted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final ValueChanged<String> onCompleted;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          autofocus: true,
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.oneTimeCode],
          enableInteractiveSelection: false,
          showCursor: false,
          inputFormatters: [_OtpFormatter()],
          onChanged: (value) {
            if (value.length == otpLength) onCompleted(value);
          },
        ),
      ),
    );
  }
}

/// Reuses the domain rule so typing and pasting clean input the same way.
class _OtpFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final clean = sanitizeOtpPaste(newValue.text);
    return TextEditingValue(
      text: clean,
      selection: TextSelection.collapsed(offset: clean.length),
    );
  }
}

class _BoxRow extends StatelessWidget {
  const _BoxRow({
    required this.code,
    required this.activeIndex,
    required this.hasError,
  });

  final String code;
  final int activeIndex;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < otpLength; i++) ...[
          if (i > 0) const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: _Box(
              digit: i < code.length ? code[i] : '',
              isActive: i == activeIndex,
              hasError: hasError,
            ),
          ),
        ],
      ],
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({
    required this.digit,
    required this.isActive,
    required this.hasError,
  });

  final String digit;
  final bool isActive;
  final bool hasError;

  Color get _border {
    if (hasError) return AppColors.error;
    return isActive ? AppColors.primary : AppColors.surface;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppMotion.resolve(context, AppMotion.fast),
      height: AppSizes.otpBox + AppSpacing.xs,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: _border, width: 1.5),
      ),
      child: Text(digit, style: AppTypography.title),
    );
  }
}
