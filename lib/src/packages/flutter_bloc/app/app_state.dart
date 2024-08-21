import 'package:flutter_zitherharp/flutter_zitherharp.dart';

abstract base class AppState extends BaseState {
  final ThemeMode themeMode;
  final Locale displayLanguage;

  const AppState({
    required this.themeMode,
    required this.displayLanguage,
  });

  @override
  AppState copyWith({
    ThemeMode? themeMode,
    Locale? displayLanguage,
  });

  @override
  List<Object?> get props => [themeMode, displayLanguage];
}