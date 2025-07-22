import 'package:flutter/material.dart';
import '../../models/subcategory_model.dart';
import 'Subcategory/category_tile.dart';

class VerticalCategoryMenu extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const VerticalCategoryMenu({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.22,
      color: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];
          return CategoryTile(
            image: category.image,
            label: category.name,
            isSelected: selectedIndex == index,
            onTap: () => onCategorySelected(index),
          );
        },
      ),
    );
  }
}
