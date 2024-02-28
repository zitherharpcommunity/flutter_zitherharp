import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A constant that is `true` if the application was compiled to run on the mobile.
final bool kIsMobile = defaultTargetPlatform == TargetPlatform.android ||
    defaultTargetPlatform == TargetPlatform.iOS;

/// A constant that is `true` if the application was compiled to run on the desktop.
final bool kIsDesktop = defaultTargetPlatform == TargetPlatform.linux ||
    defaultTargetPlatform == TargetPlatform.windows;

/// The setting indicating the current brightness mode of the host platform.
///
/// If the platform has no preference, [platformBrightness] defaults to [Brightness.light].
Brightness get platformBrightness =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
