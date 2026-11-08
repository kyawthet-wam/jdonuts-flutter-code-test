part of '../home_screen.dart';

/// Visual variants of a product card, one per kind of section:
/// seasonal = wide photo, popular = tall tile, order again = square tile.
enum _ProductCardStyle { wide, tall, square }

// The bool getters follow the project enum convention even where unused.
// ignore_for_file: unused_element

extension _ProductCardStyleX on _ProductCardStyle {
  bool get isWide => this == _ProductCardStyle.wide;
  bool get isTall => this == _ProductCardStyle.tall;
  bool get isSquare => this == _ProductCardStyle.square;

  static _ProductCardStyle of(SectionKind kind) => switch (kind) {
    SectionKind.seasonal => _ProductCardStyle.wide,
    SectionKind.popular => _ProductCardStyle.tall,
    SectionKind.orderAgain => _ProductCardStyle.square,
  };

  double get width => switch (this) {
    _ProductCardStyle.wide => 170,
    _ProductCardStyle.tall => 120,
    _ProductCardStyle.square => 120,
  };

  double get imageHeight => switch (this) {
    _ProductCardStyle.wide => 100,
    _ProductCardStyle.tall => 160,
    _ProductCardStyle.square => 120,
  };

  /// Image plus room for a two-line name.
  double get rowHeight => imageHeight + _nameAreaHeight;
}

const double _nameAreaHeight = 70;

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
              style: AppTypography.productName,
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
                  padding: EdgeInsets.all(style.isWide ? 0 : AppSpacing.xs),
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
