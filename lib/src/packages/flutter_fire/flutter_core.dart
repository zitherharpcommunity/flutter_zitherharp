import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// You only need to call this method
/// if you need the binding to be initialized before calling [runApp].
///
/// If no binding has yet been initialized,
/// the [WidgetsFlutterBinding] class is used to create and initialize one.
Future<void> ensureInitialized({
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
