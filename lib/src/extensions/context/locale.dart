import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension LocaleExtensions on BuildContext {
  Locale get currentLocale => Localizations.localeOf(this);
}
