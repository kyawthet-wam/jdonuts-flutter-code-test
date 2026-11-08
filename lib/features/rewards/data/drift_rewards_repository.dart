import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../domain/entities/challenge.dart';
import '../domain/repositories/rewards_repository.dart';

class DriftRewardsRepository implements RewardsRepository {
  const DriftRewardsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Challenge>> watchChallenges() {
    final query = _db.select(_db.challenges)
      ..orderBy([(c) => OrderingTerm.asc(c.position)]);
    return query.watch().map(
      (rows) => [
        for (final r in rows)
          Challenge(
            id: r.id,
            title: r.title,
            kind: ChallengeKind.values.byName(r.kind),
            current: r.current,
            target: r.target,
            rewardPoints: r.rewardPoints,
          ),
      ],
    );
  }
}
