import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The logic and internal state for a [BaseCubit], [BaseState] and [StatefulWidget].
abstract base class CubitState<C extends BaseCubit<S>, S extends BaseState,
    W extends StatefulWidget> extends State<W> {
  /// Whether to listen the stream of type [C].
  bool get listen => true;

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

  /// Describes the state of the user interface represented by [W].
  Widget buildState();

  /// Describes the part of the user interface represented by [W].
  @override
  Widget build(BuildContext context) {
    if (!listen) return buildState();
    return CubitBuilder<C, S>(
      cubit: cubit,
      builder: (_, __, ___) => buildState(),
    );
  }
}

/// The logic and internal state mixin for a [BaseCubit], [BaseState] and [StatefulWidget].
base mixin CubitStateMixin<C extends BaseCubit<S>, S extends BaseState,
    W extends StatefulWidget> on State<W> {
  /// Whether to listen the stream of type [C].
  bool get listen => true;

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

  /// Describes the state of the user interface represented by [W].
  Widget buildState();

  /// Describes the part of the user interface represented by [W].
  @override
  Widget build(BuildContext context) {
    if (!listen) return buildState();
    return CubitBuilder<C, S>(
      cubit: cubit,
      builder: (_, __, ___) => buildState(),
    );
  }
}
