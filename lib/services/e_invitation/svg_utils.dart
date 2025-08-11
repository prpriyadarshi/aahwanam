import 'dart:convert';
import 'package:flutter/services.dart';

import '../../models/svg_element.dart';


Future<String> loadSvgString(String assetPath) async {
  return await rootBundle.loadString(assetPath);
}

List<SvgTextElement> extractTextElements(String svgContent) {
  final regex = RegExp(r'<text[^>]*id="([^"]+)"[^>]*>(.*?)<\/text>', multiLine: true);
  final matches = regex.allMatches(svgContent);
  return matches.map((match) {
    return SvgTextElement(id: match.group(1)!, text: match.group(2)!);
  }).toList();
}

String updateSvgText(String originalSvg, List<SvgTextElement> elements) {
  String updatedSvg = originalSvg;
  for (var element in elements) {
    final regex = RegExp('<text[^>]*id="${element.id}"[^>]*>(.*?)<\/text>');
    updatedSvg = updatedSvg.replaceAllMapped(regex, (match) {
      return match.group(0)!.replaceFirst(match.group(1)!, element.text);
    });
  }
  return updatedSvg;
}
