import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/widgets/app_text_field.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/validators/phone_validator.dart';
import '../failure_messages.dart';
import '../providers/registration_flow.dart';
import '../widgets/auth_step_scaffold.dart';

/// Step 1 of 4: phone number for both login and registration.
class PhoneScreen extends HookConsumerWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final flow = ref.watch(registrationFlowProvider);
    final controller = useTextEditingController(text: flow.phoneInput);
    final notRegistered = useState(false);
    final error = validatePhone(flow.phoneInput);

    Future<void> submit() async {
      final result = await ref
          .read(registrationFlowProvider.notifier)
          .submitPhone();
      if (!context.mounted) return;
      if (result.isOk) return unawaited(context.push(AppRoutes.otp));
      final message = failureMessage(l10n, result.failureOrNull!);
      notRegistered.value = message == l10n.notRegistered;
      if (!notRegistered.value) _showError(context, message);
    }

    return AuthStepScaffold(
      step: 1,
      title: l10n.phoneTitle,
      onBack: () => context.pop(),
      onContinue: error == null ? submit : null,
      isLoading: flow.isBusy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: controller,
            hint: l10n.phoneHint,
            errorText: _phoneMessage(l10n, error),
            prefix: const _DialCode(),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9 \-]')),
            ],
            onChanged: (value) {
              notRegistered.value = false;
              ref.read(registrationFlowProvider.notifier).updatePhone(value);
            },
          ),
          if (notRegistered.value)
            _NotRegisteredMessage(
              onRegister: () {
                notRegistered.value = false;
                ref
                    .read(registrationFlowProvider.notifier)
                    .start(AuthIntent.register);
              },
            ),
        ],
      ),
    );
  }

  String? _phoneMessage(AppLocalizations l10n, PhoneError? error) {
    return switch (error) {
      null => null,
      PhoneError.empty => l10n.errorPhoneEmpty,
      PhoneError.invalidFormat => l10n.errorPhoneInvalid,
    };
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class _DialCode extends StatelessWidget {
  const _DialCode();

  @override
  Widget build(BuildContext context) {
    return Text(
      myanmarDialCode,
      style: AppTypography.body.copyWith(color: AppColors.textHint),
    );
  }
}

/// Inline message for a login with an unknown number, linking to register.
class _NotRegisteredMessage extends StatelessWidget {
  const _NotRegisteredMessage({required this.onRegister});

  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text.rich(
        TextSpan(
          style: AppTypography.caption.copyWith(color: AppColors.error),
          children: [
            TextSpan(text: l10n.notRegistered),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: onRegister,
                child: Text(
                  l10n.registerLink,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
