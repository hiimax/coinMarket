import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.left,
    this.textDirection,
    this.softWrap,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool useNotoSans = text.contains('\u20A6');

    final defaultStyle = useNotoSans
        ? GoogleFonts.notoSans()
        : const TextStyle(
            fontFamily: 'Inter',
          );

    final textStyle = style != null
        ? useNotoSans
            ? _notoSans(style!)
            : style
        : defaultStyle;

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
    );
  }

  TextStyle _notoSans(TextStyle style) {
    return GoogleFonts.notoSans(
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      letterSpacing: style.letterSpacing,
      color: style.color,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      height: style.height,
      shadows: style.shadows,
    );
  }
}
