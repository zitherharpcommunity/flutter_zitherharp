import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A class for observing the behavior of [Cubit] instances.
final class CubitObserver implements BlocObserver {
  const CubitObserver();

  @override
  void onCreate(BlocBase bloc) {
    FlutterLogger.green.print(
      'Create',
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
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
  }

  @override
  void onClose(BlocBase bloc) {
    FlutterLogger.magenta.print(
      'Close',
      name: '${bloc.runtimeType}',
    );
  }
  
  @override
  void onEvent(Bloc bloc, Object? event) {
    FlutterLogger.yellow.print(
      'Event { $event }',
      name: '${bloc.runtimeType}',
    );
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    FlutterLogger.blue.print(
      'Transition { $transition }',
      name: '${bloc.runtimeType}',
    );
  }
}
