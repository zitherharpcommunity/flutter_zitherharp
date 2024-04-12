import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// An application that uses design of Flutter.
final class FlutterApp<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  /// The default map of keyboard shortcuts to intents for the application.
  static final Map<ShortcutActivator, Intent> shortcuts = {
    ...WidgetsApp.defaultShortcuts,
    const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  };

  /// The default [ScrollBehavior] for the application.
  static final ScrollBehavior scrollBehavior =
      const MaterialScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.stylus,
      PointerDeviceKind.unknown,
    },
  );

  /// Creates a [FlutterApp].
  const FlutterApp({
    super.key,
    required this.cubit,
    required this.builder,
  });

  final C cubit;

  final CubitValueBuilder<Widget, C, S> builder;

  @override
  Widget build(BuildContext context) {
    return RepositoryBuilder(
      cubit: cubit,
      builder: builder,
    );
  }
}
