extension StringExtensions on String {
  String get capitalized => substring(0, 1).toUpperCase() + substring(1);
}