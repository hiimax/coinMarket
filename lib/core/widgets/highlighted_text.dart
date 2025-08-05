import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final Color? highlightColor;
  final TextStyle? style;
  final TextAlign textAlign;
  final FontWeight? highlightFontWeight;

  const HighlightedText(
    this.text,
    {
    super.key,
    this.highlightColor,
    this.style,
    this.textAlign = TextAlign.start,
    this.highlightFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    // Use a RegExp to find parts between ***
    final RegExp exp = RegExp(r'\*\*\*(.*?)\*\*\*');
    final List<TextSpan> spans = [];
    final Iterable<RegExpMatch> matches = exp.allMatches(text);

    int currentPosition = 0;
    for (final RegExpMatch match in matches) {
      if (match.start > currentPosition) {
        // Add normal text
        spans.add(TextSpan(
          text: text.substring(currentPosition, match.start),
          style: style,
        ));
      }
      // Add highlighted text
      spans.add(TextSpan(
        text: match.group(1),
        style: style?.copyWith(
          color: highlightColor,
          fontWeight: highlightFontWeight,
        ),
      ));
      currentPosition = match.end;
    }

    // Add any remaining normal text
    if (currentPosition < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentPosition),
        style: style,
      ));
    }

    return RichText(
      textAlign: textAlign,
      text: TextSpan(children: spans),
    );
  }
}