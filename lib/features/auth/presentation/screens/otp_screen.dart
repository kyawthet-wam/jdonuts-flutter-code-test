import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/validators/otp_validator.dart';
import '../hooks/use_countdown.dart';
import '../providers/registration_flow.dart';
import '../widgets/auth_step_scaffold.dart';
import '../widgets/otp_boxes.dart';

/// Step 2 of 4: six-digit code with resend countdown and a 3-strike lock.
class OtpScreen extends HookConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final flow = ref.watch(registrationFlowProvider);
    final notifier = ref.read(registrationFlowProvider.notifier);
    final controller = useTextEditingController();
    final code = useValueListenable(controller).text;
    final shakes = useState(0);
    final countdown = useCountdown(otpResendCooldown);

    Future<void> submit(String value) async {
      final outcome = await notifier.submitOtp(value);
      if (!context.mounted) return;
      if (outcome.isContinueRegistration) {
        // Replace, not push: a verified code must not be re-enterable via back.
        context.pushReplacement(AppRoutes.name);
        return;
      }
      if (outcome.isWrong || outcome.isLocked) {
        controller.clear();
        shakes.value++;
      }
      if (outcome.isFailed) _showError(context, l10n.genericError);
    }

    Future<void> resend() async {
      controller.clear();
      final result = await notifier.resendOtp();
      if (!context.mounted) return;
      if (result.isOk) {
        countdown.restart();
      } else {
        _showError(context, l10n.genericError);
      }
    }

    return AuthStepScaffold(
      step: 2,
      title: l10n.verifyTitle,
      subtitle: Text(
        l10n.otpSentTo(flow.phoneE164 ?? ''),
        style: AppTypography.caption,
      ),
      onBack: () => context.pop(),
      onContinue: validateOtp(code) == null ? () => submit(code) : null,
      isLoading: flow.isBusy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OtpBoxes(
            controller: controller,
            onCompleted: submit,
            shakeSignal: shakes.value,
            enabled: !flow.isOtpLocked && !flow.isBusy,
            hasError: flow.wrongOtpCount > 0,
          ),
          _OtpMessage(flow),
          const SizedBox(height: AppSpacing.lg),
          _ResendRow(
            remaining: countdown.remaining,
            canResend: countdown.remaining <= Duration.zero || flow.isOtpLocked,
            onResend: resend,
          ),
        ],
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class _OtpMessage extends StatelessWidget {
  const _OtpMessage(this.flow);

  final RegistrationFlowState flow;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (flow.wrongOtpCount == 0) return const SizedBox.shrink();
    final text = flow.isOtpLocked
        ? l10n.otpLocked
        : l10n.otpWrong(flow.otpAttemptsLeft);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text(
        text,
        style: AppTypography.caption.copyWith(color: AppColors.error),
      ),
    );
  }
}

class _ResendRow extends StatelessWidget {
  const _ResendRow({
    required this.remaining,
    required this.canResend,
    required this.onResend,
  });

  final Duration remaining;
  final bool canResend;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.didntReceiveCode, style: AppTypography.caption),
        const SizedBox(height: AppSpacing.xxs),
        if (canResend)
          GestureDetector(
            onTap: onResend,
            child: Text(
              l10n.resendCode,
              style: AppTypography.body.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        else
          Text.rich(
            TextSpan(
              style: AppTypography.caption,
              children: [
                TextSpan(text: l10n.resendIn),
                TextSpan(
                  text: l10n.resendTime(formatCountdown(remaining)),
                  style: const TextStyle(color: AppColors.accent),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
