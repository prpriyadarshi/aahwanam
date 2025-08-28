import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomPackageCard extends StatelessWidget {
  final String title;
  final int servicesIncluded;
  final String price;
  final String status;
  final VoidCallback? onTap;

  const CustomPackageCard({
    super.key,
    required this.title,
    required this.servicesIncluded,
    required this.price,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDelivered = status.toLowerCase() == "delivered";
    final statusColor = isDelivered ? Colors.green : Colors.orange;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4E8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextFontStyle.textFontStyle(
                      14,                         // Font size
                      Color(0xFF575959),          // Text color
                      FontWeight.w500,            // Font weight
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, size: 20, color: Colors.black54),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Including $servicesIncluded Services",
              style: TextFontStyle.textFontStyle(
                12,                         // Font size
                Color(0xFF757575),          // Text color
                FontWeight.w400,            // Font weight
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("₹$price",
                  style: TextFontStyle.textFontStyle(
                    12,                         // Font size
                    Color(0xFF1E535B),          // Text color
                    FontWeight.w600,            // Font weight
                  ),
                ),
                Text(status,
                    style: TextStyle(color: statusColor, fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

