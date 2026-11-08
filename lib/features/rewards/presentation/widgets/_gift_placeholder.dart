part of '../rewards_screen.dart';

/// The Gift tab has no design yet, so it shows a simple, data-free message.
class _GiftPlaceholder extends StatelessWidget {
  const _GiftPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        children: [
          const Icon(Icons.card_giftcard, size: 48, color: AppColors.accent),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppLocalizations.of(context).giftsComingSoon,
            style: AppTypography.subtitle,
          ),
        ],
      ),
    );
  }
}
