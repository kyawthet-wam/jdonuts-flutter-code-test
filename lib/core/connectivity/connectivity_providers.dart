import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity_service.dart';

part 'connectivity_providers.g.dart';

@Riverpod(keepAlive: true)
ConnectivityService connectivityService(Ref ref) => PluginConnectivityService();

/// Live online state. Assumes online until the first check completes so the
/// offline banner doesn't flash on launch.
@Riverpod(keepAlive: true)
Stream<bool> isOnline(Ref ref) =>
    ref.watch(connectivityServiceProvider).watchOnline();
