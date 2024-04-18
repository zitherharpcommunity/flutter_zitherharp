
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A base [State] of all usecases in whole app.
@immutable
abstract base class BaseState extends Equatable with Diagnosticable {
  const BaseState({
    this.connectionState = ConnectionState.none,
  });

  /// The state of connection to an asynchronous computation.
  final ConnectionState connectionState;

  /// Not currently connected to any asynchronous computation.
  bool get isNone => connectionState == ConnectionState.none;

  /// Connected to an asynchronous computation and awaiting interaction.
  bool get isWaiting => connectionState == ConnectionState.waiting;

  /// Connected to a terminated asynchronous computation.
  bool get isDone => connectionState == ConnectionState.done;

  /// Connected to an active asynchronous computation.
  bool get isActive => connectionState == ConnectionState.active;

  @protected
  BaseState copyWith() => this;
}
