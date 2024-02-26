import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android),
/// providing a persistent store for simple data.
abstract base class FlutterPreferences {
  /// Data is persisted to disk asynchronously.
  @protected
  late final SharedPreferences prefs;

  /// The version code of the app.
  int get versionCode;

  /// The version name of the app.
  String get versionName;

  /// Loads and parses the [SharedPreferences] for this app from disk.
  Future<void> ensureInitialized() async {
    prefs = await SharedPreferences.getInstance();
  }
}

extension $SharedPreferencesExtension on SharedPreferences {
  /// Reads a value of any type from persistent storage,
  /// throwing an exception if it's not a string map.
  Map<String, String>? getStringMap(String key) {
    final value = getString(key);
    if (value == null) return null;
    return Map.from(jsonDecode(value));
  }

  /// Saves a string map [value] to persistent storage in the background.
  Future<bool> setStringMap(String key, Map<String, String> value) {
    return setString(key, jsonEncode(value));
  }
}
