import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The entry point for accessing Remote Config.
sealed class FlutterRemoteConfig {
  static final _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> ensureInitialized() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
  }

  /// Fetches and caches configuration from the [FlutterRemoteConfig] service.
  static Future<void> fetch() => _remoteConfig.fetch();

  /// Performs a fetch and activate operation, as a convenience.
  static Future<bool> fetchAndActivate() => _remoteConfig.fetchAndActivate();

  /// Starts listening for real-time config updates from the Remote Config backend
  /// and automatically fetches updates from the RC backend when they are available.
  static Stream<RemoteConfigUpdate> get onConfigUpdated =>
      _remoteConfig.onConfigUpdated;

  /// Sets the default parameter values for the current instance.
  static Future<void> setConfigDefault(Map<String, dynamic> defaults) =>
      _remoteConfig.setDefaults(defaults);

  /// Returns a Map of all [RemoteConfigValue] parameters.
  static Map<String, RemoteConfigValue> getAll() => _remoteConfig.getAll();

  /// Gets the value for a given key as an int.
  static int getInt(String key) => _remoteConfig.getInt(key);

  /// Gets the [RemoteConfigValue] for a given key.
  static dynamic getValue(String key) =>
      jsonDecode(_remoteConfig.getValue(key).asString());
}
