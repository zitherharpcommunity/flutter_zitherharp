import 'package:firebase_analytics/firebase_analytics.dart';

/// The entry point for accessing [FirebaseAnalytics].
sealed class FlutterAnalytics {
  static final _analytics = FirebaseAnalytics.instance;

  /// Logs a custom [FirebaseAnalytics] event
  /// with the given [name] and event [parameters].
  static Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) {
    return _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
