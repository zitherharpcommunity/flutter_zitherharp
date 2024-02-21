part of '/src/extensions/context.dart';

extension $NavigatorExtensions on BuildContext {
  /// Pop the top-most route off the navigator.
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }
  
  /// Pop the top-most route off the navigator.
  void back<T>([T? result]) {
    Navigator.pop(this, result);
  }
}
