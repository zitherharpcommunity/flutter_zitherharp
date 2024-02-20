import 'package:flutter_zitherharp/flutter_zitherharp.dart';

final kIsMobile = defaultTargetPlatform == TargetPlatform.android ||
    defaultTargetPlatform == TargetPlatform.iOS;

final kIsDesktop = defaultTargetPlatform == TargetPlatform.linux ||
    defaultTargetPlatform == TargetPlatform.windows;

Brightness get platformBrightness =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
