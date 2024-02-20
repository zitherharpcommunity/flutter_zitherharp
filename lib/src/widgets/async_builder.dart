import 'package:flutter_zitherharp/flutter_zitherharp.dart';

final class AsyncBuilder<T> extends StatelessWidget {
  final T? initial;
  final Future<T>? future;
  final Stream<T>? stream;
  final Widget? placeholder;
  final Widget? errorholder;
  final Widget Function(BuildContext context, T snapshot) builder;

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
    throw ArgumentError('Either future or stream must be null');
  }
}