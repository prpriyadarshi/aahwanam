// review_screen.dart
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

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
               Text(
                "Ratings & Reviews",
                style: TextFontStyle.textFontStyle(
                  14,
                  const Color(0xFF575959),
                  FontWeight.w600,
                ),

              ),
              SizedBox(width: 100,),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E535B)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  minimumSize: const Size(80, 28),
                ),
                child:  Text(
                  "Rate Service",
                  style: TextFontStyle.textFontStyle(
                    11,
                    const Color(0xFF1E535B),
                     FontWeight.w500,
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
                          Text("$stars",
                            style: TextFontStyle.textFontStyle(
                            12,
                            const Color(0xFF575959),
                            FontWeight.w400,
                          ),
                              ),
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
                          Text("$count",
                            style: TextFontStyle.textFontStyle(
                            12,
                            const Color(0xFF575959),
                            FontWeight.w400,
                          ),),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  children:  [
                    Center(
                      child: Text("Very Good",
                          style: TextFontStyle.textFontStyle(
                            12,
                            const Color(0xFF575959),
                            FontWeight.w500,
                          ),
                         ),
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
                      child: Text("200 ratings and 160 reviews",
                          style: TextFontStyle.textFontStyle(
                            10,
                            const Color(0xFF575959),
                            FontWeight.w400,
                          ),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
           Text("Photos",
              style: TextFontStyle.textFontStyle(
                14,
                const Color(0xFF575959),
                FontWeight.w600,
              ),
             ),
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
            children:  [
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star, size: 16, color: Colors.amber),
              Icon(Icons.star_half, size: 16, color: Colors.amber),
              Icon(Icons.star_border, size: 16, color: Colors.amber),
              SizedBox(width: 8),
              Text("4.2",
                  style: TextFontStyle.textFontStyle(
                    12,
                    const Color(0xFF1E535B),
                    FontWeight.w600,
                  ),
                  ),
              SizedBox(width: 6),
              Text("Very good service",

                  style: TextFontStyle.textFontStyle(
                    12,
                    const Color(0xFF575959),
                    FontWeight.w400,
                  ),
                 ),
            ],
          ),
          const SizedBox(height: 8),
           Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextFontStyle.textFontStyle(
              12,
              const Color(0xFF575959),
              FontWeight.w400,
            ),

          ),
        ],
      ),
    );
  }
}