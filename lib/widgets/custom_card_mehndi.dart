import 'package:aahwanam/services/mehandi_service/mehandi.dart';
import 'package:flutter/material.dart';
import '../services/mehandi_service/mehnditheme.dart';
import 'custom_text_field.dart';

class CustomCardMehndiWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, String>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final titleFontSize = screenWidth < 350 ? 14.0 : screenWidth < 400 ? 15.0 : 16.0;
    final viewAllFontSize = screenWidth < 350 ? 10.0 : screenWidth < 400 ? 11.0 : 12.0;

    // Adjust childAspectRatio for very small screens
    final childAspectRatio = screenWidth < 350 ? 0.9 : 1.05;

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
                style: TextFontStyle.textFontStyle(
                  titleFontSize,
                  const Color(0xFF575959),
                  FontWeight.w600,
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: onViewAll,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(0, 0)),
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
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCardMehndi(context, item, screenWidth);
          },
        ),
      ],
    );
  }

  static Widget buildCardMehndi(BuildContext context, Map<String, String> item, double screenWidth) {
    final imageHeight = screenWidth < 350 ? 100.0 : 110.0;
    final nameFontSize = screenWidth < 350 ? 10.0 : screenWidth < 400 ? 11.0 : 12.0;
    final priceFontSize = screenWidth < 350 ? 8.0 : screenWidth < 400 ? 9.0 : 12.0;
    final ratingFontSize = screenWidth < 350 ? 8.0 : screenWidth < 400 ? 9.0 : 10.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MehndiTheme(mehndi: item)),
        );
      },
      child: Card(
        elevation: 0,
        color: const Color(0xFFFFEFDF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
                  child: item['image']!.startsWith('assets/')
                      ? Image.asset(item['image']!, height: imageHeight, width: double.infinity, fit: BoxFit.cover)
                      : Image.network(item['image']!, height: imageHeight, width: double.infinity, fit: BoxFit.cover),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10,
                    child: Icon(Icons.favorite_border, size: 14, color: Colors.red),
                  ),
                ),
              ],
            ),
            // Text Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
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
                          const Icon(Icons.star, color: Color(0xFFEFAA37), size: 14),
                          const SizedBox(width: 2),
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
      ),
    );
  }
}
