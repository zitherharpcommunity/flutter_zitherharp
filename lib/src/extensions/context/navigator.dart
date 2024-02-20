import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension NavigatorExtensions on BuildContext {
  /// Pop the top-most route off the navigator.
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }
}