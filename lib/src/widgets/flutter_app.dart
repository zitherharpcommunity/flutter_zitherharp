import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// An application that uses Flutter Design.
final class FlutterApp<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  static final shortcuts = {
    ...WidgetsApp.defaultShortcuts,
    const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  };

  static final scrollBehavior = const MaterialScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.stylus,
      PointerDeviceKind.unknown,
    },
  );

  const FlutterApp({
    super.key,
    required this.bloc,
    required this.builder,
  });

  final C bloc;
  final BlocWidgetBuilder<S> builder;

  @override
  Widget build(BuildContext context) {
    return RepositoryBuilder(
      bloc: bloc,
      builder: builder,
    );
  }
}
