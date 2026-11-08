import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/widgets/app_text_field.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/validators/name_validator.dart';
import '../providers/registration_flow.dart';
import '../widgets/auth_step_scaffold.dart';

/// Step 3 of 4: first name (required) and last name (optional).
class NameScreen extends HookConsumerWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final flow = ref.watch(registrationFlowProvider);
    final notifier = ref.read(registrationFlowProvider.notifier);
    final first = useTextEditingController(text: flow.firstName);
    final last = useTextEditingController(text: flow.lastName);
    final firstError = validateFirstName(flow.firstName);
    final lastError = validateLastName(flow.lastName);

    return AuthStepScaffold(
      step: 3,
      title: l10n.nameTitle,
      onBack: () => context.pop(),
      onContinue: firstError == null && lastError == null
          ? () => context.push(AppRoutes.dateOfBirth)
          : null,
      isLoading: false,
      child: Column(
        children: [
          AppTextField(
            controller: first,
            hint: l10n.firstNameHint,
            errorText: _message(l10n, firstError),
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            onChanged: (v) => notifier.updateName(first: v),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            controller: last,
            hint: l10n.lastNameHint,
            errorText: _message(l10n, lastError),
            textCapitalization: TextCapitalization.words,
            onChanged: (v) => notifier.updateName(last: v),
          ),
        ],
      ),
    );
  }

  String? _message(AppLocalizations l10n, NameError? error) {
    return switch (error) {
      null => null,
      NameError.empty => l10n.errorNameRequired,
      NameError.tooLong => l10n.errorNameTooLong,
      NameError.invalidCharacters => l10n.errorNameInvalid,
    };
  }
}
