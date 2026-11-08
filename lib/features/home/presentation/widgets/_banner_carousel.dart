part of '../home_screen.dart';

const double _bannerViewport = 0.88;
const double _bannerHeight = 150;

/// Auto-playing banner pager. Auto-play stops under Reduce Motion.
class _BannerCarousel extends HookConsumerWidget {
  const _BannerCarousel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(homeBannersProvider);
    return banners.when(
      data: (items) =>
          items.isEmpty ? const SectionEmpty() : _Pager(banners: items),
      loading: () => const _BannerSkeleton(),
      error: (_, _) =>
          SectionError(onRetry: () => ref.invalidate(homeBannersProvider)),
    );
  }
}

class _Pager extends HookWidget {
  const _Pager({required this.banners});

  final List<HomeBanner> banners;

  @override
  Widget build(BuildContext context) {
    final controller = usePageController(viewportFraction: _bannerViewport);
    final reduce = MediaQuery.disableAnimationsOf(context);
    final duration = AppMotion.resolve(context, AppMotion.slow);
    useEffect(() {
      if (reduce || banners.length < 2) return null;
      final timer = Timer.periodic(AppMotion.bannerAutoPlay, (_) {
        if (!controller.hasClients) return;
        final next = ((controller.page ?? 0).round() + 1) % banners.length;
        controller.animateToPage(
          next,
          duration: duration,
          curve: AppMotion.emphasized,
        );
      });
      return timer.cancel;
    }, [reduce, banners.length]);

    return SizedBox(
      height: _bannerHeight,
      child: PageView.builder(
        controller: controller,
        itemCount: banners.length,
        padEnds: false,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.only(
            left: i == 0 ? AppSpacing.screenGutter : AppSpacing.xs,
            right: AppSpacing.xs,
          ),
          child: _BannerCard(banners[i]),
        ),
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard(this.banner);

  final HomeBanner banner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(asset: banner.imageAsset, url: banner.imageUrl),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (banner.badge != null) _BadgePill(banner.badge!),
                const SizedBox(height: AppSpacing.xs),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Text(
                    banner.title,
                    style: AppTypography.subtitle.copyWith(
                      color: AppColors.textOnPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.promo,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        text,
        style: AppTypography.caption.copyWith(color: AppColors.textOnPrimary),
      ),
    );
  }
}
