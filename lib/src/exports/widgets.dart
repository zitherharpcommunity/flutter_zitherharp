import 'package:flutter_zitherharp/flutter_zitherharp.dart';

export '/src/widgets/async_builder.dart';
export '/src/widgets/flutter_app.dart';
export '/src/widgets/image_factory.dart';
export '/src/widgets/text_builder.dart';

/// Creates an empty placeholder that will become as small as its parent allows.
const emptyPlaceholder = SizedBox.shrink();

/// A circular progress indicator that centers its parent.
const centeredLoadingIndicator = Center(
  child: CircularProgressIndicator(),
);

/// A circular progress indicator that tops its parent.
const toppedLoadingIndicator = Align(
  alignment: Alignment.topCenter,
  child: LinearProgressIndicator(),
);

/// A circular progress indicator that bottoms its parent.
const bottomedLoadingIndicator = Align(
  alignment: Alignment.bottomCenter,
  child: LinearProgressIndicator(),
);