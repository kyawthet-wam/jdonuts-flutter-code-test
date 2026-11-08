part of '../product_detail_screen.dart';

/// White card: code, New badge, name, price, hero image and the stepper that
/// overlaps its bottom edge.
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.product,
    required this.heroTag,
    required this.quantity,
    required this.onQuantityChanged,
  });

  final Product product;
  final String heroTag;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  static const double _imageSize = 220;
  static const double _stepperOverlap = 28;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final price = formatThousands(context, product.priceMmk);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: _stepperOverlap),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.xl,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CodeRow(code: product.code, isNew: product.isNew),
              Text(product.name, style: AppTypography.title),
              Text(l10n.priceMmk(price), style: AppTypography.caption),
              const SizedBox(height: AppSpacing.md),
              Center(
                child: Hero(
                  tag: heroTag,
                  child: SizedBox.square(
                    dimension: _imageSize,
                    child: AppImage(
                      asset: product.imageAsset,
                      url: product.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: _QuantityStepper(
              quantity: quantity,
              onChanged: onQuantityChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class _CodeRow extends StatelessWidget {
  const _CodeRow({required this.code, required this.isNew});

  final String code;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(code, style: AppTypography.caption),
        if (isNew)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: AppColors.promo,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Text(
              AppLocalizations.of(context).newBadge,
              style: AppTypography.caption.copyWith(
                color: AppColors.textOnPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
