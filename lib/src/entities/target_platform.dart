import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The [PlatformDispatcher] to which this binding is bound.
PlatformDispatcher get _platformDispatcher =>
    WidgetsBinding.instance.platformDispatcher;

/// A constant that is `true` if the application was compiled to run on the mobile.
final bool kIsMobile = Platform.isAndroid || Platform.isIOS;

/// A constant that is `true` if the application was compiled to run on the desktop.
final bool kIsDesktop = Platform.isLinux || Platform.isWindows;

/// The system-reported default locale of the device.
Locale get defaultLocale => _platformDispatcher.locale;

/// The setting indicating the current brightness mode of the host platform.
///
/// If the platform has no preference, [defaultBrightness] defaults to [Brightness.light].
Brightness get defaultBrightness => _platformDispatcher.platformBrightness;

/// The default map of keyboard shortcuts to intents for the application.
final Map<ShortcutActivator, Intent> defaultShortcuts = {
  ...WidgetsApp.defaultShortcuts,
  const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
};

/// The default [ScrollBehavior] for the application.
final ScrollBehavior defaultScrollBehavior =
    const MaterialScrollBehavior().copyWith(
  dragDevices: {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  },
);
