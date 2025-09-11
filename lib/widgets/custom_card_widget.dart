import 'package:flutter/material.dart';
import 'custom_text_field.dart';
import '../screens/dashboard/photostudio_details_screen.dart';

class CustomCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
        bool showFavorites = true,
        Function(int index, bool isFavorite)? onFavoriteChanged,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final titleFontSize = screenWidth < 350
        ? 12.0
        : screenWidth < 400
        ? 15.0
        : 16.0;
    final viewAllFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 11.0
        : 12.0;

    // Adjust childAspectRatio for very small screens to avoid overflow
    final childAspectRatio = screenWidth < 350 ? 0.44 : 1.1;

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
                style: TextFontStyle.textFontStyle(16, Color(0xFF575959), FontWeight.w500),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    "View All",
                    style: TextFontStyle.textFontStyle(12, Color(0xFF1E535B), FontWeight.w500),
                  ),
                ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCardItem(
              context,
              item,
              screenWidth,
              index: index,
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
      Map<String, String> item,
      double screenWidth, {
        required int index,
        bool showFavorite = true,
        Function(int index, bool isFavorite)? onFavoriteChanged,
      }) {
    // Small-device adjustments
    final imageHeight = screenWidth < 363 ? 90.0 : 120.0;
    final nameFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 12.0
        : 12.0;
    final priceFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 12.0
        : 10.0;
    final ratingFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 8.0
        : 10.0;

    // Get favorite status from item data (default to false if not present)
    bool isFavorite = item['isFavorite'] == 'true';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotostudioDetailsScreen(),
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: const Color(0xFFFFEFDF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with Love Icon Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6.0),
                  ),
                  child: item['image']!.startsWith('assets/')
                      ? Image.asset(
                    item['image']!,
                    height: imageHeight,
                    width: MediaQuery.of(context).size.width * 188 / 375,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    item['image']!,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: imageHeight,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: const Icon(Icons.error, color: Colors.grey),
                      );
                    },
                  ),
                ),
                // Love/Favorite Icon Overlay
                if (showFavorite)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: () {
                        // Toggle favorite status
                        bool newFavoriteStatus = !isFavorite;
                        onFavoriteChanged?.call(index, newFavoriteStatus);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.red,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          item['name'] ?? '',
                          style: TextFontStyle.textFontStyle(12, Color(0xFF575959), FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFEFAA37), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            item['rating'] ?? "0.0",
                            style: TextFontStyle.textFontStyle(10, Color(0xFF575959), FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item['price'] ?? '',
                    style: TextFontStyle.textFontStyle(12, Color(0xFF1E535B), FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}