import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The entry point for accessing a [FirebaseCrashlytics].
sealed class FlutterCrashlytics {
  /// An [FirebaseCrashlytics] instance using the default [FirebaseApp].
  static final _crashlytics = FirebaseCrashlytics.instance;

  /// The [PlatformDispatcher] singleton.
  static final _platformDispatcher = PlatformDispatcher.instance;

  /// Submits a Crashlytics report of a fatal error caught by the Flutter framework.
  static Future<void> ensureInitialized() async {
    FlutterError.onError = (errorDetails) {
      _crashlytics.recordFlutterFatalError(errorDetails);
    };
    _platformDispatcher.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
    await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
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
