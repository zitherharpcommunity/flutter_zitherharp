import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Stores the given [text] on the [Clipboard].
Future<void> copyToClipboard(String text) =>
    Clipboard.setData(ClipboardData(text: text));

/// Retrieves data from the [Clipboard] that matches the given [format].
Future<String?> pasteFromClipboard({String? format}) async =>
    (await Clipboard.getData(format ?? Clipboard.kTextPlain))?.text;
