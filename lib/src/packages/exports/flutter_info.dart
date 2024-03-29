import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class FlutterInfo {
  String name(BuildContext context);

  Widget icon(BuildContext context);

  String legalese(BuildContext context);

  Color color();

  String font();

  String version();

  ImageProvider image();

  ImageProvider background();
}
