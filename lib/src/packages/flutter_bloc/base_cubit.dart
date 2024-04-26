import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [Cubit] of all usecases in whole app.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  /// The repository that is used to handle the state changes.
  BaseRepository get repository => throw UnimplementedError();
}
