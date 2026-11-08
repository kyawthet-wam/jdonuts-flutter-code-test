import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../presentation/widgets/bottom_nav/app_bottom_nav.dart';
import '../presentation/widgets/bottom_nav/crown_icon.dart';
import '../presentation/widgets/offline_banner.dart';

/// Hosts the five tabs with the sliding-pill bottom bar.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      // The bar floats, so the page runs behind it; screens pad their bottom.
      extendBody: true,
      body: OfflineBannerLayout(child: navigationShell),
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: [
          BottomNavItem(
            iconBuilder: (c) => materialNavIcon(Icons.home_outlined, c),
            label: l10n.navHome,
          ),
          BottomNavItem(
            iconBuilder: (c) => CrownIcon(color: c),
            label: l10n.navRewards,
          ),
          BottomNavItem(
            iconBuilder: (c) => materialNavIcon(Icons.catching_pokemon, c),
            label: l10n.navExplore,
          ),
          BottomNavItem(
            iconBuilder: (c) =>
                materialNavIcon(Icons.account_balance_wallet_outlined, c),
            label: l10n.navWallet,
          ),
          BottomNavItem(
            iconBuilder: (c) => materialNavIcon(Icons.settings_outlined, c),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
