// responsive_utils.dart
import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double _designWidth = 390; // Reference width (your emulator width)
  static const double _designHeight = 844; // Reference height

  // Get responsive width based on screen width
  static double getResponsiveWidth(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width;
    return width * (screenWidth / _designWidth);
  }

  // Get responsive height based on screen height
  static double getResponsiveHeight(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height;
    return height * (screenHeight / _designHeight);
  }

  // Get responsive font size
  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / _designWidth;

    // Limit scaling to reasonable bounds
    if (scaleFactor > 1.5) return fontSize * 1.5;
    if (scaleFactor < 0.8) return fontSize * 0.8;

    return fontSize * scaleFactor;
  }

  // Get responsive padding
  static EdgeInsets getResponsivePadding(
      BuildContext context, {
        double horizontal = 0,
        double vertical = 0,
        double all = 0,
      }) {
    if (all > 0) {
      final value = getResponsiveWidth(context, all);
      return EdgeInsets.all(value);
    }
    return EdgeInsets.symmetric(
      horizontal: getResponsiveWidth(context, horizontal),
      vertical: getResponsiveHeight(context, vertical),
    );
  }

  // Check if device is tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 600;
  }

  // Check if device is small phone
  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }
}