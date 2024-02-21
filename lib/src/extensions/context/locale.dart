part of '/src/extensions/context.dart';

extension $LocaleExtensions on BuildContext {
  /// The locale of the [Localizations] widget for the widget tree.
  /// 
  /// If no [Localizations] widget is in scope then the method will throw an exception.
  Locale get currentLocale => Localizations.localeOf(this);
}
