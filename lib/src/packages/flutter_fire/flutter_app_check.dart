import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The entry point for accessing [FirebaseAppCheck].
sealed class FlutterAppCheck {
  static final _appCheck = FirebaseAppCheck.instance;

  static const _appleProvider =
      kDebugMode ? AppleProvider.debug : AppleProvider.deviceCheck;

  static const _androidProvider =
      kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity;

  /// Activates the [FirebaseAppCheck] service.
  static Future<void> ensureInitialized() async {
    return _appCheck.activate(
      appleProvider: _appleProvider,
      androidProvider: _androidProvider,
    );
  }
}
