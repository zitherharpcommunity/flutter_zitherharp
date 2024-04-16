import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [Cubit] of all usecases in whole app.
abstract base class BaseCubit<S extends BaseState> extends Cubit<S> { 
  @protected
  final BuildContext context;

  BaseCubit(this.context, super.initialState);
}
