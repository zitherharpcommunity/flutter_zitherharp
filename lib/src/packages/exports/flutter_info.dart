import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class FlutterInfo {
  String alias() => throw UnimplementedError();

  ImageProvider background() => throw UnimplementedError();
  
  /// The version code of the app.
  int code() => throw UnimplementedError();

  Color? color() => throw UnimplementedError();

  String? font() => throw UnimplementedError();

  Widget icon(BuildContext context) => throw UnimplementedError();

  String id() => throw UnimplementedError();

  String title() => throw UnimplementedError();

  ImageProvider image() => throw UnimplementedError();

  String? legalese(BuildContext context) => throw UnimplementedError();

  /// If non-null this callback function is called to produce the app's title string.
  String? name(BuildContext context) => throw UnimplementedError();

  /// The version name of the app.
  String version() => throw UnimplementedError();
}
