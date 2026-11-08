import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

/// Loyalty tiers in ascending order.
enum MemberTier { bronze, silver, gold, platinum }

extension MemberTierX on MemberTier {
  bool get isBronze => this == MemberTier.bronze;
  bool get isSilver => this == MemberTier.silver;
  bool get isGold => this == MemberTier.gold;
  bool get isPlatinum => this == MemberTier.platinum;

  /// The tier above this one, or null at the top.
  MemberTier? get next => index + 1 < MemberTier.values.length
      ? MemberTier.values[index + 1]
      : null;
}

/// The signed-in customer's loyalty profile.
///
/// One record feeds both Home and Rewards so their tier and points can never
/// disagree (the mock-ups did).
@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required String name,
    required String photoAsset,
    required MemberTier tier,
    required int totalPoints,
    required int pointsToNextTier,

    /// 0..1 progress through the current tier.
    required double tierProgress,
    required int unreadNotifications,
  }) = _Member;
}
