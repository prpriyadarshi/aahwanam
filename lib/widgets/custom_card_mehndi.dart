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
                style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w600), // smaller text


              ),
              if (showViewAll)
                TextButton(
                  onPressed: onViewAll,
                  child:  Text(
                    "View All",
                    style: TextFontStyle.textFontStyle(12, const Color(0xFF1E535B), FontWeight.w400), // smaller text


                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
            return buildCardmehndi(context, item, data); // ✅ fixed: removed cast
          },
        ),
      ],
    );
  }

  static Widget buildCardmehndi(BuildContext context, Map<String, String> item, List<Map<String, String>> mehndiArtist) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MehndiTheme(mehndi: item,),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['name'] ?? '',
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
                            style: TextFontStyle.textFontStyle(10, const Color(0xFF575959), FontWeight.w400), // smaller text


                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item['price'] ?? '',
                    style: TextFontStyle.textFontStyle(12, const Color(0xFF1E535B), FontWeight.w600), // smaller text


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
