import '../../../core/database/app_database.dart';
import '../domain/entities/member.dart';
import '../domain/repositories/member_repository.dart';

class DriftMemberRepository implements MemberRepository {
  const DriftMemberRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<Member?> watchMember() {
    return _db
        .select(_db.members)
        .watchSingleOrNull()
        .map(
          (r) => r == null
              ? null
              : Member(
                  id: r.id,
                  name: r.name,
                  photoAsset: r.photoAsset,
                  tier: MemberTier.values.byName(r.tier),
                  totalPoints: r.totalPoints,
                  pointsToNextTier: r.pointsToNextTier,
                  tierProgress: r.tierProgress,
                  unreadNotifications: r.unreadNotifications,
                ),
        );
  }
}
