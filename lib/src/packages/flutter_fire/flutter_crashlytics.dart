import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

sealed class FlutterCrashlytics {
  static final _crashlytics = FirebaseCrashlytics.instance;
  static final _platformDispatcher = PlatformDispatcher.instance;

  static Future<void> ensureInitialized() async {
    FlutterError.onError = (errorDetails) {
      _crashlytics.recordFlutterFatalError(errorDetails);
    };
    _platformDispatcher.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// Submits a [Error] report of a caught error.
  static Future<void> recordError(
    dynamic error,
    dynamic reason, {
    List<Object> informations = const [],
  }) {
    return _crashlytics.recordError(
      error,
      null,
      fatal: true,
      reason: reason,
      information: informations,
    );
  }
}