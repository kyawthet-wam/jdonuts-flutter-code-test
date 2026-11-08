import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_typography.dart';

/// Bottom sheet for features that are intentionally not integrated (social
/// login, Terms, Privacy). [title] names what the user tapped.
Future<void> showPlaceholderSheet(BuildContext context, String title) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    // Material 3 caps sheet width; the design wants edge to edge.
    constraints: const BoxConstraints(maxWidth: double.infinity),
    builder: (context) => Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        AppSpacing.xs,
        AppSpacing.screenGutter,
        AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: AppTypography.title),
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppLocalizations.of(context).demoOnlyMessage,
            style: AppTypography.body,
          ),
        ],
      ),
    ),
  );
}
