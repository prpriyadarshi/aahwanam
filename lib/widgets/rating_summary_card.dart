import 'package:flutter/material.dart';

class RatingSummaryCard extends StatelessWidget {
  final List<Map<String, dynamic>> ratingData;
  const RatingSummaryCard({super.key, required this.ratingData});

  Widget _buildRatingRow(int stars, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(stars.toString(), style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.amber, size: 16),
          const SizedBox(width: 6),
          SizedBox(
            width: 100,
            child: LinearProgressIndicator(
              value: count / 100,
              color: Colors.teal,
              backgroundColor: Colors.grey.shade300,
              minHeight: 6,
            ),
          ),
          const SizedBox(width: 8),
          Text(count.toString(), style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating & Reviews", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...ratingData.map((item) => _buildRatingRow(item['stars'], item['count'])),
            ],
          ),
          Column(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("Rate Service"),
              ),
              const SizedBox(height: 8),
              const Text("Very Good", style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star_half, color: Colors.amber, size: 18),
                  Icon(Icons.star_border, color: Colors.amber, size: 18),
                ],
              ),
              const Text("200 ratings and 160 reviews", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
