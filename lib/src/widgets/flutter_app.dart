import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
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

  static void ensureInitialized({
    String? name,
    FirebaseOptions? options,
  }) {
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    if (name == null && options == null) return;
    Firebase.initializeApp(name: name, options: options);
  }

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
