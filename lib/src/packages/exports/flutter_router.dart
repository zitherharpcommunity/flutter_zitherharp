import 'package:flutter_zitherharp/flutter_zitherharp.dart';
import 'package:go_router/go_router.dart';

abstract base class FlutterRouter {
  const FlutterRouter();

  /// Default constructor to configure a [BlocRouter]
  /// with a routes builder and an error page builder.
  BlocRouter get config;

  /// An object to configure the underlying [BlocRouter].
  List<BlocRoute> get routes;

  /// A page builder for this route.
  @protected
  @nonVirtual
  BlocRoute configure({
    String? path,
    required String name,
    required BlocRouterBuilder builder,
  }) {
    return BlocRoute(
      name: name,
      path: path ?? '/$name',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          name: name,
          key: state.pageKey,
          child: builder.call(context, state),
        );
      },
    );
  }
}

/// A route that is displayed visually above
/// the matching parent route using the [Navigator].
typedef BlocRoute = GoRoute;

/// The route configuration for the app.
typedef BlocRouter = GoRouter;

/// The function to build route configuration for the app.
typedef BlocRouterBuilder = GoRouterWidgetBuilder;

/// {@macro bloc_provider}
typedef BlocRouterProvider<C extends BaseCubit> = BlocProvider<C>;

/// [GoRouter] extension to add navigation function to a [BuildContext] object.
extension $FlutterRouterExtension on BuildContext {
  /// Pop the top-most route off the current screen.
  ///
  /// If [useRootNavigator] is `true`,
  /// this method pops a pop up or dialog,
  /// instead of any [GoRoute] under it.
  void pop<T>({
    T? result,
    bool useRootNavigator = false,
  }) {
    if (!useRootNavigator) {
      Navigator.pop(this, result);
    } else {
      BlocRouter.of(this).pop(result);
    }
  }

  /// Navigate to a URI location with optional query parameters.
  void push<T>(
    BlocRoute route, {
    T? extra,
    Map<String, dynamic>? params,
  }) {
    final uri = Uri(
      path: route.path,
      queryParameters: params,
    );
    final router = BlocRouter.of(this);
    if (kIsWeb) {
      router.go('$uri', extra: extra);
    } else {
      router.push('$uri', extra: extra);
    }
  }

  /// The full uri of the route, e.g. `/family/f2/person/p1?filter=name#fragment`.
  String get path => '${GoRouterState.of(this).uri}';

  /// An extra object to pass along with the navigation.
  Object? get extra => GoRouterState.of(this).extra;

  /// Whether this route is the most route on the navigator.
  void popAll() => Navigator.popUntil(this, (route) => route.isFirst);
}
