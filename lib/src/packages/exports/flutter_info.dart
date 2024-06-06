import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class FlutterInfo {
  String id();

  Widget icon(BuildContext context);

  String? name(BuildContext context);

  String? legalese(BuildContext context);

  Color? color();

  String? font();

  String version();

  ImageProvider image();

  ImageProvider background();
}
