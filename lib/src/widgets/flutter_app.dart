import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// An application that uses design of Flutter.
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
    if (kIsWeb) usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    if (name == null && options == null) return;
    await Firebase.initializeApp(name: name, options: options);
    if (useFirebasePlugins == false) return;
    await FlutterAppCheck.ensureInitialized(
      recaptchaSiteKey: parameters?[FlutterAppCheck.recaptchaSiteKey],
      recaptchaEnterpriseSiteKey:
          parameters?[FlutterAppCheck.recaptchaEnterpriseSiteKey],
    );
    await FlutterRemoteConfig.ensureInitialized();
    if (!kIsWeb) await FlutterCrashlytics.ensureInitialized();
  }

  /// Creates a [FlutterApp].
  const FlutterApp({
    super.key,
    required this.cubit,
    required this.builder,
  });

  final C cubit;

  final CubitWidgetBuilder<C, S> builder;

  @override
  Widget build(BuildContext context) {
    return RepositoryBuilder(
      cubit: cubit,
      builder: builder,
    );
  }
}
