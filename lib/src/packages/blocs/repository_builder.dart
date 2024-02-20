import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// {@template repository_provider}
/// Takes a [bloc] value that is responsible for creating the repository 
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
    required this.bloc,
    required this.builder,
  });

  final C bloc;

  /// The [builder] function which will be invoked on each widget build. 
  /// 
  /// The [builder] takes the BuildContext and current state and must return a widget. 
  /// 
  /// This is analogous to the [builder] function in [StreamBuilder].
  final BlocWidgetBuilder<S> builder;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return RepositoryProvider(
      key: key,
      create: (_) => bloc,
      child: BlocBuilder<C, S>(builder: builder),
    );
  }
}
