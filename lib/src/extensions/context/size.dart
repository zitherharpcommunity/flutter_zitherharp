part of '/src/extensions/context.dart';

extension $SizeExtension on BuildContext {
  /// The data from the closest instance of this class that encloses the given context.
  MediaQueryData get _data => MediaQuery.of(this);

  /// The size of the media in logical pixels.
  Size get _size => _data.size;

  /// The horizontal extent of this size.
  double get width => _size.width;

  /// The vertical extent of this size.
  double get height => _size.height;

  /// The greater of the magnitudes of the [width] and the [height].
  double get longestSide => _size.longestSide;

  /// The lesser of the magnitudes of the [width] and the [height].
  double get shortestSide => _size.shortestSide;

  /// The current brightness mode of the host platform.
  Brightness get platformBrightness => _data.platformBrightness;

  /// Whether the device is in portrait mode.
  bool get isPortrait => _data.orientation == Orientation.portrait;

  /// Whether the device is in landscape mode.
  bool get isLandscape => _data.orientation == Orientation.landscape;
}
