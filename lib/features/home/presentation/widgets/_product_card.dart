part of '../home_screen.dart';

/// Visual variants of a product card.
enum _ProductCardStyle { wide, tile }

extension _ProductCardStyleX on _ProductCardStyle {
  bool get isWide => this == _ProductCardStyle.wide;
  bool get isTile => this == _ProductCardStyle.tile;

  double get width => isWide ? 170 : 130;
  double get imageHeight => isWide ? 100 : 120;
  double get rowHeight => isWide ? 170 : 210;
}

/// Tappable product tile. Opens `/product/:id`, handing over [heroTag] so the
/// image flies to the detail screen (tags differ per section because the same
/// product can appear in several rows at once).
class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.style,
    required this.heroTag,
  });

  final Product product;
  final _ProductCardStyle style;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: () => unawaited(
        context.push(AppRoutes.product(product.id), extra: heroTag),
      ),
      child: SizedBox(
        width: style.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(product: product, style: style, heroTag: heroTag),
            const SizedBox(height: AppSpacing.xs),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.body.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    required this.product,
    required this.style,
    required this.heroTag,
  });

  final Product product;
  final _ProductCardStyle style;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final discount = product.discountPercent;
    return SizedBox(
      height: style.imageHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: ColoredBox(
                color: AppColors.surface,
                child: Padding(
                  padding: EdgeInsets.all(style.isTile ? AppSpacing.xs : 0),
                  child: AppImage(
                    asset: product.imageAsset,
                    url: product.imageUrl,
                    fit: style.isWide ? BoxFit.cover : BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          if (discount != null)
            Positioned(
              right: AppSpacing.xs,
              bottom: AppSpacing.xs,
              child: _BadgePill(
                AppLocalizations.of(context).discountOff(discount),
              ),
            ),
        ],
      ),
    );
  }
}
