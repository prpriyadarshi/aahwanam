import 'package:flutter/material.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String details;
  final String imagePath;
  final double rating;

  const PackageCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.details,
    required this.imagePath,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),

      elevation: 0,
      color: const Color(0xFFFFEFDF),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imagePath,
                height: 130,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF575959),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color:  Color(0xFFEFAA37),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF575959),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF575959),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price and Details
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee, // Currency rupee icon
                        size: 14,
                        color: Color(0xFF1E535B),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E535B),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Text(
                    details,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
