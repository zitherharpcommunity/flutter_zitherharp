import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $ThemeModeExtension on ThemeMode {
  /// Returns the current [Brightness] mode of the host platform.
  Brightness getPlatformBrightness() {
    return switch (this) {
      ThemeMode.system => platformBrightness,
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark
    };
  }
}
