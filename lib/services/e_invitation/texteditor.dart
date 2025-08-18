import 'package:flutter/material.dart';

class TextEditorWidget extends StatefulWidget {
  final String initialText;
  final void Function(String) onTextChanged;

  const TextEditorWidget({
    super.key,
    required this.initialText,
    required this.onTextChanged,
  });

  @override
  State<TextEditorWidget> createState() => _TextEditorWidgetState();
}

class _TextEditorWidgetState extends State<TextEditorWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialText);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Edit Invitation Text',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              widget.onTextChanged(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}
