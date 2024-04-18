import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $BuildContextExtension on BuildContext {
  /// The locale of the [Localizations] widget for the widget tree.
  ///
  /// If no [Localizations] widget is in scope then the method will throw an exception.
  Locale get currentLocale => Localizations.localeOf(this);

  /// The size of the media in logical pixels.
  Size get _size => MediaQuery.sizeOf(this);

  /// The horizontal extent of this size.
  double get width => _size.width;

  /// The vertical extent of this size.
  double get height => _size.height;

  /// The aspect ratio of this media.
  double get aspectRatio => _size.aspectRatio;

  /// The greater of the magnitudes of the [width] and the [height].
  double get longestSide => _size.longestSide;

  /// The lesser of the magnitudes of the [width] and the [height].
  double get shortestSide => _size.shortestSide;

  /// Returns orientation for the nearest MediaQuery ancestor
  /// or throws an exception, if no such ancestor exists.
  Orientation get _orientation => MediaQuery.orientationOf(this);

  /// Whether the device is in portrait mode.
  bool get isPortrait => _orientation == Orientation.portrait;

  /// Whether the device is in landscape mode.
  bool get isLandscape => _orientation == Orientation.landscape;

  /// The current brightness mode of the host platform.
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  /// The data from the closest [Theme] instance.
  ThemeData get _theme => Theme.of(this);

  /// The overall theme brightness.
  Brightness get brightness => _theme.brightness;

  /// Text with a color that contrasts with the card and canvas colors.
  TextTheme get textTheme => _theme.textTheme;

  /// A set of 30 colors can be used to configure the color properties of most components.
  ColorScheme get colorScheme => _theme.colorScheme;

  /// The state from the closest instance of this class.
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

  /// Checks the connnection to the [url] of an host.
  Future<bool> checkConnectivity({String url = 'google.com'}) async {
    try {
      final result = await InternetAddress.lookup(url);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (e) {
      showSnackBar(e.message);
    }
    return false;
  }

  /// Shows a [SnackBar] with a [message] across all registered [Scaffold]s.
  ScaffoldMessengerState showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    return _scaffoldState
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          action: action,
          duration: duration,
          behavior: behavior,
          showCloseIcon: true,
          width: isPortrait ? null : width / 3,
        ),
      );
  }

  /// Shows a [MaterialBanner] across all registered [Scaffold]s.
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
