extension $ObjectExtension<T extends Object> on T {
  /// Marks this object as hardcoded and it will be replaced in the near future.
  T get hardcoded => this;

  /// Returns a string of [hashCode] in the hexadecimal format.
  String get hashString => hashCode.toRadixString(36);

  T? currentOrNull(bool condition) => condition ? this : null;
}

String nameOf<T>(T value) => '$value';

Type typeOf<T>(T value) => value.runtimeType;
