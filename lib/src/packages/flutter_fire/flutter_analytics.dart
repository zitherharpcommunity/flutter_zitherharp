import 'package:firebase_analytics/firebase_analytics.dart';

sealed class FlutterAnalytics {
  static final _analytics = FirebaseAnalytics.instance;

  static Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    return _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
