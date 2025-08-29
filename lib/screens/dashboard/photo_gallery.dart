import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class PhotoGallery extends StatelessWidget {
  final List<Map<String, Object>> photoGallery;

  const PhotoGallery({Key? key, required this.photoGallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5, left: 21, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategorySection(context, "Kitty Party"),
            const SizedBox(height: 20),
            _buildCategorySection(context, "Get Together"),
            const SizedBox(height: 20),
            _buildCategorySection(context, "Birthday Party"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String categoryTitle) {
    List<String> categoryImages = getImagesByCategory(categoryTitle);

    if (categoryImages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryTitle,
          style: TextFontStyle.textFontStyle(12,  Color(0xFF575959), FontWeight.w500),
        ),
        const SizedBox(height: 12),

        // 👇 Horizontal scroll instead of grid
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoryImages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return _buildImageCard(context, categoryImages[index], index, categoryImages);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard(BuildContext context, String imageUrl, int index, List<String> allImages) {
    return GestureDetector(
      onTap: () => _openImageViewer(context, index, allImages),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: 105, // fixed width so images look aligned
          height: 105,
        ),
      ),
    );
  }

  /// ✅ Fetch images dynamically by category from photoGallery
  List<String> getImagesByCategory(String category) {
    final categoryData = photoGallery.firstWhere(
          (item) => item['category'] == category,
      orElse: () => <String, Object>{},
    );

    if (categoryData.isNotEmpty && categoryData['images'] != null) {
      return List<String>.from(categoryData['images'] as List);
    }
    return [];
  }

  void _openImageViewer(BuildContext context, int index, List<String> images) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => _FullScreenImageViewer(
        images: images,
        initialIndex: index,
      ),
    ));
  }
}

class _FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullScreenImageViewer({Key? key, required this.images, required this.initialIndex}) : super(key: key);

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '${currentIndex + 1} / ${widget.images.length}',
          style: TextFontStyle.textFontStyle(14, Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (index) => setState(() => currentIndex = index),
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(widget.images[index], fit: BoxFit.contain),
          );
        },
      ),
    );
  }
}
