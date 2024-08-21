import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class AppCubit<S extends AppState> extends BaseCubit<S> {
  AppCubit(super.context, super.initialState);

  void setThemeMode(ThemeMode? themeMode);

  void setDisplayLanguage(Locale? displayLanguage);
}
