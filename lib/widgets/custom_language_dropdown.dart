import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final void Function(String? value) onChanged;
  final double? width; // Optional width parameter
  final double? height; // Optional width parameter

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.selectedItem,
    this.width, // Initialize width
    this.height, // Initialize width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Set the width of the dropdown
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        isExpanded: true,
        underline: const SizedBox(), // Remove default underline
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF575959)),
        hint: Text(
          hintText,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF575959),
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF575959),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
