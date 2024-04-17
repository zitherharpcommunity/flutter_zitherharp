import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [Cubit] of all usecases in whole app.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S> {
  @protected
  final BuildContext context;

  BaseCubit(this.context, super.initialState);

  @override
  void onChange(Change<S> change) {
    super.onChange(change);
    developer.log(
      'onChange: ${change.currentState} -> ${change.nextState}',
      name: '$runtimeType',
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    developer.log(
      'onError: $stackTrace',
      name: '$runtimeType',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
