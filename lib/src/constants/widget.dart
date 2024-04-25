import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Creates an empty placeholder that will become as small as its parent allows.
const Widget emptyPlaceholder = SizedBox.shrink();

/// A circular progress indicator that centers its parent.
const Widget centeredLoadingIndicator = Center(
  child: CircularProgressIndicator(),
);

/// A linear progress indicator that tops its parent.
final Widget toppedLoadingIndicator = Container(
  alignment: Alignment.topCenter,
  child: const LinearProgressIndicator(),
);

/// A linear progress indicator that bottoms its parent.
final Widget bottomedLoadingIndicator = Container(
  alignment: Alignment.bottomCenter,
  child: const LinearProgressIndicator(),
);
