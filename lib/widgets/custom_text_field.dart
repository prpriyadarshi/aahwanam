import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_text_field.dart' as GoogleFonts;


class TextFontStyle{

  static TextStyle textFontStyle(double size, Color textColor, [FontWeight? fontWeight]){
    return GoogleFonts.poppins(
        fontSize: size,
        color: textColor,
        fontWeight: fontWeight ?? FontWeight.normal
    );
  }

}
TextStyle poppins({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
