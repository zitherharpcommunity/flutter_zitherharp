import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Signature for the `builder` function which takes the `BuildContext` and
/// [state] and is responsible for returning a widget which is to be rendered.
///
/// This is analogous to the `builder` function in [StreamBuilder].
typedef CubitWidgetBuilder<C extends BaseCubit<S>, S extends BaseState> = Widget
    Function(BuildContext context, C cubit, S state);

/// {@template cubit_builder}
/// [CubitBuilder] handles building a widget in response to new `states`.
///
/// [CubitBuilder] is analogous to [StreamBuilder] but has simplified API to
/// reduce the amount of boilerplate code needed as well as [cubit]-specific
/// performance improvements.

/// Please refer to [BlocListener] if you want to "do" anything in response to
/// `state` changes such as navigation, showing a dialog, etc...
/// {@endtemplate}
final class CubitBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  /// {@macro cubit_builder}
  const CubitBuilder({
    super.key,
    this.cubit,
    this.listen = false,
    this.buildWhen,
    required this.builder,
  });

  /// The [cubit] that the [CubitBuilder] will interact with.
  ///
  /// If omitted, it will automatically perform a lookup using
  /// [BlocProvider] and the current `BuildContext`.
  final C? cubit;

  /// Obtain a value from the nearest ancestor provider of type [S],
  /// and subscribe to the provider.
  final bool listen;

  /// An optional [buildWhen] can be implemented for more granular control over
  /// how often [BlocBuilder] rebuilds.
  ///
  /// [buildWhen] should only be used for performance optimizations as it
  /// provides no security about the state passed to the [builder] function.
  /// [buildWhen] will be invoked on each [cubit] `state` change.
  ///
  /// [buildWhen] takes the previous `state` and current `state` and must
  /// return a [bool] which determines whether or not the [builder] function will
  /// be invoked.
  ///
  /// The previous `state` will be initialized to the `state` of the [cubit] when
  /// the [BlocBuilder] is initialized.
  /// [buildWhen] is optional and if omitted, it will default to `true`.
  final BlocBuilderCondition<S>? buildWhen;

  /// The [builder] function which will be invoked on each widget build.
  ///
  /// The [builder] takes the [BuildContext] and current [state] must return a widget.
  ///
  /// This is analogous to the [builder] function in [StreamBuilder].
  final CubitWidgetBuilder<C, S> builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      key: key,
      buildWhen: buildWhen,
      builder: (context, state) {
        return builder(
          context,
          context.read<C>(),
          listen ? state : context.watch<C>().state,
        );
      },
    );
  }
}
