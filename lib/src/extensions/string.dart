extension $NullableStringExtension on String? {
  /// Returns `true` if the string is null or empty.
  ///
  /// Returns `false` if the string is not null and not empty.
  bool get isNullOrEmpty {
    final value = this;
    if (value == null) return true;
    if (value.isEmpty) return true;
    return false;
  }
}

extension $NonNullStringExtension on String {
  /// Whether this string is blank.
  bool get isBlank => trim().isEmpty;

  /// Whether this string is not blank.
  bool get isNotBlank => trim().isNotEmpty;

  /// Returns the string with the first letter capitalized.
  String get capitalized =>
      length < 2 ? this : substring(0, 1).toUpperCase() + substring(1);
}
