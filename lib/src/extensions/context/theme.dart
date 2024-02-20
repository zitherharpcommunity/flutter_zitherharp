import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);

  Brightness get brightness => _theme.brightness;

  TextTheme get textTheme => _theme.textTheme;

  ColorScheme get colorScheme => _theme.colorScheme;
}