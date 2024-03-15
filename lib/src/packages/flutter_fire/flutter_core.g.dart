import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

Future<void> ensureInitialized({
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
    recaptchaSiteKey: parameters?[_recaptchaSiteKey],
    recaptchaEnterpriseSiteKey: parameters?[_recaptchaEnterpriseSiteKey],
  );
  await FlutterRemoteConfig.ensureInitialized();
}

const _recaptchaSiteKey = FlutterAppCheck.recaptchaSiteKey;

const _recaptchaEnterpriseSiteKey = FlutterAppCheck.recaptchaEnterpriseSiteKey;
