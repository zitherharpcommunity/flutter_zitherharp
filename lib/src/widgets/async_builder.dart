import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A widget that builds itself
/// based on the latest snapshot of interaction
/// with a [Future] or a [Stream].
///
/// This is a widget merged between [FutureBuilder] and [StreamBuilder].
final class AsyncBuilder<T> extends StatelessWidget {
  /// The data that will be used to create the initial snapshot.
  final T? initial;

  /// The asynchronous computation to
  /// which this builder is currently connected, possibly null.
  ///
  /// If no future has yet completed, including in the case where [future] is null,
  /// the data provided to the [builder] will be set to [initial].
  final Future<T>? future;

  /// The asynchronous computation to which this builder is currently connected,
  /// possibly null. When changed, the current summary is updated using
  /// [afterDisconnected], if the previous stream was not null, followed by
  /// [afterConnected], if the new stream is not null.
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
  }) : assert(
          (future != null && stream == null) ||
              (future == null && stream != null),
          _assertError,
        );

  /// A message describing the problem with an argument.
  static const _assertError = 'future or stream must be not null';

  @override
  Widget build(BuildContext context) {
    if (stream == null) {
      return FutureBuilder<T>(
        future: future,
        initialData: initial,
        builder: _buildSnapshot,
      );
    }
    if (future == null) {
      return StreamBuilder<T>(
        stream: stream,
        initialData: initial,
        builder: _buildSnapshot,
      );
    }
    throw ArgumentError(_assertError);
  }

  /// If [future] is not null,
  /// creates a widget that builds itself based on
  /// the latest snapshot of interaction with a [Future].
  ///
  /// If [stream] is not null,
  /// creates a new [StreamBuilder] that builds itself based on
  /// the latest snapshot of interaction with the [Stream].
  Widget _buildSnapshot(
    BuildContext context,
    AsyncSnapshot<T> snapshot,
  ) {
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
  }
}
