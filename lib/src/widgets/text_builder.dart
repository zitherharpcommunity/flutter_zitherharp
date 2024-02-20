import 'package:flutter_zitherharp/flutter_zitherharp.dart';

class TextBuilder extends StatelessWidget {
  /// Creates a paragraph of [Text] widget.
  const TextBuilder({
    super.key,
    this.style,
    this.styleBuilder,
    required this.children,
  });

  final List<String> children;
  final TextStyle? style;
  final TextStyle? Function(TextStyle? style, int index)? styleBuilder;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: children.firstOrNull,
        style: styleBuilder?.call(style, 0) ?? style,
        children: List.generate(
          children.length - 1,
          (index) {
            return TextSpan(
              text: children[index + 1],
              style: styleBuilder?.call(style, index + 1) ?? style,
            );
          },
        ),
      ),
    );
  }
}