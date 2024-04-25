import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// You only need to call this method
/// if you need the binding to be initialized before calling [runApp].
///
/// If no binding has yet been initialized,
/// the [WidgetsFlutterBinding] class is used to create and initialize one.
///
/// **NOTE**: _Only available in web platform._
Future<void> ensureInitialized({
  String? name,
  FirebaseOptions? options,
  bool useFirebasePlugins = false,
  Map<String, dynamic>? parameters,
}) async {
  usePathUrlStrategy();
  Bloc.observer = CubitObserver();
  if (name == null && options == null) return;
  await Firebase.initializeApp(name: name, options: options);
  if (useFirebasePlugins == false) return;
  await FlutterAppCheck.ensureInitialized(
    recaptchaSiteKey: parameters?[_recaptchaSiteKey],
    recaptchaEnterpriseSiteKey: parameters?[_recaptchaEnterpriseSiteKey],
  );
  await FlutterRemoteConfig.ensureInitialized();
}

const String _recaptchaSiteKey = FlutterAppCheck.recaptchaSiteKey;

const String _recaptchaEnterpriseSiteKey =
    FlutterAppCheck.recaptchaEnterpriseSiteKey;
