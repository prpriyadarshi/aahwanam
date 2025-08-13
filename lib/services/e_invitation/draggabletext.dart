// lib/widgets/editable_text_overlay.dart
import 'package:flutter/material.dart';

class EditableTextOverlay extends StatefulWidget {
  final String initialText;

  const EditableTextOverlay({Key? key, required this.initialText}) : super(key: key);

  @override
  State<EditableTextOverlay> createState() => _EditableTextOverlayState();
}

class _EditableTextOverlayState extends State<EditableTextOverlay> {
  Offset position = Offset(100, 100);
  bool isEditing = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
          });
        },
        onTap: () {
          setState(() => isEditing = true);
        },
        child: isEditing
            ? Container(
          width: 200,
          child: TextField(
            controller: controller,
            autofocus: true,
            onSubmitted: (_) => setState(() => isEditing = false),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
            : Text(
          controller.text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}