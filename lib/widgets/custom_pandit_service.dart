import 'package:flutter/material.dart';
import '../services/pandit/pandit_theme.dart';
import 'custom_text_field.dart';

class CustomPanditCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, dynamic>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
        bool showTitle = true, // ✅ New parameter to control title visibility
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) // ✅ Conditionally render title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textFontStyle(16, const Color(0xFF1E535B), FontWeight.bold),
                ),
                if (showViewAll)
                  GestureDetector(
                    onTap: onViewAll,
                    child: Text(
                      'View All',
                      style: TextFontStyle.textFontStyle(14, Colors.blue, FontWeight.w500),
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 14),
        if (showTitle) const SizedBox(height: 12), // ✅ Add space only if title is shown
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
            childAspectRatio: 0.8,
          ),
          itemCount: data.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCarditem(context, item);
          },
        ),
      ],
    );
  }


  static Widget buildCarditem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PanditTheme()),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
                  child: item['image'] != null && item['image']!.startsWith('assets/')
                      ? Image.asset(
                    item['image']!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    item['image'] ?? '',
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item['name'] ?? '',
                          style:
                          TextFontStyle.textFontStyle( 12, Color(0xFF575959),FontWeight.w500),
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
                            style: TextFontStyle.textFontStyle( 10,  Color(0xFF575959)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item['price'] ?? '',
                    style:
                      TextFontStyle.textFontStyle( 12, Color(0xFF1E535B),FontWeight.w600),
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
