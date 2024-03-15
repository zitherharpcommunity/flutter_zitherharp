part of '/src/extensions/context.dart';

extension $SizeExtension on BuildContext {
  /// The size of the media in logical pixels.
  Size get _size => MediaQuery.sizeOf(this);

  /// The horizontal extent of this size.
  double get width => _size.width;

  /// The vertical extent of this size.
  double get height => _size.height;

  /// The greater of the magnitudes of the [width] and the [height].
  double get longestSide => _size.longestSide;

  /// The lesser of the magnitudes of the [width] and the [height].
  double get shortestSide => _size.shortestSide;

  /// Returns orientation for the nearest MediaQuery ancestor
  /// or throws an exception, if no such ancestor exists.
  Orientation get _orientation => MediaQuery.orientationOf(this);

  /// Whether the device is in portrait mode.
  bool get isPortrait => _orientation == Orientation.portrait;

  /// Whether the device is in landscape mode.
  bool get isLandscape => _orientation == Orientation.landscape;

  /// The current brightness mode of the host platform.
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);
}
