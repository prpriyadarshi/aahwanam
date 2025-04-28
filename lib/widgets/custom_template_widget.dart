import 'package:flutter/material.dart';

class CustomTemplateGrid extends StatelessWidget {
  final List<Map<String, String>> templates;
  final VoidCallback? onViewAll;
  final String title; // Make the title dynamic
  final bool showViewAll; // Control the visibility of the "View All" button

  const CustomTemplateGrid({
    Key? key,
    required this.templates,
    required this.title,
    required this.showViewAll,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: onViewAll,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1E535B),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(), // Prevents scrolling within the grid
          shrinkWrap: true,
          itemCount: templates.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 12, // Horizontal spacing between cards
            mainAxisSpacing: 12, // Vertical spacing between cards
            childAspectRatio: 0.7, // Adjust aspect ratio for better alignment
          ),
          itemBuilder: (context, index) {
            final template = templates[index];
            return _CustomTemplateCard(
              imageUrl: template['image'] ?? 'assets/images/defaultImage.png', // Provide a default image
            );
          },
        ),
      ],
    );
  }
}

class _CustomTemplateCard extends StatelessWidget {
  final String imageUrl;

  const _CustomTemplateCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 1, // Slight elevation for visual distinction
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Ensures the image fills the card proportionally
                width: double.infinity,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between the card and additional content (if any)
      ],
    );
  }
}
