import 'package:flutter_zitherharp/flutter_zitherharp.dart';

final class AppPage<C extends AppCubit<S>, S extends AppState>
    extends StatefulWidget {
  final FlutterInfo info;
  final FlutterRouter router;
  final List<Locale>? supportedLocales;
  final List<LocalizationsDelegate>? localizationsDelegates;

  const AppPage({
    super.key,
    required this.info,
    required this.router,
    this.supportedLocales,
    this.localizationsDelegates,
  });

  @override
  State<AppPage> createState() => _AppPageState<C, S>();
}

final class _AppPageState<C extends AppCubit<S>, S extends AppState>
    extends CubitState<C, S, AppPage> {
  late final info = widget.info;
  late final router = widget.router;

  /// The default map of keyboard shortcuts to intents for the application.
  static final Map<ShortcutActivator, Intent> _shortcuts = {
    ...WidgetsApp.defaultShortcuts,
    const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  };

  /// The default [ScrollBehavior] for the application.
  static final ScrollBehavior _scrollBehavior =
      const MaterialScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.stylus,
      PointerDeviceKind.unknown,
    },
  );

  @override
  Widget buildState() {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        package: info.package(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: info.color(),
          brightness: state.themeMode.getPlatformBrightness(),
        ),
      ),
      color: info.color(),
      themeMode: state.themeMode,
      routerConfig: router.config,
      onGenerateTitle: info.name,
      debugShowCheckedModeBanner: false,
      locale: state.displayLanguage,
      shortcuts: _shortcuts,
      scrollBehavior: _scrollBehavior,
      supportedLocales: widget.supportedLocales ?? Locales.values,
      localizationsDelegates: widget.localizationsDelegates,
    );
  }
}
