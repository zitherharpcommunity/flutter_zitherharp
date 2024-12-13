import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $ColorExtension on Color {
  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  int get _value =>
      _floatToInt8(a) << 24 |
      _floatToInt8(r) << 16 |
      _floatToInt8(g) << 8 |
      _floatToInt8(b) << 0;

  bool get isDark => computeLuminance() < .5;

  bool get isLight => computeLuminance() >= .5;

  /// A string code representing this color.
  String get code => _value.toRadixString(16).padLeft(8, '0');

  /// Converts this [Color] to a [MaterialColor].
  MaterialColor toMaterialColor() {
    final strengths = [.05];
    final swatch = <int, Color>{};
    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        (r + (ds < 0 ? r : (255 - r)) * ds).round(),
        (g + (ds < 0 ? g : (255 - g)) * ds).round(),
        (b + (ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(_value, swatch);
  }
}
