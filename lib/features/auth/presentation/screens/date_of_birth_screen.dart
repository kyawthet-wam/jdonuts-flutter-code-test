import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/widgets/app_text_field.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/time/clock.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/validators/date_of_birth_validator.dart';
import '../failure_messages.dart';
import '../providers/registration_flow.dart';
import '../widgets/auth_step_scaffold.dart';

const int _monthsInYear = 12;
const int _maxDayDigits = 2;
const int _yearDigits = 4;

/// Step 4 of 4: month, day and year; the ring completes into a check here.
class DateOfBirthScreen extends HookConsumerWidget {
  const DateOfBirthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final flow = ref.watch(registrationFlowProvider);
    final notifier = ref.read(registrationFlowProvider.notifier);
    final month = useTextEditingController(
      text: _monthName(context, flow.dobMonth),
    );
    final day = useTextEditingController(text: flow.dobDay);
    final year = useTextEditingController(text: flow.dobYear);
    final now = ref.watch(clockProvider)();
    final error = _validate(flow, now);

    Future<void> pickMonth() async {
      final picked = await _pickMonth(context);
      if (picked == null || !context.mounted) return;
      month.text = _monthName(context, picked);
      notifier.updateDob(month: picked);
    }

    Future<void> submit() async {
      final dob = DateTime(
        int.parse(flow.dobYear),
        flow.dobMonth!,
        int.parse(flow.dobDay),
      );
      final result = await notifier.submitProfile(dob);
      if (!context.mounted) return;
      if (result.isOk) return context.go(AppRoutes.welcome);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage(l10n, result.failureOrNull!))),
      );
    }

    return AuthStepScaffold(
      step: 4,
      title: l10n.dobTitle,
      onBack: () => context.pop(),
      onContinue: error == null ? submit : null,
      isLoading: flow.isBusy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: month,
            hint: l10n.monthHint,
            readOnly: true,
            onTap: pickMonth,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            controller: day,
            hint: l10n.dayHint,
            keyboardType: TextInputType.number,
            inputFormatters: _digits(_maxDayDigits),
            onChanged: (v) => notifier.updateDob(day: v),
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            controller: year,
            hint: l10n.yearHint,
            keyboardType: TextInputType.number,
            inputFormatters: _digits(_yearDigits),
            onChanged: (v) => notifier.updateDob(year: v),
          ),
          _DobMessage(_message(l10n, error, flow)),
        ],
      ),
    );
  }

  DateOfBirthError? _validate(RegistrationFlowState flow, DateTime now) {
    return validateDateOfBirth(
      year: int.tryParse(flow.dobYear),
      month: flow.dobMonth,
      day: int.tryParse(flow.dobDay),
      now: now,
    );
  }

  /// Hidden while fields are still incomplete so users aren't nagged mid-typing.
  String? _message(
    AppLocalizations l10n,
    DateOfBirthError? error,
    RegistrationFlowState flow,
  ) {
    final filled =
        flow.dobYear.length == _yearDigits &&
        flow.dobDay.isNotEmpty &&
        flow.dobMonth != null;
    if (error == null || !filled) return null;
    return switch (error) {
      DateOfBirthError.incomplete => l10n.errorDobIncomplete,
      DateOfBirthError.invalidDate => l10n.errorDobInvalid,
      DateOfBirthError.inFuture => l10n.errorDobFuture,
      DateOfBirthError.tooYoung => l10n.errorDobTooYoung(
        minimumRegistrationAge,
      ),
    };
  }

  List<TextInputFormatter> _digits(int maxLength) => [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(maxLength),
  ];

  String _monthName(BuildContext context, int? month) {
    if (month == null) return '';
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.MMMM(locale).format(DateTime(2000, month));
  }

  Future<int?> _pickMonth(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (sheetContext) => ListView(
        shrinkWrap: true,
        children: [
          for (var m = 1; m <= _monthsInYear; m++)
            ListTile(
              title: Text(_monthName(sheetContext, m)),
              onTap: () => Navigator.of(sheetContext).pop(m),
            ),
        ],
      ),
    );
  }
}

class _DobMessage extends StatelessWidget {
  const _DobMessage(this.message);

  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text(
        message!,
        style: AppTypography.caption.copyWith(color: AppColors.error),
      ),
    );
  }
}
