import 'dart:developer';

/// A logger with a unique level to easily identify the source of the log messages.
enum FlutterLogger {
  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37);

  final int level;

  const FlutterLogger(this.level);

  /// Prints a string representation of the object 
  /// to the console, only in debug mode
  /// (this has no effect in release mode).
  void print(
    String message, {
    DateTime? time,
    String? name,
    Object? error,
    int? sequenceNumber,
    StackTrace? stackTrace,
  }) {
    assert(() {
      log(
        '\x1B[${level}m$message\x1B[0m',
        name: name ?? '$runtimeType',
        time: time,
        error: error,
        level: level,
        stackTrace: stackTrace,
        sequenceNumber: sequenceNumber,
      );
      return true;
    }());
  }
}
