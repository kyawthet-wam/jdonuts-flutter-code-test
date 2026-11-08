import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../motion/app_motion.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Text field whose border animates between idle, focused and error.
///
/// [errorText] is always the current validation message; it is only *shown*
/// after the field has lost focus once (or [forceShowError] is set), so users
/// aren't scolded while still typing.
class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.errorText,
    this.forceShowError = false,
    this.prefix,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final bool forceShowError;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;

  /// Turn both off for names: correction mangles Myanmar and proper nouns.
  final bool autocorrect;
  final bool enableSuggestions;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final hasFocus = useListenableSelector(focusNode, () => focusNode.hasFocus);
    final touched = useState(false);
    useEffect(() {
      if (!hasFocus && controller.text.isNotEmpty) touched.value = true;
      return null;
    }, [hasFocus]);

    final message = (touched.value || forceShowError) ? errorText : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Box(
          state: _stateOf(hasFocus, message),
          child: _Input(focusNode: focusNode, field: this),
        ),
        _ErrorMessage(message),
      ],
    );
  }

  _FieldState _stateOf(bool hasFocus, String? message) {
    if (message != null) return _FieldState.error;
    return hasFocus ? _FieldState.focused : _FieldState.idle;
  }
}

enum _FieldState { idle, focused, error }

class _Box extends StatelessWidget {
  const _Box({required this.state, required this.child});

  final _FieldState state;
  final Widget child;

  Color get _borderColor => switch (state) {
    _FieldState.idle => AppColors.surface,
    _FieldState.focused => AppColors.primary,
    _FieldState.error => AppColors.error,
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppMotion.resolve(context, AppMotion.fast),
      curve: AppMotion.standard,
      height: AppSizes.fieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: _borderColor, width: 1.5),
      ),
      child: child,
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({required this.focusNode, required this.field});

  final FocusNode focusNode;
  final AppTextField field;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (field.prefix != null) ...[
          field.prefix!,
          const SizedBox(width: AppSpacing.sm),
        ],
        Expanded(
          child: TextField(
            controller: field.controller,
            focusNode: focusNode,
            readOnly: field.readOnly,
            onTap: field.onTap,
            onChanged: field.onChanged,
            onSubmitted: field.onSubmitted,
            keyboardType: field.keyboardType,
            inputFormatters: field.inputFormatters,
            textInputAction: field.textInputAction,
            textCapitalization: field.textCapitalization,
            autofillHints: field.autofillHints,
            autocorrect: field.autocorrect,
            enableSuggestions: field.enableSuggestions,
            style: AppTypography.body,
            decoration: InputDecoration(
              hintText: field.hint,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              filled: false,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage(this.message);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppMotion.resolve(context, AppMotion.fast),
      curve: AppMotion.standard,
      alignment: Alignment.topLeft,
      child: message == null
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: Text(
                message!,
                style: AppTypography.caption.copyWith(color: AppColors.error),
              ),
            ),
    );
  }
}
