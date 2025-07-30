import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  final List<dynamic> reviews;
  final List<String> galleryImages;

  const ReviewList({super.key, required this.reviews, required this.galleryImages});

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
            width: 68,
            child: LinearProgressIndicator(
              value: count / 100,
              color: Colors.teal,
              backgroundColor: Colors.grey.shade300,
              minHeight: 3,
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
      color: Colors.white,
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Rating Summary Section
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rating & Reviews",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF575959),
                      )),
                    const SizedBox(height: 12),
                    _buildRatingRow(5, 80),
                    _buildRatingRow(4, 60),
                    _buildRatingRow(3, 30),
                    _buildRatingRow(2, 20),
                    _buildRatingRow(1, 10),
                  ],
                ),
                const SizedBox(height: 40,),
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust padding
                        side: const BorderSide(color: const Color(0xFF1E535B), width: 1), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded pill shape
                        ),
                      ),
                      child: const Text(
                        "Rate Service",
                        style: TextStyle(
                          color: const Color(0xFF1E535B), // Text color same as border
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text("Very Good",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF575959),
                      )),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Icon(Icons.star_half, color: Colors.amber, size: 18),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text("200 ratings and 160 reviews",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ✅ Photo Gallery
          const Text("Photos",  style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xFF575959),
          )),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: galleryImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(galleryImages[index],
                        width: 80, height: 80, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // So it scrolls with the parent
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const Icon(Icons.star_half, color: Colors.amber, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          review['rating'].toString(),
                          style:const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xFF575959),
                          ),

                        ),
                        const SizedBox(width: 6),
                        Text(
                          review['comment'],
                            style:const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF575959),
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      review['description'],
                      style:const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF575959),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(review['image']),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          // ✅ Reviews Section
           ],
      ),
    ),
    );
  }
}
