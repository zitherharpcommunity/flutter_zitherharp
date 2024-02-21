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
