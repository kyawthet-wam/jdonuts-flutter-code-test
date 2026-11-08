import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Something that can confirm the internet is genuinely reachable.
typedef ReachabilityCheck = Future<bool> Function();

const Duration _lookupTimeout = Duration(seconds: 3);
const String _lookupHost = 'one.one.one.one';

/// DNS lookup: fails fast in airplane mode and on captive portals.
Future<bool> dnsReachability() async {
  try {
    final result = await InternetAddress.lookup(_lookupHost)
        .timeout(_lookupTimeout);
    return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
  } on Object {
    return false;
  }
}

/// Online state.
///
/// Why two signals: the connectivity plugin only says a network interface is
/// up (Wi-Fi with no internet still reads "connected"), so every change is
/// confirmed with a real reachability check.
abstract interface class ConnectivityService {
  Future<bool> isOnline();

  /// Emits the current state first, then every change.
  Stream<bool> watchOnline();
}

class PluginConnectivityService implements ConnectivityService {
  PluginConnectivityService({
    Connectivity? connectivity,
    this._reachability = dnsReachability,
  }) : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;
  final ReachabilityCheck _reachability;

  @override
  Future<bool> isOnline() async {
    final results = await _connectivity.checkConnectivity();
    if (results.every((r) => r == ConnectivityResult.none)) return false;
    return _reachability();
  }

  @override
  Stream<bool> watchOnline() async* {
    yield await isOnline();
    yield* _connectivity.onConnectivityChanged
        .asyncMap((_) => isOnline())
        .distinct();
  }
}
