import 'package:flutter/cupertino.dart';

class SvgTextElement {
  final String id;
  String text;
  TextEditingController controller;

  SvgTextElement({required this.id, required this.text})
      : controller = TextEditingController(text: text);
}
