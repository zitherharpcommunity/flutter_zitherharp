import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class FlutterInfo {
  String alias() => throw UnimplementedError();

  String id() => throw UnimplementedError();

  Widget icon(BuildContext context) => throw UnimplementedError();

  String? name(BuildContext context) => throw UnimplementedError();

  String? legalese(BuildContext context) => throw UnimplementedError();

  Color? color() => throw UnimplementedError();

  String? font() => throw UnimplementedError();

  String version() => throw UnimplementedError();

  ImageProvider image() => throw UnimplementedError();

  ImageProvider background() => throw UnimplementedError();
}
