part of '/src/extensions/context.dart';

extension $NavigatorExtension on BuildContext {
  /// Pop the top-most route off the navigator.
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }

  /// Pop the top-most route off the current screen.
  void back<T>([T? result]) {
    GoRouter.of(this).pop(result);
  }

  /// Navigate to a URI location with optional query parameters.
  void push<T>(
    String path, {
    T? extra,
    Map<String, dynamic>? params,
  }) {
    final uri = Uri(
      path: path,
      queryParameters: params,
    );
    GoRouter.of(this).go(
      '$uri',
      extra: extra,
    );
  }

  /// The full uri of the route, e.g. /family/f2/person/p1?filter=name#fragment
  String get path => '${GoRouterState.of(this).uri}';

  /// Whether this route is the most route on the navigator.
  void popAll() => Navigator.popUntil(this, (route) => route.isFirst);
}
