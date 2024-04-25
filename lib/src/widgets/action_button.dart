import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// An [IconButton] to display in a row after the title of [AppBar].
final class ActionButton extends StatelessWidget {
  /// Creates an [IconButton] to display
  /// in a row after the title of [AppBar].
  const ActionButton({
    super.key,
    this.icon,
    this.tooltip,
    this.visible = true,
    this.onPressed,
  });

  /// Switches between showing the button or hiding it.
  final bool visible;

  /// The icon to display inside the button.
  final IconData? icon;

  /// Text that describes the action that will occur when the button is pressed.
  final String? tooltip;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: IconButton(
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          vertical: dimension4,
          horizontal: dimension4,
        ),
        icon: Icon(icon),
        tooltip: tooltip,
        onPressed: onPressed,
      ),
    );
  }
}
