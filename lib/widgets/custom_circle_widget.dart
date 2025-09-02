import 'package:flutter/material.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';

class CustomCircleWidget extends StatelessWidget {
  final String heading;
  final List<Map<String, String>> categories;
  final void Function(String categoryName) onCategoryTap;
  final bool showViewAll;
  final VoidCallback? onViewAll;

  const CustomCircleWidget({
    Key? key,
    required this.heading,
    required this.categories,
    required this.onCategoryTap,
    this.showViewAll = false,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes based on screen width
    final headingFontSize = screenWidth * 0.045; // ~16 on 360px
    final viewAllFontSize = screenWidth * 0.035; // ~12 on 360px

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: TextFontStyle.textFontStyle(
                  headingFontSize,
                  const Color(0xFF575959),
                  FontWeight.w500,
                ),
              ),
              if (showViewAll && onViewAll != null)
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    'View All',
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
        SizedBox(height: screenWidth * 0.025),
        // Grid View
        SizedBox(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {},
                child: CategoryItem(
                  category: category,
                  onTap: () {
                    print("check category--------------cus");
                    onCategoryTap(category['name']!);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Map<String, String> category;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override


  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizes
    final avatarRadius = screenWidth * 0.09; // ~32 on 360px width
    final textFontSize = screenWidth * 0.03; // ~12 on 360px width
    final verticalSpacing = screenWidth * 0.015;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: category['image']!.startsWith('assets/')
                ? AssetImage(category['image']!) as ImageProvider
                : NetworkImage(category['image']!),
          ),
          SizedBox(height: verticalSpacing),
          SizedBox(
            width: avatarRadius * 3.5, // Keep container width fixed
            child: FittedBox( // ✅ Scales text to fit width
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                category['name']!,
                style: TextFontStyle.textFontStyle(
                  textFontSize,
                  const Color(0xFF575959),
                  FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
