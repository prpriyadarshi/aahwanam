import 'dart:ui';

class SvgTextElement {
  String id; // unique id or position index
  String text;
  double x;
  double y;
  TextStyle? style; // font, size, color if needed

  SvgTextElement({
    required this.id,
    required this.text,
    required this.x,
    required this.y,
     this.style,
  });
}
