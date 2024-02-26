import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Signature for the `builder` function which takes the [context] and two `state`'s
/// and is responsible for returning a widget which is to be rendered.
///
/// This is analogous to the `builder` function in [StreamBuilder].
typedef BlocWidgetBuilder2<S1, S2> = Widget Function(
  BuildContext context,
  S1 state1,
  S2 state2,
);

/// {@template bloc_builder2}
/// Merges two [BlocBuilder] widgets into one widget tree.
///
/// [BlocBuilder2] improves the readability
/// and eliminates the need to nest two [BlocBuilder]s.
/// {@endtemplate}
final class BlocBuilder2<B1 extends BaseCubit<S1>, S1 extends BaseState,
    B2 extends BaseCubit<S2>, S2 extends BaseState> extends StatelessWidget {
  /// {@macro bloc_builder2}
  const BlocBuilder2({
    super.key,
    this.bloc1,
    this.bloc2,
    this.buildWhen1,
    this.buildWhen2,
    required this.builder,
  });

  final B1? bloc1;

  final B2? bloc2;

  final BlocBuilderCondition<S1>? buildWhen1;

  final BlocBuilderCondition<S2>? buildWhen2;

  final BlocWidgetBuilder2<S1, S2> builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B1, S1>(
      bloc: bloc1,
      buildWhen: buildWhen1,
      builder: (context, state1) {
        return BlocBuilder<B2, S2>(
          bloc: bloc2,
          buildWhen: buildWhen2,
          builder: (context, state2) {
            return builder(
              context,
              state1,
              state2,
            );
          },
        );
      },
    );
  }
}
