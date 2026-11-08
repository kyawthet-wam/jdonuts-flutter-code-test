import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/database_providers.dart';
import '../domain/entities/home_banner.dart';
import '../domain/entities/product_section.dart';
import '../domain/entities/shop.dart';
import '../domain/repositories/home_repository.dart';
import 'drift_home_repository.dart';

part 'home_providers.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) =>
    DriftHomeRepository(ref.watch(appDatabaseProvider));

// Each section of Home has its own stream so it can show its own loading,
// empty and error state independently.

@riverpod
Stream<List<HomeBanner>> homeBanners(Ref ref) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchBanners();
}

@riverpod
Stream<List<ProductSection>> homeSections(Ref ref) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchSections();
}

@riverpod
Stream<List<Shop>> homeShops(Ref ref) async* {
  await ref.watch(databaseSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchShops();
}
