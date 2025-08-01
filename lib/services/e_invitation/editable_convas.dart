import 'package:flutter/material.dart';
import '../../models/canvas_element.dart';


class EditableCanvas extends StatelessWidget {
  final List<CanvasElement> elements;
  const EditableCanvas({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/banner.jpg", fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        ...elements.asMap().entries.map((entry) {
          final index = entry.key;
          final e = entry.value;
          return Positioned(
            top: 100.0 + index * 30,
            left: 50.0,
            child: Text(
              e.text,
              style: TextStyle(
                fontFamily: e.fontFamily,
                color: e.color,
                fontSize: 24,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
