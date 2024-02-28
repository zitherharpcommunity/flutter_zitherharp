import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A widget that insets its child by the given [margin].
final class Margin extends StatelessWidget {
  /// Creates a widget that insets its child.
  ///
  /// The [margin] argument must not be null.
  const Margin({
    super.key,
    this.child,
    required this.margin,
  });

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The amount of space by which to inset the child.
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: child,
    );
  }
}
