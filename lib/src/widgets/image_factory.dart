import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The type of an [ImageFactory].
enum ImageType {
  asset,
  file,
  memory,
  network,
}

/// A widget that displays an [Image].
final class ImageFactory extends StatelessWidget {
  /// The data of an [ImageFactory].
  final String path;

  /// The type of an [ImageFactory].
  final ImageType type;

  /// Identifies an image without committing to the precise final asset.
  ///
  /// This allows a set of images to be identified and for the precise image
  /// to later be resolved based on the environment, e.g. the device pixel ratio.
  final ImageProvider image;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at
  /// [paintImage].
  final BoxFit? fit;

  /// If non-null, require the image to have this width.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height]
  /// be specified, or that the widget be placed in a context that sets tight
  /// layout constraints, so that the image does not change size as it loads.
  /// Consider using [fit] to adapt the image's rendering to fit the given width
  /// and height if the exact image dimensions are not known in advance.
  final double? width;

  /// If non-null, require the image to have this height.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height]
  /// be specified, or that the widget be placed in a context that sets tight
  /// layout constraints, so that the image does not change size as it loads.
  /// Consider using [fit] to adapt the image's rendering to fit the given width
  /// and height if the exact image dimensions are not known in advance.
  final double? height;

  const ImageFactory._(
    this.image, {
    required this.path,
    required this.type,
    this.fit,
    this.width,
    this.height,
  });

  /// Creates an object that decodes an [ImageFactory] as an image.
  factory ImageFactory(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
  }) {
    if (path.startsWith('assets/')) {
      return ImageFactory.asset(
        path,
        width: width,
        height: height,
      );
    }
    if (path.startsWith('file://')) {
      return ImageFactory.file(
        path,
        width: width,
        height: height,
      );
    }
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return ImageFactory.network(
        path,
        width: width,
        height: height,
      );
    }
    return ImageFactory.memory(
      path,
      width: width,
      height: height,
    );
  }

  /// Creates an object that fetches an image from an asset bundle.
  ImageFactory.asset(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
  }) : this._(
          AssetImage(path),
          path: path,
          type: ImageType.asset,
          width: width,
          height: height,
        );

  /// Creates an object that decodes a [File] as an image.
  ImageFactory.file(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
  }) : this._(
          FileImage(File(path)),
          path: path,
          type: ImageType.file,
          width: width,
          height: height,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.memory(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
  }) : this._(
          MemoryImage(decode(path)),
          path: path,
          type: ImageType.file,
          width: width,
          height: height,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.network(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
  }) : this._(
          NetworkImage(path),
          path: path,
          type: ImageType.file,
          width: width,
          height: height,
        );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.file:
        return Image.file(
          File(path),
          fit: fit,
          width: width,
          height: height,
        );
      case ImageType.asset:
        return Image.asset(
          path,
          fit: fit,
          width: width,
          height: height,
        );
      case ImageType.network:
        return Image.network(
          path,
          fit: fit,
          width: width,
          height: height,
        );
      case ImageType.memory:
        return Image.memory(
          decode(path),
          fit: fit,
          width: width,
          height: height,
        );
    }
  }

  /// Decodes the given [data] as a [Uint8List].
  static Uint8List decode(String data) => Uint8List.fromList(data.codeUnits);
}
