import 'package:flutter_zitherharp/flutter_zitherharp.dart';

typedef CubitWidgetBuilder<C extends BaseCubit<S>, S extends BaseState> = Widget
    Function(BuildContext context, C cubit, S state);

class CubitBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  const CubitBuilder({
    super.key,
    this.listen = false,
    this.buildWhen,
    required this.builder,
  });

  final bool listen;
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
