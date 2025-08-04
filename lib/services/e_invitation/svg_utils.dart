import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Load SVG string from asset
Future<String> loadSvgString(String assetPath) async {
  return await rootBundle.loadString(assetPath);
}

/// Replace text inside SVG by textNodeId and newText
String replaceSvgText(String svgContent, Map<String, String> replacements) {
  String updatedSvg = svgContent;

  replacements.forEach((key, value) {
    // Simple replace: id="NAME">OldText<  → id="NAME">NewText<
    updatedSvg = updatedSvg.replaceAllMapped(
      RegExp(r'id="' + key + r'">([^<]*)<'),
          (match) => 'id="$key">$value<',
    );
  });

  return updatedSvg;
}
