import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [Cubit] of all usecases in whole app.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S>{
  BaseCubit(super.initialState);

  @override
  void onChange(Change<S> change) {
    super.onChange(change);
    FlutterLogger.cyan.print(
      '$change',
      name: '$runtimeType',
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    FlutterLogger.red.print(
      'Error { $error }',
      name: '$runtimeType',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() async {
    super.close();
    FlutterLogger.magenta.print(
      'Closed',
      name: '$runtimeType',
    );
  }
}
