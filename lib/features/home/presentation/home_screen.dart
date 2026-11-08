import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/connectivity/connectivity_providers.dart';
import '../../../core/format/number_format.dart';
import '../../../core/layout/text_scale.dart';
import '../../../core/motion/app_motion.dart';
import '../../../core/presentation/widgets/app_image.dart';
import '../../../core/presentation/widgets/press_scale.dart';
import '../../../core/presentation/widgets/primary_button.dart';
import '../../../core/presentation/widgets/section_message.dart';
import '../../../core/presentation/widgets/shimmer.dart';
import '../../../core/presentation/widgets/staggered_entrance.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/sync/sync_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../member/data/member_providers.dart';
import '../../member/domain/entities/member.dart';
import '../../member/presentation/tier_labels.dart';
import '../../product/domain/entities/product.dart';
import '../data/home_providers.dart';
import '../domain/entities/home_banner.dart';
import '../domain/entities/product_section.dart';
import '../domain/entities/shop.dart';

part 'widgets/_banner_carousel.dart';
part 'widgets/_header.dart';
part 'widgets/_product_card.dart';
part 'widgets/_product_sections.dart';
part 'widgets/_shops_section.dart';
part 'widgets/_skeletons.dart';

/// Home tab: member header, banners, product lists and nearby shops.
///
/// Everything reads the local database, so it renders offline. Each section
/// owns its loading, empty and error state; pull-to-refresh asks the sync
/// layer to update the database and the streams repaint by themselves.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.surfaceMuted,
      body: RefreshIndicator(
        edgeOffset: MediaQuery.paddingOf(context).top,
        onRefresh: () => _refresh(context, ref),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [_HeaderSection(), _SectionsList(), _ShopsSection()],
        ),
      ),
    );
  }

  /// Pull-to-refresh. A server failure is reported (the screen keeps showing
  /// saved data); while offline the banner already says so, so stay quiet.
  Future<void> _refresh(BuildContext context, WidgetRef ref) async {
    final result = await ref.read(syncControllerProvider.notifier).refresh();
    if (!context.mounted || result.isOk) return;
    final offline = !(ref.read(isOnlineProvider).value ?? true);
    if (offline) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).refreshFailed)),
    );
  }
}
