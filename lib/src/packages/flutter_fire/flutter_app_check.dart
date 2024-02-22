import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

sealed class FlutterAppCheck {
  static final _appCheck = FirebaseAppCheck.instance;

  static Future<void> ensureInitialized() async {
    return _appCheck.activate(
      appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttest,
      androidProvider:
          kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    );
  }
}
