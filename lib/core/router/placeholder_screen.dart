import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

/// Stand-in for tabs that are intentionally not built (brief: only Home and
/// Rewards need to work).
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(AppLocalizations.of(context).comingSoon)),
    );
  }
}
