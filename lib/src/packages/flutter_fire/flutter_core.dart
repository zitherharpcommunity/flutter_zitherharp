import 'package:flutter_zitherharp/flutter_zitherharp.dart';

void ensureInitialized({
  String? name,
  FirebaseOptions? options,
  bool useFirebasePlugins = false,
  Map<String, dynamic>? parameters,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (name == null && options == null) return;
  await Firebase.initializeApp(name: name, options: options);
  if (useFirebasePlugins == false) return;
  await FlutterAppCheck.ensureInitialized();
  await FlutterCrashlytics.ensureInitialized();
  await FlutterRemoteConfig.ensureInitialized();
}
