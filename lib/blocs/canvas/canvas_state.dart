import '../../models/canvas_element.dart';


class CanvasState {
  final List<CanvasElement> elements;

  CanvasState({required this.elements});

  CanvasState copyWith({List<CanvasElement>? elements}) {
    return CanvasState(elements: elements ?? this.elements);
  }
}
