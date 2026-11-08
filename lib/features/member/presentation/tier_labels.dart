import '../../../l10n/generated/app_localizations.dart';
import '../domain/entities/member.dart';

/// Localised tier names; kept out of the domain so it holds no UI text.
extension MemberTierLabel on MemberTier {
  String label(AppLocalizations l10n) => switch (this) {
    MemberTier.bronze => l10n.tierBronze,
    MemberTier.silver => l10n.tierSilver,
    MemberTier.gold => l10n.tierGold,
    MemberTier.platinum => l10n.tierPlatinum,
  };
}
