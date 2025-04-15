import 'package:flutter/material.dart';

class CustomCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575959)),
              ),
              TextButton(
                  onPressed: onViewAll,
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1E535B),
                    ),
                  )),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
            childAspectRatio: 1.05,
          ),
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCard(item);
          },
        ),
      ],
    );
  }

  static Widget buildCard(Map<String, String> item) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFFEFDF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensures minimal vertical space
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(6.0),
                ),
                child: item['image']!.startsWith('assets/')
                    ? Image.asset(
                  item['image']!,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  item['image']!,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: Icon(
                    Icons.favorite_border,
                    size: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575959),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          item['rating'] ?? "0.0",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF575959),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0), // Space between name and price
                Text(
                  item['price']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1E535B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
