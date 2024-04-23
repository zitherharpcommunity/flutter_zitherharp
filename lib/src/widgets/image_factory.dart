import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The type of an [ImageFactory].
enum ImageType {
  asset,
  file,
  memory,
  network,
}

typedef ImageBuilder = Widget Function(
  BuildContext context,
  ImageProvider provider,
);

typedef HolderBuilder = Widget Function(
  BuildContext context,
  Object value1,
  Object? value2,
);

bool _isFile(String path) => path.startsWith('file://');

bool _isAsset(String name) => name.startsWith('assets/');

bool _isNetwork(String url) =>
    url.startsWith('http://') || url.startsWith('https://');

/// Decodes the given [data] as a [Uint8List].
Uint8List _decode(String data) => Uint8List.fromList(data.codeUnits);

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

  /// Whether the image should be downloaded from the internet
  /// and keep them in the cache directory or not.
  final bool cache;

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

  final Widget Function(BuildContext context, ImageProvider provider)? builder;

  /// A builder that specifies the widget to display
  /// to the user while an image is still loading.
  final HolderBuilder? placeholder;

  /// A builder function that is called
  /// if an error occurs during image loading.
  final HolderBuilder? errorholder;

  const ImageFactory._(
    this.image, {
    required this.path,
    required this.type,
    this.fit,
    this.width,
    this.height,
    this.cache = true,
    this.builder,
    this.errorholder,
    this.placeholder,
  });

  /// Creates an object that decodes an [ImageFactory] as an image.
  factory ImageFactory(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
    bool cache = true,
    ImageBuilder? builder,
    HolderBuilder? placeholder,
    HolderBuilder? errorholder,
  }) {
    if (_isAsset(path)) {
      return ImageFactory.asset(
        path,
        width: width,
        height: height,
        errorholder: errorholder,
      );
    }
    if (_isFile(path)) {
      return ImageFactory.file(
        path,
        width: width,
        height: height,
        errorholder: errorholder,
      );
    }
    if (_isNetwork(path)) {
      return ImageFactory.network(
        path,
        width: width,
        height: height,
        cache: cache,
        errorholder: errorholder,
        placeholder: placeholder,
      );
    }
    return ImageFactory.memory(
      path,
      width: width,
      height: height,
      errorholder: errorholder,
    );
  }

  /// Creates an object that fetches an image from an asset bundle.
  ImageFactory.asset(
    String name, {
    BoxFit? fit,
    double? width,
    double? height,
    HolderBuilder? errorholder,
  }) : this._(
          AssetImage(name),
          path: name,
          type: ImageType.asset,
          width: width,
          height: height,
          errorholder: errorholder,
        );

  /// Creates an object that decodes a [File] as an image.
  ImageFactory.file(
    String path, {
    BoxFit? fit,
    double? width,
    double? height,
    HolderBuilder? errorholder,
  }) : this._(
          FileImage(File(path)),
          path: path,
          type: ImageType.file,
          width: width,
          height: height,
          errorholder: errorholder,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.memory(
    String data, {
    BoxFit? fit,
    double? width,
    double? height,
    HolderBuilder? errorholder,
  }) : this._(
          MemoryImage(_decode(data)),
          path: data,
          type: ImageType.memory,
          width: width,
          height: height,
          errorholder: errorholder,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.network(
    String url, {
    BoxFit? fit,
    double? width,
    double? height,
    bool cache = true,
    ImageBuilder? builder,
    HolderBuilder? placeholder,
    HolderBuilder? errorholder,
  }) : this._(
          cache
              ? CachedNetworkImageProvider(url)
              : NetworkImage(url) as ImageProvider,
          path: url,
          type: ImageType.network,
          cache: cache,
          width: width,
          height: height,
          builder: builder,
          errorholder: errorholder,
          placeholder: placeholder,
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
          errorBuilder: errorholder,
        );
      case ImageType.asset:
        return Image.asset(
          path,
          fit: fit,
          width: width,
          height: height,
          errorBuilder: errorholder,
        );
      case ImageType.network:
        if (cache) {
          return CachedNetworkImage(
            imageUrl: path,
            fit: fit,
            width: width,
            height: height,
            imageBuilder: builder,
            errorWidget: errorholder,
            progressIndicatorBuilder: placeholder,
          );
        }
        return Image.network(
          path,
          fit: fit,
          width: width,
          height: height,
          errorBuilder: errorholder,
          loadingBuilder: placeholder,
        );
      case ImageType.memory:
        return Image.memory(
          _decode(path),
          fit: fit,
          width: width,
          height: height,
          errorBuilder: errorholder,
        );
    }
  }
}

sealed class ImageFactoryProvider {
  static ImageProvider file(String path) => FileImage(File(path));

  static ImageProvider asset(String name) => AssetImage(name);

  static ImageProvider memory(String data) => MemoryImage(_decode(data));

  static ImageProvider network(String url, {bool cache = true}) => cache
      ? CachedNetworkImageProvider(url)
      : NetworkImage(url) as ImageProvider;
}
