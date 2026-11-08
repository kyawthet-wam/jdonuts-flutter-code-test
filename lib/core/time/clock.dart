import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock.g.dart';

/// Source of "now"; overridden in tests so age rules are deterministic.
@Riverpod(keepAlive: true)
DateTime Function() clock(Ref ref) => DateTime.now;
