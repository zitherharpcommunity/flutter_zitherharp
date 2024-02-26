import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [State] of all usecases in whole app.
@immutable
abstract base class BaseState {
  const BaseState();

  const BaseState.initial();

  @protected
  BaseState copyWith();
}
