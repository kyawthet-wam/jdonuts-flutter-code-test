part of '../home_screen.dart';

/// Seasonal specials, Popular and Order again, each with its own states.
class _SectionsList extends ConsumerWidget {
  const _SectionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(homeSectionsProvider);
    return sections.when(
      data: (items) => items.isEmpty
          ? const _SectionFrame(title: '', child: SectionEmpty())
          : Column(
              children: [
                for (final (i, s) in items.indexed)
                  StaggeredEntrance(
                    index: i,
                    child: _ProductSectionView(section: s),
                  ),
              ],
            ),
      loading: () => const _SectionsSkeleton(),
      error: (_, _) => _SectionFrame(
        title: '',
        child: SectionError(
          onRetry: () => ref.invalidate(homeSectionsProvider),
        ),
      ),
    );
  }
}

class _ProductSectionView extends StatelessWidget {
  const _ProductSectionView({required this.section});

  final ProductSection section;

  @override
  Widget build(BuildContext context) {
    return _SectionFrame(
      title: section.title,
      child: section.products.isEmpty
          ? const SectionEmpty()
          : _ProductRow(section: section),
    );
  }
}

/// Title row with the arrow button, then [child].
class _SectionFrame extends StatelessWidget {
  const _SectionFrame({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [if (title.isNotEmpty) _SectionTitle(title), child],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenGutter,
        0,
        AppSpacing.screenGutter,
        AppSpacing.sm,
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: AppTypography.subtitle)),
          Semantics(
            button: true,
            label: AppLocalizations.of(context).seeAll(title),
            child: PressScale(
              onTap: () {},
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_right, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  const _ProductRow({required this.section});

  final ProductSection section;

  @override
  Widget build(BuildContext context) {
    final style = section.kind.isSeasonal
        ? _ProductCardStyle.wide
        : _ProductCardStyle.tile;
    return SizedBox(
      height: context.scaledHeight(style.rowHeight),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenGutter,
        ),
        itemCount: section.products.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, i) => _ProductCard(
          product: section.products[i],
          style: style,
          heroTag: 'product-${section.id}-${section.products[i].id}',
        ),
      ),
    );
  }
}
