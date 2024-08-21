import 'package:flutter_zitherharp/flutter_zitherharp.dart';

export 'app_cubit.dart';
export 'app_page.dart';
export 'app_state.dart';

/// Inflate the [FlutterApp] and attach it to the screen.
void runFlutterApp<C extends AppCubit<S>, S extends AppState>({
  FlutterPreferences? prefs,
  required FlutterInfo info,
  required FlutterRouter router,
  FirebaseOptions? options,
  Map<String, dynamic>? parameters,
  List<BlocRouterProvider> providers = const [],
}) async {
  await ensureInitialized(
    prefs: prefs,
    options: options,
    parameters: parameters,
    useFirebasePlugins: kReleaseMode,
  );
  runApp(
    MultiBlocProvider(
      providers: providers,
      child: AppPage<C, S>(info: info, router: router),
    ),
  );
}
