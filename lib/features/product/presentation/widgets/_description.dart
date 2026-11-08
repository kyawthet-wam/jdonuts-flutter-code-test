part of '../product_detail_screen.dart';

/// "What's this?" label beside the product description.
class _Description extends StatelessWidget {
  const _Description(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.help, size: 16, color: AppColors.success),
              Text(
                AppLocalizations.of(context).whatsThis,
                style: AppTypography.caption.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Container(width: 1, height: 60, color: AppColors.border),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(text, style: AppTypography.caption)),
      ],
    );
  }
}
