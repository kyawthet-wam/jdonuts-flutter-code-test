import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../presentation/widgets/offline_banner.dart';

/// Hosts the five tabs. The styled sliding-pill bar replaces this later.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: OfflineBannerLayout(child: navigationShell),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.workspace_premium_outlined),
            label: l10n.navRewards,
          ),
          NavigationDestination(
            icon: const Icon(Icons.explore_outlined),
            label: l10n.navExplore,
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            label: l10n.navWallet,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
