import 'package:flutter/material.dart';

class CustomCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
        String? sectionType,
        bool showFavorites = true,
        Function(int index, bool isFavorite)? onFavoriteChanged,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF575959),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: () {
                    print('Navigating to section: $sectionType');
                    onViewAll();
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1E535B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
            mainAxisExtent: 183,
          ),
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCardItem(
              context,
              item,
              index: index,
              sectionType: sectionType,
              showFavorite: showFavorites,
              onFavoriteChanged: onFavoriteChanged,
            );
          },
        ),
      ],
    );
  }

  static Widget buildCardItem(
      BuildContext context,
      Map<String, String> item, {
        required int index,
        String? sectionType,
        bool showFavorite = true,
        Function(int index, bool isFavorite)? onFavoriteChanged,
      }) {
    bool isFavorite = item['isFavorite'] == 'true';

    return Card(
      elevation: 0,
      color: const Color(0xFFFFEFDF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(6.0),
                ),
                child: item['image']!.startsWith('assets/')
                    ? Image.asset(
                  item['image']!,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  item['image']!,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 130,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error, color: Colors.grey),
                    );
                  },
                ),
              ),

              // Favorite Icon
              if (showFavorite)
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {
                      bool newFavoriteStatus = !isFavorite;
                      onFavoriteChanged?.call(index, newFavoriteStatus);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Text Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF575959),
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFEFAA37), size: 14),
                        const SizedBox(width: 4),
                        Text(
                          item['rating'] ?? "0.0",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF575959),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  item['price'] ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1E535B),
                    fontWeight: FontWeight.w500,
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
