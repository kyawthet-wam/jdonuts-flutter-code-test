import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';

/// Decides which progress artwork a challenge card draws.
enum ChallengeKind { donut, coffee }

extension ChallengeKindX on ChallengeKind {
  bool get isDonut => this == ChallengeKind.donut;
  bool get isCoffee => this == ChallengeKind.coffee;
}

@freezed
abstract class Challenge with _$Challenge {
  const Challenge._();

  const factory Challenge({
    required String id,
    required String title,
    required ChallengeKind kind,
    required int current,
    required int target,
    required int rewardPoints,
  }) = _Challenge;

  bool get isComplete => current >= target;

  /// 0..1 fraction used by the progress artwork.
  double get progress => target == 0 ? 0 : (current / target).clamp(0, 1);
}
