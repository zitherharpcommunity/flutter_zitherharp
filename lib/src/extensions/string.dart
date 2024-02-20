extension $NullableStringExtensions on String? {
  bool get isNullOrEmpty {
    final value = this;
    if (value == null) return true;
    if (value.isEmpty) return true;
    return false;
  }
}

extension $NonNullStringExtensions on String {
  String get capitalized => substring(0, 1).toUpperCase() + substring(1);
}