// lib/widgets/subcategory/event_service_card.dart

import 'package:flutter/material.dart';

class EventServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String? description; // Make description optional
  final bool isListLayout; // New parameter to control layout
  final VoidCallback? onAddTap; // Add onAddTap for consistency

  const EventServiceCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.description,
    this.isListLayout = false, // Default to grid layout
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isListLayout) {
      // List layout (like EntertainmentServiceCard)
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[300],
                    // child: const Icon(Icons.broken_image, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 12.0),
            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color(0xFF575959),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  if (description != null && description!.isNotEmpty) // Conditionally show description
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey[600],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.teal,
                        ),
                      ),
                      GestureDetector(
                        onTap: onAddTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // Grid layout (original ServiceCard)
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
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      width: 140,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: GestureDetector( // Added GestureDetector for Add button in GridView
                  onTap: onAddTap,
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
}