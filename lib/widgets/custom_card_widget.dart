import 'package:flutter/material.dart';
import 'Subcategory/category_tile.dart';

class CustomCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    final titleFontSize =
    screenWidth < 350 ? 14.0 : screenWidth < 400 ? 15.0 : 16.0;
    final viewAllFontSize =
    screenWidth < 350 ? 10.0 : screenWidth < 400 ? 11.0 : 12.0;

    final childAspectRatio =
    screenWidth < 350 ? 0.88 : screenWidth < 400 ? 0.94 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF575959),
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    "View All",
                    style: TextFontStyle.textFontStyle(
                      viewAllFontSize,
                      const Color(0xFF1E535B),
                      FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
            return buildCardItem(item, screenWidth);
          },
        ),
      ],
    );
  }

  static Widget buildCardItem(Map<String, String> item, double screenWidth) {
    final nameFontSize =
    screenWidth < 350 ? 10.0 : screenWidth < 400 ? 11.0 : 12.0;
    final priceFontSize =
    screenWidth < 350 ? 9.0 : screenWidth < 400 ? 10.0 : 12.0;
    final ratingFontSize =
    screenWidth < 350 ? 8.0 : screenWidth < 400 ? 9.0 : 10.0;

    return Card(
      elevation: 0,
      color: const Color(0xFFFFEFDF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent extra height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: item['image']!.startsWith('assets/')
                  ? Image.asset(
                item['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Image.network(
                item['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'] ?? '',
                        style: TextFontStyle.textFontStyle(
                          nameFontSize,
                          const Color(0xFF575959),
                          FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFEFAA37), size: 14),
                        const SizedBox(width: 3),
                        Text(
                          item['rating'] ?? "0.0",
                          style: TextFontStyle.textFontStyle(
                            ratingFontSize,
                            const Color(0xFF575959),
                            FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2), // Minimized spacing
                Text(
                  item['price'] ?? '',
                  style: TextFontStyle.textFontStyle(
                    priceFontSize,
                    const Color(0xFF1E535B),
                    FontWeight.w600,
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
