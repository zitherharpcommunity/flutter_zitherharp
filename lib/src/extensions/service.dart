import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Stores the given [text] on the [Clipboard].
Future<void> copyToClipboard(String text) =>
    Clipboard.setData(ClipboardData(text: text));

/// Retrieves data from the [Clipboard] that matches the given [format].
Future<String?> pasteFromClipboard({String? format}) async =>
    (await Clipboard.getData(format ?? Clipboard.kTextPlain))?.text;

Future<void> setEnabledFullscreen(bool enable) {
  return SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: enable ? [] : SystemUiOverlay.values,
  );
}

Future<void> hideStatusBar() async {
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  return SystemChrome.setSystemUIChangeCallback(
    (systemOverlaysAreVisible) async {
      if (systemOverlaysAreVisible) {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        await SystemChrome.restoreSystemUIOverlays();
      }
    },
  );
}
