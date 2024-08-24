import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $ThemeModeExtension on ThemeMode {
  /// Returns the current [Brightness] mode of the host platform.
  Brightness get brightness {
    return switch (this) {
      ThemeMode.system => defaultBrightness,
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark
    };
  }
}
