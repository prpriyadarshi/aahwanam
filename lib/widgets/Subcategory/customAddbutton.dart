import 'package:flutter/material.dart';
import '../custom_text_field.dart';

class CustomAddButton extends StatelessWidget {
  final int count;
  final VoidCallback onAddPressed;
  final ValueChanged<int> onCountChanged;

  const CustomAddButton({
    super.key,
    required this.count,
    required this.onAddPressed,
    required this.onCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    const Color commonTealColor = Color(0xFF1E535B);

    if (count == 0) {
      return GestureDetector(
        onTap: onAddPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: commonTealColor, width: 1.5),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            "Add",
            style: TextFontStyle.textFontStyle(10, commonTealColor, FontWeight.w500),
          ),
        ),
      );
    } else {
      return Container(
        height: 24, // Consistent height
        decoration: BoxDecoration(
          color: commonTealColor,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: commonTealColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton for decrementing
            SizedBox(
              width: 24, // Consistent width for both icon buttons
              height: 24,
              child: IconButton(
                icon: const Icon(Icons.remove, size: 12, color: Colors.white),
                onPressed: () => onCountChanged(count - 1),
                splashRadius: 14,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minHeight: 24, minWidth: 24),
              ),
            ),
            // Text for the count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '$count',
                style: TextFontStyle.textFontStyle(10, Colors.white, FontWeight.w500),
              ),
            ),
            // IconButton for incrementing
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                icon: const Icon(Icons.add, size: 12, color: Colors.white),
                onPressed: () => onCountChanged(count + 1),
                splashRadius: 14,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minHeight: 24, minWidth: 24),
              ),
            ),
          ],
        ),
      );
    }
  }
}