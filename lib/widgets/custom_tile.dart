import 'package:flutter/material.dart';

import 'Subcategory/category_tile.dart';
import 'custom_text_field.dart';

class CustomTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color bgColor;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        title: Text(
          title,
          style: TextFontStyle.textFontStyle(
            16, // Font size
            const Color(0xFF575959),
            FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}