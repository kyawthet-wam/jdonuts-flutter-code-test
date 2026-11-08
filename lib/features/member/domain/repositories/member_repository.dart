import '../entities/member.dart';

abstract interface class MemberRepository {
  /// Emits the member, or null before the first seed completes.
  Stream<Member?> watchMember();
}
