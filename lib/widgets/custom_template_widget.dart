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
            crossAxisCount: 2, // 3 cards per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4, // Adjust aspect ratio to match design
          ),
          itemBuilder: (context, index) {
            final template = templates[index];
            return _CustomTemplateCard(
              imageUrl: template['image']!,
              title: template['title']!,
            );
          },
        ),
      ],
    );
  }
}

class _CustomTemplateCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const _CustomTemplateCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120, // Adjust height as per design
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 4.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
