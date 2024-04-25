import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

final class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    FlutterLogger.green.print(
      'Create',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    FlutterLogger.cyan.print(
      '$change',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    FlutterLogger.red.print(
      'Error { $error }',
      name: '${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    FlutterLogger.magenta.print(
      'Close',
      name: '${bloc.runtimeType}',
    );
    super.onClose(bloc);
  }
}
