import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/canvas_element.dart';
import 'canvas_event.dart';
import 'canvas_state.dart';


class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc() : super(CanvasState(elements: [])) {
    on<AddTextElement>((event, emit) {
      final updated = List<CanvasElement>.from(state.elements)
        ..add(CanvasElement(text: event.text));
      emit(state.copyWith(elements: updated));
    });

    on<UpdateTextElement>((event, emit) {
      final updated = List<CanvasElement>.from(state.elements);
      updated[event.index] = updated[event.index].copyWith(text: event.updatedText);
      emit(state.copyWith(elements: updated));
    });

    on<ChangeFont>((event, emit) {
      final updated = List<CanvasElement>.from(state.elements);
      updated[event.index] = updated[event.index].copyWith(fontFamily: event.fontFamily);
      emit(state.copyWith(elements: updated));
    });

    on<ChangeColor>((event, emit) {
      final updated = List<CanvasElement>.from(state.elements);
      updated[event.index] = updated[event.index].copyWith(color: event.color);
      emit(state.copyWith(elements: updated));
    });
  }
}
