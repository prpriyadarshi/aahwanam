import 'package:flutter/material.dart';

class CustomCircleWidget extends StatelessWidget {
  final String heading;
  final List<Map<String, String>> categories;
  final void Function(String categoryName) onCategoryTap;
  final bool showViewAll; // Add a flag to control "View All" visibility
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
               heading ,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                ),
              ),
              if(showViewAll && onViewAll != null)
              TextButton(
                onPressed: onViewAll,
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1E535B),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
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
                onTap: (){

                },
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: category['image']!.startsWith('assets/')
                ? AssetImage(category['image']!) as ImageProvider
                : NetworkImage(category['image']!),
          ),
          const SizedBox(height: 5),
          Text(
            category['name']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF575959),
            ),
          ),
        ],
      ),
    );
  }
}
