import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            height: 80, // Reduced height
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF575959),
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
