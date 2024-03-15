abstract base class FlutterConfig {
  /// You only need to call this method
  /// if you need the binding to be initialized before calling [runApp].
  ///
  /// If no binding has yet been initialized,
  /// the [WidgetsFlutterBinding] class is used to create and initialize one.
  void ensureInitialized();
}