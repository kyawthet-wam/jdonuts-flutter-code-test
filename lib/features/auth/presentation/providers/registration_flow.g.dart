// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_flow.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives login and registration across the step screens.
///
/// Why keepAlive: the state must survive navigating back and forth between
/// steps. Every action is ignored while [RegistrationFlowState.isBusy], which
/// is what makes a double tap send a single request.

@ProviderFor(RegistrationFlow)
final registrationFlowProvider = RegistrationFlowProvider._();

/// Drives login and registration across the step screens.
///
/// Why keepAlive: the state must survive navigating back and forth between
/// steps. Every action is ignored while [RegistrationFlowState.isBusy], which
/// is what makes a double tap send a single request.
final class RegistrationFlowProvider
    extends $NotifierProvider<RegistrationFlow, RegistrationFlowState> {
  /// Drives login and registration across the step screens.
  ///
  /// Why keepAlive: the state must survive navigating back and forth between
  /// steps. Every action is ignored while [RegistrationFlowState.isBusy], which
  /// is what makes a double tap send a single request.
  RegistrationFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registrationFlowProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registrationFlowHash();

  @$internal
  @override
  RegistrationFlow create() => RegistrationFlow();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegistrationFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegistrationFlowState>(value),
    );
  }
}

String _$registrationFlowHash() => r'4a8b08cc2f14e67cdc5c57bdf378b7d25f90ed1d';

/// Drives login and registration across the step screens.
///
/// Why keepAlive: the state must survive navigating back and forth between
/// steps. Every action is ignored while [RegistrationFlowState.isBusy], which
/// is what makes a double tap send a single request.

abstract class _$RegistrationFlow extends $Notifier<RegistrationFlowState> {
  RegistrationFlowState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RegistrationFlowState, RegistrationFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RegistrationFlowState, RegistrationFlowState>,
              RegistrationFlowState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
