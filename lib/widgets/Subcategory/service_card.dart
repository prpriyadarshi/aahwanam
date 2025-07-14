import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;

  const ServiceCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imageUrl,
                height: 160,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(
                    color: Color(0xFF1E535B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF575959),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
