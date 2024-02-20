import 'dart:io';

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

enum ImageType {
  asset,
  file,
  memory,
  network,
}

/// A widget that displays an [Image].
final class ImageFactory extends StatelessWidget {
  final String path;
  final ImageType type;
  final ImageProvider image;

  const ImageFactory._(
    this.image, {
    required this.path,
    required this.type,
  });

  /// Creates an object that decodes an [ImageFactory] as an image.
  factory ImageFactory(String path) {
    if (path.startsWith('assets/')) {
      return ImageFactory.asset(path);
    }
    if (path.startsWith('file://')) {
      return ImageFactory.file(path);
    }
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return ImageFactory.network(path);
    }
    return ImageFactory.memory(path);
  }

  /// Creates an object that fetches an image from an asset bundle.
  ImageFactory.asset(String path)
      : this._(
          AssetImage(path),
          path: path,
          type: ImageType.asset,
        );

  /// Creates an object that decodes a [File] as an image.
  ImageFactory.file(String path)
      : this._(
          FileImage(File(path)),
          path: path,
          type: ImageType.file,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.memory(String path)
      : this._(
          MemoryImage(decode(path)),
          path: path,
          type: ImageType.file,
        );

  /// Creates an object that fetches the image at the given [path].
  ImageFactory.network(String path)
      : this._(
          NetworkImage(path),
          path: path,
          type: ImageType.file,
        );

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ImageType.file => Image.file(File(path)),
      ImageType.asset => Image.asset(path),
      ImageType.memory => Image.memory(decode(path)),
      ImageType.network => Image.network(path),
    };
  }

  static Uint8List decode(String data) => Uint8List.fromList(data.codeUnits);
}
