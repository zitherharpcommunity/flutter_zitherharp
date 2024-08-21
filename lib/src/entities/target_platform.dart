import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A constant that is `true` if the application was compiled to run on the mobile.
final bool kIsMobile = Platform.isAndroid || Platform.isIOS;

/// A constant that is `true` if the application was compiled to run on the desktop.
final bool kIsDesktop = Platform.isLinux || Platform.isWindows;

/// The setting indicating the current brightness mode of the host platform.
///
/// If the platform has no preference, [platformBrightness] defaults to [Brightness.light].
Brightness get platformBrightness =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

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
