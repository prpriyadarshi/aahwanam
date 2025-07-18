// review_screen.dart
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final List<String> photos;
  final Map<int, int> ratingData;

  const ReviewScreen({
    super.key,
    required this.photos,
    required this.ratingData,
  });

  @override
  Widget build(BuildContext context) {
    final int totalRatings = ratingData.values.fold(0, (a, b) => a + b);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Ratings & Reviews",
                style: TextStyle(
                  color: Color(0xFF575959),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E535B)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  minimumSize: const Size(80, 28),
                ),
                child: const Text(
                  "Rate Service",
                  style: TextStyle(
                    color: Color(0xFF1E535B),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: ratingData.entries.map((entry) {
                    final stars = entry.key;
                    final count = entry.value;
                    final percent = totalRatings > 0 ? count / totalRatings : 0.0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Text("$stars", style: const TextStyle(fontSize: 12, color: Color(0xFF575959))),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 8),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: percent,
                              minHeight: 8,
                              backgroundColor: const Color(0xFFE0E0E0),
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1E535B)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text("$count", style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  children: const [
                    Center(
                      child: Text("Very Good", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF575959))),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star_half, color: Colors.amber, size: 18),
                        Icon(Icons.star_border, color: Colors.amber, size: 18),
                      ],
                    ),
                    SizedBox(height: 4),
                    Center(
                      child: Text("200 ratings and 160 reviews", style: TextStyle(fontSize: 10, color: Color(0xFF575959))),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text("Photos", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF575959))),
          const SizedBox(height: 8),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(photos[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          Row(
            children: const [
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star_half, size: 16, color: Colors.amber),
              Icon(Icons.star_border, size: 16, color: Colors.amber),
              SizedBox(width: 8),
              Text("4.2", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFF1E535B))),
              SizedBox(width: 6),
              Text("Very good service", style: TextStyle(fontSize: 12, color: Color(0xFF575959))),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(fontSize: 12, color: Color(0xFF575959)),
          ),
        ],
      ),
    );
  }
}