import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget{
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
          width: 20,
          height: 20,
          fit: BoxFit.contain,),
        title: Text(title,
          style: TextFontStyle.textFontStyle(
            14,                      // font size
            Color(0xFF575959),       // color
            FontWeight.w400,         // weight
          ),),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

}