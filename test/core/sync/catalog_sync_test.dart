import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/connectivity/connectivity_service.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/network/remote_catalog_source.dart';
import 'package:jdonuts/core/result/failure.dart';
import 'package:jdonuts/core/result/result.dart';
import 'package:jdonuts/core/sync/catalog_snapshot.dart';
import 'package:jdonuts/core/sync/catalog_sync.dart';
import 'package:jdonuts/core/sync/catalog_writer.dart';
import 'package:jdonuts/core/sync/seed_loader.dart';
import 'package:jdonuts/features/member/data/drift_member_repository.dart';

import '../../support/test_database.dart';

class _FakeConnectivity implements ConnectivityService {
  _FakeConnectivity({this.online = true});

  bool online;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() => Stream.value(online);
}

class _FakeRemote implements RemoteCatalogSource {
  _FakeRemote(this.snapshot, {this.delay = Duration.zero});

  final CatalogSnapshot snapshot;
  final Duration delay;
  int fetches = 0;

  @override
  Future<Result<CatalogSnapshot>> fetchCatalog() async {
    fetches++;
    await Future<void>.delayed(delay);
    return Result.ok(snapshot);
  }

  @override
  Future<bool> isReachable() async => true;
}

Future<CatalogSnapshot> _seedSnapshot() async {
  final raw = await loadSeedFromDisk(seedAssetPath);
  return CatalogSnapshot.fromJson(jsonDecode(raw) as Map<String, dynamic>);
}

void main() {
  late AppDatabase db;
  late CatalogSnapshot base;

  setUp(() async {
    db = await seededDatabase();
    base = await _seedSnapshot();
  });
  tearDown(() => db.close());

  CatalogSync syncWith(RemoteCatalogSource? remote, {bool online = true}) =>
      CatalogSync(
        remote: remote,
        writer: CatalogWriter(db),
        connectivity: _FakeConnectivity(online: online),
      );

  test('is a successful no-op when no server is configured', () async {
    final result = await syncWith(null).refresh();

    expect(result.isOk, isTrue);
  });

  test(
    'fails with NetworkFailure while offline and keeps local data',
    () async {
      final remote = _FakeRemote(base);

      final result = await syncWith(remote, online: false).refresh();

      expect(result.failureOrNull, isA<NetworkFailure>());
      expect(remote.fetches, 0);
      expect(await DriftMemberRepository(db).watchMember().first, isNotNull);
    },
  );

  test('writes fetched data into the database when online', () async {
    final changed = base.copyWith(
      member: base.member.copyWith(unreadNotifications: 7),
    );

    await syncWith(_FakeRemote(changed)).refresh();

    final member = await DriftMemberRepository(db).watchMember().first;
    expect(member!.unreadNotifications, 7);
  });

  test('concurrent refreshes share one request', () async {
    final remote = _FakeRemote(base, delay: const Duration(milliseconds: 20));
    final sync = syncWith(remote);

    await Future.wait([sync.refresh(), sync.refresh(), sync.refresh()]);

    expect(remote.fetches, 1);
  });
}
