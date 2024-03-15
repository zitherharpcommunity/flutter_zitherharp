import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

final class FlutterWebConfig extends FlutterConfig {
  /// You only need to call this method
  /// if you need the binding to be initialized before calling [runApp].
  ///
  /// If no binding has yet been initialized,
  /// the [WidgetsFlutterBinding] class is used to create and initialize one.
  @override
  void ensureInitialized({
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
      recaptchaSiteKey: parameters?[FlutterAppCheck.recaptchaSiteKey],
      recaptchaEnterpriseSiteKey:
          parameters?[FlutterAppCheck.recaptchaEnterpriseSiteKey],
    );
    await FlutterRemoteConfig.ensureInitialized();
  }
}
