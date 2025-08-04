import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/canvas/canvas_bloc.dart';
import '../../blocs/canvas/canvas_event.dart';
import '../../blocs/canvas/canvas_state.dart';
import 'editable_convas.dart';


class CanvasEditorScreen extends StatelessWidget {
  const CanvasEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CanvasBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Template Editor')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CanvasBloc>(context).add(AddTextElement("Happy Birthday"));
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<CanvasBloc, CanvasState>(
          builder: (context, state) {
            return EditableCanvas(elements: state.elements);
          },
        ),
      ),
    );
  }
}
