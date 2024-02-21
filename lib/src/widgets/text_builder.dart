import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A paragraph of [Text] widget.
class TextBuilder extends StatelessWidget {
  /// Creates a paragraph of [Text] widget.
  const TextBuilder({
    super.key,
    this.style,
    this.styleBuilder,
    this.recognizerBuilder,
    required this.children,
  });

  final List<String> children;
  final TextStyle? style;
  final TextStyle? Function(TextStyle? style, int index)? styleBuilder;
  final GestureRecognizer? Function(String text, int index)? recognizerBuilder;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: children.firstOrNull,
        style: styleBuilder?.call(style, 0) ?? style,
        children: List.generate(
          children.length - 1,
          (index) {
            final text = children[index + 1];
            return TextSpan(
              text: text,
              style: styleBuilder?.call(style, index + 1) ?? style,
              recognizer: recognizerBuilder?.call(text, index),
            );
          },
        ),
      ),
    );
  }
}
