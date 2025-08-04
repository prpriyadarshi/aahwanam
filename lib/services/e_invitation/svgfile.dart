import 'dart:ui';

import 'package:xml/xml.dart' as xml;
import '../../models/svg_element.dart';


List<SvgTextElement> parseSvgTextElements(String svgContent) {
  final document = xml.XmlDocument.parse(svgContent);
  final textElements = document.findAllElements('text');

  List<SvgTextElement> elements = [];

  int index = 0;
  for (var textElement in textElements) {
    final text = textElement.text;
    final x = double.tryParse(textElement.getAttribute('x') ?? '0') ?? 0;
    final y = double.tryParse(textElement.getAttribute('y') ?? '0') ?? 0;

    elements.add(SvgTextElement(
      id: 'text_$index',
      text: text,
      x: x,
      y: y,
      style: TextStyle(fontSize: 16), // simplify here
    ));

    index++;
  }

  return elements;
}
