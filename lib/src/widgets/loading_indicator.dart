import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A circular progress indicator that centers its parent.
const centeredLoadingIndicator = Center(
  child: CircularProgressIndicator(),
);

/// A linear progress indicator that tops its parent.
const toppedLoadingIndicator = Align(
  alignment: Alignment.topCenter,
  child: LinearProgressIndicator(),
);

/// A linear progress indicator that bottoms its parent.
const bottomedLoadingIndicator = Align(
  alignment: Alignment.bottomCenter,
  child: LinearProgressIndicator(),
);
