import 'package:flutter/material.dart';
import '../services/makeup_hair_service/MakeupDecor.dart';
import 'custom_text_field.dart';

class CustomCardMakeUpWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final titleFontSize = screenWidth < 350
        ? 14.0
        : screenWidth < 400
        ? 15.0
        : 16.0;
    final viewAllFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 11.0
        : 12.0;

    // Adjust childAspectRatio for very small screens
    final childAspectRatio = screenWidth < 350 ? 0.9 : 1.05;

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
                style: TextFontStyle.textFontStyle(
                  titleFontSize,
                  const Color(0xFF575959),
                  FontWeight.w600,
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
            return buildCardmakeUp(context, item, screenWidth);
          },
        ),
      ],
    );
  }

  static Widget buildCardmakeUp(
      BuildContext context, Map<String, String> item, double screenWidth) {
    // Small-device adjustments
    final imageHeight = screenWidth < 350 ? 100.0 : 110.0;
    final nameFontSize = screenWidth < 350
        ? 10.0
        : screenWidth < 400
        ? 11.0
        : 12.0;
    final priceFontSize = screenWidth < 350
        ? 8.0
        : screenWidth < 400
        ? 9.0
        : 12.0;
    final ratingFontSize = screenWidth < 350
        ? 8.0
        : screenWidth < 400
        ? 9.0
        : 10.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MakeUpTheme(makeupHair: item),
          ),
        );
      },
      child: Card(
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
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    item['image']!,
                    height: imageHeight,
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
            // Wrap text Column in Flexible to prevent overflow
            Flexible(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
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
                                color: Color(0xFFEFAA37), size: 16),
                            const SizedBox(width: 4),
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
                    const SizedBox(height: 4.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
