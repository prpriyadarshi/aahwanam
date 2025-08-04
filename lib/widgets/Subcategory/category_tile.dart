import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TextFontStyle {
  static TextStyle textFontStyle(double fontSize, Color color, FontWeight weight) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: weight);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListScreen(),
    );
  }
}

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Map<String, String>> categories = [
    {"image": "assets/images/decoration.jpg", "label": "Decoration"},
    {"image": "assets/images/makeup.jpg", "label": "Makeup"},
    {"image": "assets/images/hair.jpg", "label": "Hair"},
    {"image": "assets/images/mehndi.jpg", "label": "Mehndi"},
    {"image": "assets/images/music.jpg", "label": "Music"},
  ];

  int selectedIndex = 0;

  void onCategoryTap(int index) {
    setState(() {
      final tapped = categories.removeAt(index);
      categories.insert(0, tapped);
      selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category Loop")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return CategoryTile(
              image: item["image"]!,
              label: item["label"]!,
              isSelected: index == selectedIndex,
              onTap: () => onCategoryTap(index),
            );
          },
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Green indicator
            Container(
              width: 6,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF00796B) : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            // Image and label
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    image,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 60,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextFontStyle.textFontStyle(
                      12,
                      const Color(0xFF575959),
                      FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
