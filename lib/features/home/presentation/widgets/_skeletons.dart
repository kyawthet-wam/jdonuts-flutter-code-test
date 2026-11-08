part of '../home_screen.dart';

/// Shimmering placeholders shown while a section loads (never spinners).

class _MemberSkeleton extends StatelessWidget {
  const _MemberSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Shimmer(
      child: Row(
        children: [
          SkeletonBox(width: 52, height: 52, radius: AppRadius.pill),
          SizedBox(width: AppSpacing.sm),
          Expanded(child: SkeletonBox(height: 36)),
        ],
      ),
    );
  }
}

class _BannerSkeleton extends StatelessWidget {
  const _BannerSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      child: Shimmer(
        child: SkeletonBox(
          height: _bannerHeight,
          width: double.infinity,
          radius: AppRadius.lg,
        ),
      ),
    );
  }
}

class _SectionsSkeleton extends StatelessWidget {
  const _SectionsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        AppSpacing.lg,
        0,
        0,
      ),
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonBox(width: 140, height: 18),
            const SizedBox(height: AppSpacing.sm),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    const SkeletonBox(
                      width: 170,
                      height: 100,
                      radius: AppRadius.lg,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShopsSkeleton extends StatelessWidget {
  const _ShopsSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter),
      child: Shimmer(
        child: SkeletonBox(
          height: 200,
          width: double.infinity,
          radius: AppRadius.lg,
        ),
      ),
    );
  }
}
