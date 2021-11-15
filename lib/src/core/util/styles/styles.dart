import 'package:flutter/material.dart';
import '../numeric_constants.dart';

final backgroundColor = LinearGradient(
  colors: [
    const Color(0xFFB6101D),
    const Color(0xFFE0881C),
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(1.0, 0.0),
  stops: [0.0, 1.0],
  tileMode: TileMode.clamp,
);
final evolutionButtonColor = Color(0xFFDE3B3B);
final firstPageColor = Color(0xFF3466AF);
final secondPageColor = Color(0xFFFFCC03);
final pageTextStyleBorder = TextStyle(
  fontFamily: 'Pokemon',
  fontSize: NumericConstants.pageTextFontSize,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = NumericConstants.pageForegroundStrokeWidth
    ..color = firstPageColor,
);
final pageTextStyle = TextStyle(
  fontFamily: 'Pokemon',
  fontSize: NumericConstants.pageTextFontSize,
  color: secondPageColor,
);
