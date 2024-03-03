import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:go_router/go_router.dart';

typedef BlocRouterBuilder<C extends BaseCubit> = C Function(
  BuildContext context,
  GoRouterState state,
);

abstract base class FlutterRouter {
  const FlutterRouter();

  /// A page builder for this route.
  ///
  /// - [path] and [name] cannot be empty strings.
  /// - [child] and [builder] must be provided.
  @protected
  @nonVirtual
  GoRoute configure<C extends BaseCubit>({
    required String name,
    String? path,
    required Widget child,
    BlocRouterBuilder<C>? builder,
  }) {
    return GoRoute(
      name: name,
      path: path ?? '/$name',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: builder == null
              ? child
              : BlocProvider(
                  create: (context) => builder.call(context, state),
                  child: child,
                ),
        );
      },
    );
  }
}

/// [GoRouter] extension to add navigation function to a [BuildContext] object.
extension $FlutterRouterExtension on BuildContext {
  /// Pop the top-most route off the current screen.
  ///
  /// If [useRootNavigator] is `true`,
  /// this method pops it instead of any [GoRoute] under it.
  void pop<T>({
    T? result,
    bool useRootNavigator = false,
  }) {
    if (useRootNavigator) {
      Navigator.pop(this, result);
    } else {
      GoRouter.of(this).pop(result);
    }
  }

  /// Navigate to a URI location with optional query parameters.
  void push<T>(
    GoRoute route, {
    T? extra,
    Map<String, dynamic>? params,
  }) {
    final uri = Uri(
      path: route.path,
      queryParameters: params,
    );
    return GoRouter.of(this).go('$uri', extra: extra);
  }

  /// The full uri of the route, e.g. `/family/f2/person/p1?filter=name#fragment`.
  String get path => '${GoRouterState.of(this).uri}';

  /// Whether this route is the most route on the navigator.
  void popAll() => Navigator.popUntil(this, (route) => route.isFirst);
}