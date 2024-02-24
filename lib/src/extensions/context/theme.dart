part of '/src/extensions/context.dart';

extension $ThemeExtension on BuildContext {
  /// The data from the closest [Theme] instance.
  ThemeData get _theme => Theme.of(this);

  /// The overall theme brightness.
  Brightness get brightness => _theme.brightness;

  /// Text with a color that contrasts with the card and canvas colors.
  TextTheme get textTheme => _theme.textTheme;

  /// A set of 30 colors can be used to configure the color properties of most components.
  ColorScheme get colorScheme => _theme.colorScheme;
}
