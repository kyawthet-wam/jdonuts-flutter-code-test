import '../entities/challenge.dart';

abstract interface class RewardsRepository {
  Stream<List<Challenge>> watchChallenges();
}
