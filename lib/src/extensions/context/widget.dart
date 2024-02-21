part of '/src/extensions/context.dart';

extension $WidgetExtensions on BuildContext {
  ScaffoldMessengerState get _scaffoldState => ScaffoldMessenger.of(this);

  /// Insert the given [entry] into the overlay.
  void showOverlay(OverlayEntry entry, {bool rootOverlay = false}) {
    return Overlay.of(this, rootOverlay: rootOverlay).insert(entry);
  }

  /// Opens the [Drawer] (if any).
  void openDrawer() {
    Scaffold.of(this).openDrawer();
  }

  /// Opens the end side [Drawer] (if any).
  void openEndDrawer() {
    Scaffold.of(this).openEndDrawer();
  }

  /// Shows a [SnackBar] with a [message] across all registered [Scaffold]s.
  ScaffoldMessengerState showSnackBar(
    String message, {
    SnackBarAction? action,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    return _scaffoldState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          action: action,
          behavior: behavior,
          showCloseIcon: true,
          width: isPortrait ? null : width / 3,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  ScaffoldMessengerState showMaterialBanner(
    String message, {
    List<Widget> actions = const [],
  }) {
    return _scaffoldState
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(message),
          actions: actions,
        ),
      );
  }
}
