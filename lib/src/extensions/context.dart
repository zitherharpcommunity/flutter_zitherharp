import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $BuildContextExtension on BuildContext {
  /// The locale of the [Localizations] widget for the widget tree.
  ///
  /// If no [Localizations] widget is in scope then the method will throw an exception.
  Locale get currentLocale =>
      Localizations.maybeLocaleOf(this) ?? Localizations.localeOf(this);

  /// The size of the media in logical pixels.
  Size get size => MediaQuery.sizeOf(this);

  /// The horizontal extent of this size.
  double get width => size.width;

  /// The vertical extent of this size.
  double get height => size.height;

  /// The aspect ratio of this media.
  double get aspectRatio => size.aspectRatio;

  /// The greater of the magnitudes of the [width] and the [height].
  double get longestSide => size.longestSide;

  /// The lesser of the magnitudes of the [width] and the [height].
  double get shortestSide => size.shortestSide;

  /// Returns orientation for the nearest MediaQuery ancestor
  /// or throws an exception, if no such ancestor exists.
  Orientation get _orientation => MediaQuery.orientationOf(this);

  /// Whether the device is in portrait mode.
  bool get isPortrait => _orientation == Orientation.portrait;

  /// Whether the device is in landscape mode.
  bool get isLandscape => _orientation == Orientation.landscape;

  /// Whether the keyboard is visible.
  bool get isKeyboardVisible => mediaQuery.viewInsets.bottom != 0;

  /// Whether the keyboard is invisible.
  bool get isKeyboardInvisible => mediaQuery.viewInsets.bottom == 0;

  /// The current brightness mode of the host platform.
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  /// The data from the closest [Theme] instance.
  ThemeData get theme => Theme.of(this);

  /// The data from the closest instance of this [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// The overall theme brightness.
  Brightness get brightness => theme.brightness;

  /// Text with a color that contrasts with the card and canvas colors.
  TextTheme get textTheme => theme.textTheme;

  /// A set of 30 colors can be used to configure the color properties of most components.
  ColorScheme get colorScheme => theme.colorScheme;

  /// The state from the closest context of [Scaffold].
  ScaffoldState get _scaffoldState => Scaffold.of(this);

  /// The state from the closest context of [ScaffoldMessenger].
  ScaffoldMessengerState get _scaffoldMessengerState =>
      ScaffoldMessenger.of(this);

  /// Insert the given [entry] into the overlay.
  void showOverlay(OverlayEntry entry, {bool rootOverlay = false}) =>
      Overlay.of(this, rootOverlay: rootOverlay).insert(entry);

  /// Opens the [Drawer] (if any).
  void openDrawer() => _scaffoldState.openDrawer();

  /// Opens the end side [Drawer] (if any).
  void openEndDrawer() => _scaffoldState.openEndDrawer();

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
    return _scaffoldMessengerState
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
    return _scaffoldMessengerState
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          content: Text(message),
          actions: actions,
        ),
      );
  }

  Widget buildEmptyText({
    required String title,
    String? subtitle,
    Widget? action,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: textTheme.titleMedium,
          ),
          if (subtitle != null)
            Margin(
              margin: edgeInsetsVertical8,
              child: Text(
                subtitle,
                style: textTheme.bodyMedium,
              ),
            ),
          if (action != null) action,
        ],
      ),
    );
  }

  Future<T?> showLoadingDialog<T>({
    required String title,
    bool dismissible = true,
    Future<T> Function()? function,
  }) async {
    showSimpleDialog<T>(
      title: title,
      builder: (context) {
        return [
          const Margin(
            margin: edgeInsets8,
            child: centeredLoadingIndicator,
          ),
        ];
      },
      dismissible: dismissible,
    );
    return function?.call().whenComplete(pop);
  }

  Future<T?> showSimpleDialog<T>({
    required String title,
    bool dismissible = true,
    required List<Widget> Function(BuildContext context) builder,
  }) {
    return showDialog<T>(
      context: this,
      builder: (context) {
        return SimpleDialog(
          title: Text(title),
          children: builder.call(context),
        );
      },
      barrierDismissible: dismissible,
    );
  }

  Future<T?> showRadioDialog<T>({
    required T initial,
    required String title,
    required List<T> items,
    void Function(T? value)? onChanged,
    String Function(T value)? itemBuilder,
    Widget? Function(T value)? iconBuilder,
  }) {
    return showSimpleDialog<T>(
      title: title,
      builder: (context) {
        return List.from(
          items.map((item) {
            return RadioListTile.adaptive(
              value: item,
              groupValue: initial,
              onChanged: (value) {
                pop();
                onChanged?.call(value);
              },
              title: Text(
                itemBuilder?.call(item) ?? item.toString(),
              ),
              secondary: iconBuilder?.call(item),
            );
          }),
        );
      },
    );
  }

  Future<T?> showAlertDialog<T>({
    required String title,
    required String subtitle,
    required String cancelLabel,
    required String confirmLabel,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) {
    return showDialog<T>(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: onCancel,
              child: Text(cancelLabel),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(confirmLabel),
            ),
          ],
          buttonPadding: EdgeInsets.zero,
          actionsPadding: const EdgeInsets.all(dimension8),
        );
      },
    );
  }
}
