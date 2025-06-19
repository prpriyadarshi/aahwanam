import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double width;
  final double fontSize;


  const CustomActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1E535B),
    this.borderColor = const Color(0xFF1E535B),
    this.textColor = Colors.white,
    this.height = 50,
    this.width = double.infinity,
    this.fontSize =18,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor, // ✅ uses passed color
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
