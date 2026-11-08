import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/database_providers.dart';
import '../domain/entities/member.dart';
import '../domain/repositories/member_repository.dart';
import 'drift_member_repository.dart';

part 'member_providers.g.dart';

@Riverpod(keepAlive: true)
MemberRepository memberRepository(Ref ref) =>
    DriftMemberRepository(ref.watch(appDatabaseProvider));

/// The one member record read by Home and Rewards.
@riverpod
Stream<Member?> member(Ref ref) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(memberRepositoryProvider).watchMember();
}
