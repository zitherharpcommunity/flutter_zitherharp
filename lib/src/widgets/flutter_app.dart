import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// An application that uses design of FLutter.
final class FlutterApp<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  /// The default map of keyboard shortcuts to intents for the application.
  static final shortcuts = {
    ...WidgetsApp.defaultShortcuts,
    const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  };

  /// The default [ScrollBehavior] for the application.
  static final scrollBehavior = const MaterialScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.stylus,
      PointerDeviceKind.unknown,
    },
  );

  /// You only need to call this method
  /// if you need the binding to be initialized before calling [runApp].
  ///
  /// If no binding has yet been initialized,
  /// the [WidgetsFlutterBinding] class is used to create and initialize one.
  static void ensureInitialized({
    String? name,
    FirebaseOptions? options,
    bool useFirebasePlugins = false,
    Map<String, dynamic>? parameters,
  }) async {
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    if (name == null && options == null) return;
    await Firebase.initializeApp(name: name, options: options);
    if (useFirebasePlugins == false) return;
    await FlutterAppCheck.ensureInitialized(
      recaptchaSiteKey: parameters?['recaptchaSiteKey'],
      recaptchaEnterpriseSiteKey: parameters?['recaptchaEnterpriseSiteKey'],
    );
    await FlutterCrashlytics.ensureInitialized();
    await FlutterRemoteConfig.ensureInitialized();
  }

  /// Creates a [FlutterApp].
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
