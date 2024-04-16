extension $EnumsExtension<T extends Enum> on Iterable<T> {
  /// Finds the enum value in this list with [name].
  ///
  /// Goes through this collection looking for an enum with [name].
  ///
  /// Returns the first value with the given [name].
  ///
  /// Returns `null` if the value is not found.
  T? byNameOrNull(String? name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }

  /// Finds the enum value in this list with [index].
  ///
  /// Goes through this collection looking for an enum with [index].
  ///
  /// Returns the first value with the given [index].
  ///
  /// Returns `null` if the value is not found.
  T? byIndexOrNull(int? index) {
    for (final value in this) {
      if (value.index == index) {
        return value;
      }
    }
    return null;
  }
}
