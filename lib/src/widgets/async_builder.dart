import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A widget that builds itself
/// based on the latest snapshot of interaction
/// with a [Future] or a [Stream].
final class AsyncBuilder<T> extends StatelessWidget {
  /// The data that will be used to create the initial snapshot.
  final T? initial;

  /// The asynchronous computation to
  /// which this builder is currently connected, possibly null.
  ///
  /// If no future has yet completed, including in the case where [future] is null,
  /// the data provided to the [builder] will be set to [initial].
  final Future<T>? future;

  /// Creates a new [StreamBuilder] that builds itself
  /// based on the latest snapshot of interaction with the specified [stream]
  /// and whose build strategy is given by [builder].
  final Stream<T>? stream;

  /// Returns whether this snapshot is loading.
  final Widget? placeholder;

  /// Returns whether this snapshot contains a non-null error value.
  final Widget? errorholder;

  /// The build strategy currently used by this [builder].
  final Widget Function(BuildContext context, T snapshot) builder;

  /// Creates a widget that builds itself
  /// based on the latest snapshot of interaction
  /// with a [Future] or a [Stream].
  const AsyncBuilder({
    super.key,
    this.initial,
    this.future,
    this.stream,
    this.placeholder,
    this.errorholder,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if (stream == null) {
      return FutureBuilder<T>(
        future: future,
        initialData: initial,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return builder(
              context,
              snapshot.requireData,
            );
          }
          return Center(
            child: snapshot.hasError
                ? errorholder ?? Text('${snapshot.error}')
                : placeholder ?? const CircularProgressIndicator(),
          );
        },
      );
    }
    if (future == null) {
      return StreamBuilder<T>(
        stream: stream,
        initialData: initial,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return builder(
              context,
              snapshot.requireData,
            );
          }
          return Center(
            child: snapshot.hasError
                ? errorholder ?? Text('${snapshot.error}')
                : placeholder ?? const CircularProgressIndicator(),
          );
        },
      );
    }
    throw ArgumentError('Either future or stream must be not null');
  }
}
