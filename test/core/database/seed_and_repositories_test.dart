import 'dart:convert';

import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/sync/catalog_snapshot.dart';
import 'package:jdonuts/core/sync/catalog_writer.dart';
import 'package:jdonuts/core/sync/seed_loader.dart';
import 'package:jdonuts/features/home/data/drift_home_repository.dart';
import 'package:jdonuts/features/member/data/drift_member_repository.dart';
import 'package:jdonuts/features/member/domain/entities/member.dart';
import 'package:jdonuts/features/product/data/drift_cart_repository.dart';
import 'package:jdonuts/features/product/data/drift_product_repository.dart';
import 'package:jdonuts/features/rewards/data/drift_rewards_repository.dart';

import '../../support/test_database.dart';

void main() {
  late AppDatabase db;

  setUp(() async => db = await seededDatabase());
  tearDown(() => db.close());

  group('seeding', () {
    test('fills an empty database from the bundled JSON', () async {
      final sections = await DriftHomeRepository(db).watchSections().first;

      expect(sections.map((s) => s.title), [
        'Seasonal specials',
        'Popular',
        'Order again',
      ]);
    });

    test('does not seed twice when the version is unchanged', () async {
      final seededAgain = await SeedLoader(db, loadSeedFromDisk).seedIfNeeded();

      expect(seededAgain, isFalse);
    });

    test('keeps product order inside each section', () async {
      final sections = await DriftHomeRepository(db).watchSections().first;

      expect(sections.first.products.map((p) => p.id), [
        'p_mistletoe',
        'p_christmas',
        'p_winter',
      ]);
    });

    test('loads four nearby shops and three banners', () async {
      final repo = DriftHomeRepository(db);

      expect((await repo.watchShops().first).length, 4);
      expect((await repo.watchBanners().first).length, 3);
    });
  });

  group('single member record', () {
    test(
      'is Silver with 500 points to Gold, the value both screens read',
      () async {
        final member = await DriftMemberRepository(db).watchMember().first;

        expect(member!.tier, MemberTier.silver);
        expect(member.pointsToNextTier, 500);
        expect(member.totalPoints, 680000);
      },
    );
  });

  group('rewards', () {
    test('has a completed 4/4, a 1/4 and a 9/12 challenge', () async {
      final challenges = await DriftRewardsRepository(db)
          .watchChallenges()
          .first;

      expect(challenges.map((c) => '${c.current}/${c.target}'), [
        '4/4',
        '1/4',
        '9/12',
      ]);
      expect(challenges.first.isComplete, isTrue);
      expect(challenges[2].progress, closeTo(0.75, 0.001));
    });
  });

  group('product', () {
    test('emits the Coconut Donut reference product', () async {
      final p = await DriftProductRepository(db)
          .watchProduct('p_coconut')
          .first;

      expect(p!.code, 'JD022123');
      expect(p.priceMmk, 3200);
      expect(p.isNew, isTrue);
    });

    test('emits null for an unknown id', () async {
      final p = await DriftProductRepository(db).watchProduct('nope').first;

      expect(p, isNull);
    });
  });

  group('cart', () {
    test('merges quantities for the same product', () async {
      final cart = DriftCartRepository(db);
      await cart.add('p_coconut', 2);
      await cart.add('p_coconut', 3);

      final lines = await cart.watchCart().first;

      expect(lines.single.quantity, 5);
      expect(lines.single.totalMmk, 16000);
    });

    test('survives a catalog refresh', () async {
      final cart = DriftCartRepository(db);
      await cart.add('p_coconut', 1);
      final snapshot = await _bundledSnapshot();

      await CatalogWriter(db).replaceAll(snapshot);

      expect((await cart.watchCart().first).length, 1);
    });
  });

  group('refresh', () {
    test('replaces catalog data and notifies watchers', () async {
      final snapshot = await _bundledSnapshot();
      final changed = snapshot.copyWith(
        member: snapshot.member.copyWith(unreadNotifications: 9),
      );

      await CatalogWriter(db).replaceAll(changed);

      final member = await DriftMemberRepository(db).watchMember().first;
      expect(member!.unreadNotifications, 9);
    });

    test('reseeds when the bundled version is newer', () async {
      final newer = (await _bundledSnapshot()).copyWith(version: 2);
      final loader = SeedLoader(db, (_) async => _encode(newer));

      expect(await loader.seedIfNeeded(), isTrue);
    });
  });

  group('migration', () {
    test(
      'upgrading from v1 adds the cart table and keeps existing data',
      () async {
        // Two databases coexist on purpose: the seeded one and a legacy v1 one.
        driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
        final v1 = AppDatabase(
          NativeDatabase.memory(
            setup: (raw) {
              raw.execute('PRAGMA user_version = 1');
              raw.execute(
                'CREATE TABLE app_meta ("key" TEXT NOT NULL PRIMARY KEY, '
                '"value" TEXT NOT NULL)',
              );
              raw.execute("INSERT INTO app_meta VALUES ('seed_version', '1')");
            },
          ),
        );
        addTearDown(v1.close);

        final meta = await v1.select(v1.appMeta).get();
        final cartAdd = await DriftCartRepository(v1).add('p_any', 1);

        expect(meta.single.value, '1');
        expect(cartAdd.isOk, isTrue);
      },
    );
  });
}

Future<CatalogSnapshot> _bundledSnapshot() async {
  final raw = await loadSeedFromDisk(seedAssetPath);
  return CatalogSnapshot.fromJson(_decode(raw));
}

Map<String, dynamic> _decode(String raw) =>
    (const JsonDecoder().convert(raw)) as Map<String, dynamic>;

String _encode(CatalogSnapshot s) => const JsonEncoder().convert(s.toJson());
