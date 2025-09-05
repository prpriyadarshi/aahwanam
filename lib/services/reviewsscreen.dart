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
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Main Row (Rating & Reviews + Button + Summary)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left Section: Rating & Reviews + Bars
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rating & Reviews",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF575959),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Rating Bars
                    // Rating Bars
                    Column(
                      children: ratingData.entries.map((entry) {
                        final stars = entry.key;
                        final count = entry.value;
                        final percent = totalRatings > 0 ? count / totalRatings : 0.0;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "$stars",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF575959),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.star, size: 14, color: Colors.amber),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 120, // bar width
                                height: 4,  // decreased height (was 6 before)
                                child: LinearProgressIndicator(
                                  value: percent,
                                  backgroundColor: const Color(0xFFE0E0E0),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFF1E535B)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "$count",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF575959),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),


                  ],
                ),
              ),

              const SizedBox(width: 10),

              /// Right Section: Button + Summary
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30), // Add spacing above button
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1E535B)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        minimumSize: const Size(100, 32),
                      ),
                      child: const Text(
                        "Rate Service",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1E535B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Very Good",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF575959),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star_half, color: Colors.amber, size: 18),
                        Icon(Icons.star_border, color: Colors.amber, size: 18),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        "$totalRatings ratings and ${totalRatings ~/ 2} reviews",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF575959),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 20),

          /// Photos Section
          const Text(
            "Photos",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF575959),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 70,
            child: photos.isNotEmpty
                ? ListView.builder(
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
            )
                : const Center(
              child: Text(
                "No photos available",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// Review sample
          Row(
            children: const [
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star_half, size: 16, color: Colors.amber),
              Icon(Icons.star_border, size: 16, color: Colors.amber),
              SizedBox(width: 8),
              Text(
                "4.2",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1E535B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 6),
              Text(
                "Very good service",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF575959),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF575959),
            ),
          ),
          const SizedBox(height: 12),

          /// Single photo preview safely
          photos.isNotEmpty
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              photos[0],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          )
              : Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
            child: const Icon(Icons.image_not_supported),
          ),
        ],
      ),
    );
  }
}
