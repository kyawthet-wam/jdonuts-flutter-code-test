import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/database_providers.dart';
import '../domain/entities/challenge.dart';
import '../domain/repositories/rewards_repository.dart';
import 'drift_rewards_repository.dart';

part 'rewards_providers.g.dart';

@Riverpod(keepAlive: true)
RewardsRepository rewardsRepository(Ref ref) =>
    DriftRewardsRepository(ref.watch(appDatabaseProvider));

@riverpod
Stream<List<Challenge>> challenges(Ref ref) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(rewardsRepositoryProvider).watchChallenges();
}
