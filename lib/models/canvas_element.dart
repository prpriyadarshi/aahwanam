import 'package:flutter/material.dart';

class CanvasElement {
  final String text;
  final String fontFamily;
  final Color color;

  CanvasElement({
    required this.text,
    this.fontFamily = 'Belleza',
    this.color = Colors.black,
  });

  CanvasElement copyWith({
    String? text,
    String? fontFamily,
    Color? color,
  }) {
    return CanvasElement(
      text: text ?? this.text,
      fontFamily: fontFamily ?? this.fontFamily,
      color: color ?? this.color,
    );
  }
}
