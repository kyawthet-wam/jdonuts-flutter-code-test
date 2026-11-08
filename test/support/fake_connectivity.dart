import 'dart:async';

import 'package:jdonuts/core/connectivity/connectivity_service.dart';

/// Controllable connectivity for tests: call [setOnline] to flip state.
class FakeConnectivityService implements ConnectivityService {
  FakeConnectivityService([this._online = true]);

  final StreamController<bool> _changes = StreamController<bool>.broadcast();
  bool _online;

  void setOnline(bool value) {
    _online = value;
    _changes.add(value);
  }

  @override
  Future<bool> isOnline() async => _online;

  @override
  Stream<bool> watchOnline() async* {
    yield _online;
    yield* _changes.stream;
  }
}
