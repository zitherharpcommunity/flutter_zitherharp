import 'package:flutter_zitherharp/flutter_zitherharp.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: invisibleColor,
      home: ImageFactory.network('path/to/image'),
    );
  }
}
