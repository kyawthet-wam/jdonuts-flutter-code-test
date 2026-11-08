/// The two tabs under the points summary.
enum RewardTab { earn, gift }

extension RewardTabX on RewardTab {
  bool get isEarn => this == RewardTab.earn;
  bool get isGift => this == RewardTab.gift;
}
