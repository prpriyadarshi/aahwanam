import 'package:flutter/material.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        'name': 'Sathwik',
        'rating': 4.5,
        'comment': 'Great service, the drivers were very professional.'
      },
      {
        'name': 'Nikhil',
        'rating': 4.0,
        'comment': 'Everything was handled well, good job!'
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                        (i) => Icon(
                      i < (review['rating'] as double).round()
                          ? Icons.star
                          : Icons.star_border,
                      size: 16,
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        );
      },
    );
  }
}
