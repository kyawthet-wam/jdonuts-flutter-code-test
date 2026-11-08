part of '../home_screen.dart';

const double _shopCardWidth = 260;
const double _shopListHeight = 230;

/// Blue "shops near you" block. Explore now and Order online are display only.
class _ShopsSection extends ConsumerWidget {
  const _ShopsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(homeShopsProvider);
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.lg),
      // Bottom inset keeps the cards clear of the floating tab bar.
      padding: EdgeInsets.only(
        top: AppSpacing.lg,
        bottom: AppSpacing.lg + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: shops.when(
        data: (items) =>
            items.isEmpty ? const SectionEmpty() : _ShopsContent(shops: items),
        loading: () => const _ShopsSkeleton(),
        error: (_, _) =>
            SectionError(onRetry: () => ref.invalidate(homeShopsProvider)),
      ),
    );
  }
}

class _ShopsContent extends StatelessWidget {
  const _ShopsContent({required this.shops});

  final List<Shop> shops;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenGutter,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.shopsNearYou(shops.length),
                style: AppTypography.title.copyWith(
                  color: AppColors.textOnPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SizedBox(
                width: 150,
                child: PrimaryButton(
                  label: l10n.exploreNow,
                  variant: PrimaryButtonVariant.onBrand,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: context.scaledHeight(_shopListHeight),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            itemCount: shops.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (_, i) => _ShopCard(shops[i]),
          ),
        ),
      ],
    );
  }
}

class _ShopCard extends StatelessWidget {
  const _ShopCard(this.shop);

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _shopCardWidth,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: SizedBox(
              height: 110,
              width: double.infinity,
              child: AppImage(asset: shop.imageAsset, url: shop.imageUrl),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(shop.name, style: AppTypography.subtitle),
          Text(shop.address, style: AppTypography.caption, maxLines: 2),
          const Spacer(),
          Text(
            AppLocalizations.of(context).orderOnline,
            style: AppTypography.caption.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
