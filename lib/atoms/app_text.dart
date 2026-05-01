// lib/atoms/app_text.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

enum TextStyle2 { display, headline, title, titleSm, body, caption, label }

class AppText extends StatelessWidget {
  final String text;
  final TextStyle2 style;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final bool overflow;

  const AppText(
    this.text, {
    super.key,
    this.style = TextStyle2.body,
    this.color,
    this.align,
    this.maxLines,
    this.overflow = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    TextStyle? textStyle;

    switch (style) {
      case TextStyle2.display:
        textStyle = theme.displayLarge;
        break;
      case TextStyle2.headline:
        textStyle = theme.headlineMedium;
        break;
      case TextStyle2.title:
        textStyle = theme.titleLarge;
        break;
      case TextStyle2.titleSm:
        textStyle = theme.titleMedium;
        break;
      case TextStyle2.body:
        textStyle = theme.bodyLarge;
        break;
      case TextStyle2.caption:
        textStyle = theme.bodyMedium;
        break;
      case TextStyle2.label:
        textStyle = theme.labelSmall;
        break;
    }

    if (color != null) {
      textStyle = textStyle?.copyWith(color: color);
    }

    return Text(
      text,
      style: textStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow ? TextOverflow.ellipsis : null,
    );
  }
}
