import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [Cubit] of all usecases in whole app.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);
}

/// A [Cubit] without context dependency injection.
abstract base class ContextlessCubit<S extends BaseState> extends BaseCubit<S> {
  ContextlessCubit(super.initialState);
}

/// A [Cubit] with context dependency injection.
abstract base class ContextfulCubit<S extends BaseState> extends BaseCubit<S> {
  @protected
  final BuildContext context;

  ContextfulCubit(this.context, super.initialState);
}
