import 'dart:ui';

abstract class CanvasEvent {}

class AddTextElement extends CanvasEvent {
  final String text;
  AddTextElement(this.text);
}

class UpdateTextElement extends CanvasEvent {
  final int index;
  final String updatedText;
  UpdateTextElement({required this.index, required this.updatedText});
}

class ChangeFont extends CanvasEvent {
  final int index;
  final String fontFamily;
  ChangeFont({required this.index, required this.fontFamily});
}

class ChangeColor extends CanvasEvent {
  final int index;
  final Color color;
  ChangeColor({required this.index, required this.color});
}

