import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/format/number_format.dart';
import '../../../core/motion/app_motion.dart';
import '../../../core/presentation/widgets/app_image.dart';
import '../../../core/presentation/widgets/offline_banner.dart';
import '../../../core/presentation/widgets/press_scale.dart';
import '../../../core/presentation/widgets/primary_button.dart';
import '../../../core/presentation/widgets/round_back_button.dart';
import '../../../core/presentation/widgets/section_message.dart';
import '../../../core/presentation/widgets/shimmer.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/product_providers.dart';
import '../domain/entities/product.dart';
import '../domain/quantity_rules.dart';

part 'widgets/_info_card.dart';
part 'widgets/_description.dart';
part 'widgets/_quantity_stepper.dart';
part 'widgets/_add_to_cart_button.dart';

/// Product detail (`/product/:id`).
///
/// [heroTag] arrives from the tapped tile so the image flies between screens;
/// a direct link falls back to a default tag and simply doesn't animate.
class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.id, this.heroTag});

  final String id;
  final String? heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider(id));
    return Scaffold(
      backgroundColor: AppColors.surfaceMuted,
      body: OfflineBannerLayout(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenGutter,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.sm),
                RoundBackButton(onPressed: () => _back(context)),
                const SizedBox(height: AppSpacing.md),
                Expanded(
                  child: product.when(
                    data: (p) => p == null
                        ? const _NotFound()
                        : _Content(
                            product: p,
                            heroTag: heroTag ?? 'product-$id',
                          ),
                    loading: () => const _DetailSkeleton(),
                    error: (_, _) => SectionError(
                      onRetry: () => ref.invalidate(productProvider(id)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Direct links have nothing to pop to, so fall back to Home.
  void _back(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }
}

class _Content extends HookWidget {
  const _Content({required this.product, required this.heroTag});

  final Product product;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final quantity = useState(minProductQuantity);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _InfoCard(
                  product: product,
                  heroTag: heroTag,
                  quantity: quantity.value,
                  onQuantityChanged: (q) => quantity.value = clampQuantity(q),
                ),
                const SizedBox(height: AppSpacing.md),
                _Description(product.description),
              ],
            ),
          ),
        ),
        _AddToCartButton(product: product, quantity: quantity.value),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}

class _NotFound extends StatelessWidget {
  const _NotFound();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).productUnavailable,
        style: AppTypography.body,
      ),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Shimmer(
      child: Column(
        children: [
          SkeletonBox(
            height: 360,
            width: double.infinity,
            radius: AppRadius.lg,
          ),
          SizedBox(height: AppSpacing.md),
          SkeletonBox(height: 80, width: double.infinity),
        ],
      ),
    );
  }
}
