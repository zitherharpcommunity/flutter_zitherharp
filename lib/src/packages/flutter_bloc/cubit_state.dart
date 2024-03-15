import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The logic and internal state for a [BaseCubit], [BaseState] and [StatefulWidget].
abstract base class CubitState<C extends BaseCubit<S>, S extends BaseState,
    T extends StatefulWidget> extends State<T> {
  /// Obtain a value from the nearest ancestor provider of type [C].
  @protected
  C get cubit => context.read<C>();

  /// Obtain a value from the nearest ancestor provider of type [C],
  /// and subscribe to the provider.
  @protected
  S get state => context.watch<C>().state;

  /// The current [stream] of [state].
  @protected
  Stream<S> get stream => context.watch<C>().stream;
}

/// The logic and internal state mixin for a [BaseCubit], [BaseState] and [StatefulWidget].
base mixin CubitStateMixin<C extends BaseCubit<S>, S extends BaseState,
    T extends StatefulWidget> on State<T> {
  /// Obtain a value from the nearest ancestor provider of type [C].
  @protected
  C get cubit => context.read<C>();

  /// Obtain a value from the nearest ancestor provider of type [C],
  /// and subscribe to the provider.
  @protected
  S get state => context.watch<C>().state;

  /// The current [stream] of [state].
  @protected
  Stream<S> get stream => context.watch<C>().stream;
}
