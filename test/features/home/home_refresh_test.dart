import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/connectivity/connectivity_service.dart';
import 'package:jdonuts/core/database/app_database.dart';
import 'package:jdonuts/core/network/remote_catalog_source.dart';
import 'package:jdonuts/core/result/failure.dart';
import 'package:jdonuts/core/result/result.dart';
import 'package:jdonuts/core/sync/catalog_snapshot.dart';
import 'package:jdonuts/core/sync/catalog_sync.dart';
import 'package:jdonuts/core/sync/catalog_writer.dart';
import 'package:jdonuts/core/sync/sync_providers.dart';

import '../../support/fake_connectivity.dart';
import '../../support/pump_app.dart';
import '../../support/test_database.dart';

class _FailingRemote implements RemoteCatalogSource {
  @override
  Future<Result<CatalogSnapshot>> fetchCatalog() async =>
      const Result.err(ServerFailure('boom', statusCode: 500));

  @override
  Future<bool> isReachable() async => false;
}

const String _refreshFailed = "Couldn't refresh right now. Showing saved data.";

Future<void> _pullToRefresh(WidgetTester tester) async {
  await tester.fling(find.byType(ListView).first, const Offset(0, 400), 1000);
  await tester.pumpAndSettle();
}

Future<void> _pumpWithFailingServer(
  WidgetTester tester, {
  required FakeConnectivityService connectivity,
}) async {
  final db = (await tester.runAsync(seededDatabase))!;
  await pumpApp(
    tester,
    signedIn: true,
    database: db,
    connectivity: connectivity,
    overrides: [
      catalogSyncProvider.overrideWithValue(_syncWith(db, connectivity)),
    ],
  );
}

CatalogSync _syncWith(AppDatabase db, ConnectivityService connectivity) =>
    CatalogSync(
      remote: _FailingRemote(),
      writer: CatalogWriter(db),
      connectivity: connectivity,
    );

void main() {
  testApp('a server error on pull-to-refresh tells the user and keeps data', (
    tester,
  ) async {
    await _pumpWithFailingServer(
      tester,
      connectivity: FakeConnectivityService(),
    );

    await _pullToRefresh(tester);

    expect(find.text(_refreshFailed), findsOneWidget);
    expect(find.text('Hania'), findsOneWidget);
  });

  testApp('pull-to-refresh while offline stays quiet (the banner says it)', (
    tester,
  ) async {
    await _pumpWithFailingServer(
      tester,
      connectivity: FakeConnectivityService(false),
    );

    await _pullToRefresh(tester);

    expect(find.text(_refreshFailed), findsNothing);
    expect(find.textContaining("You're offline"), findsOneWidget);
  });

  testApp('pull-to-refresh with no server configured shows no error', (
    tester,
  ) async {
    await pumpApp(tester, signedIn: true);

    await _pullToRefresh(tester);

    expect(find.text(_refreshFailed), findsNothing);
  });
}
