import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          // border: isSelected ? Border.all(color: Colors.teal, width: 3) : null,
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextFontStyle.textFontStyle(
                  13, Color(0xFF575959), FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
