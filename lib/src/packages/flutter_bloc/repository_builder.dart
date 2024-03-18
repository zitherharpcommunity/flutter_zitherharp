import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// {@template repository_provider}
/// Takes a [cubit] value that is responsible for creating the repository
/// and a [builder] function which will have access to the repository.
///
/// It is used as a _dependency injection (DI)_
/// widget so that a single instance of a repository
/// can be provided to multiple widgets within a subtree.
/// {@endtemplate}
final class RepositoryBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  /// {@macro repository_provider}
  const RepositoryBuilder({
    super.key,
    this.listen = false,
    this.buildWhen,
    required this.cubit,
    required this.builder,
  });

  /// The [cubit] that the [CubitBuilder] will interact with.
  final C cubit;

  /// Obtain a value from the nearest ancestor provider of type [S],
  /// and subscribe to the provider.
  final bool listen;

  /// The [builder] function which will be invoked on each widget build.
  ///
  /// The [builder] takes the BuildContext and current state and must return a widget.
  ///
  /// This is analogous to the [builder] function in [StreamBuilder].
  final CubitValueBuilder<Widget, C, S> builder;

  /// Return `true` or `false` to determine whether or not to rebuild the widget with state.
  final BlocBuilderCondition<S>? buildWhen;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return BlocProvider(
      key: key,
      create: (_) => cubit,
      child: CubitBuilder<C, S>(
        listen: listen,
        builder: builder,
        buildWhen: buildWhen,
      ),
    );
  }
}
