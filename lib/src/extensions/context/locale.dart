part of '/src/extensions/context.dart';

extension $LocaleExtensions on BuildContext {
  Locale get currentLocale => Localizations.localeOf(this);
}
