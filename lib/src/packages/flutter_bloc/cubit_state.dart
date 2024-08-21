import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The logic and internal state for a [BaseCubit], [BaseState] and [StatefulWidget].
abstract base class CubitState<C extends BaseCubit<S>, S extends BaseState,
    W extends StatefulWidget> extends State<W> with CubitStateMixin<C, S, W> {}

/// The logic and internal state mixin for a [BaseCubit], [BaseState] and [StatefulWidget].
base mixin CubitStateMixin<C extends BaseCubit<S>, S extends BaseState,
    W extends StatefulWidget> on State<W> {
  /// Obtain a value from the nearest ancestor provider of type [C].
  C get cubit => context.read<C>();

  /// Obtain a value from the nearest ancestor provider of type [C],
  /// and subscribe to the provider.
  S get state => context.watch<C>().state;

  /// The current [stream] of [state].
  Stream<S> get stream => context.watch<C>().stream;

  /// Describes the state of the user interface represented by [W].
  Widget buildState();

  /// Takes the [BuildContext] along with the [cubit] state
  /// and is responsible for executing in response to state changes.
  void listenState() {}

  /// Describes the part of the user interface represented by [W].
  @override
  Widget build(BuildContext context) {
    return CubitBuilder<C, S>(
      cubit: cubit,
      builder: (_, __, ___) => buildState(),
      listener: (_, __, ___) => listenState(),
    );
  }

  @override
  void initState() {
    super.initState();
    FlutterLogger.green.print(
      'Init',
      name: '$W',
    );
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    super.didUpdateWidget(oldWidget);
    FlutterLogger.cyan.print(
      'Update { oldWidget: $oldWidget#${oldWidget.hashCode}, newWidget: $W#${W.hashCode} }',
      name: '$W',
    );
  }

  @override
  void dispose() {
    super.dispose();
    FlutterLogger.magenta.print(
      'Dispose',
      name: '$W',
    );
  }
}
