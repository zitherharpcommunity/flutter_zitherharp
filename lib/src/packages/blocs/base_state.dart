import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [State] of all usecases in whole app.
abstract base class BaseState {
  const BaseState();

  const BaseState.initial();

  @protected
  BaseState copyWith();
}
