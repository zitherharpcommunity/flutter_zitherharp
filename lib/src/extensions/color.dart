import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $ColorExtension on Color {
  /// Converts this [Color] to a [MaterialColor].
  MaterialColor toMaterialColor() {
    final strengths = [.05];
    final swatch = <int, Color>{};
    final r = red, g = green, b = blue;
    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(value, swatch);
  }
}
