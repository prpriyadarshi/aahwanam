import 'package:flutter/material.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryImages = [
      'assets/images/TrendingMehndi.png',
      'assets/images/TrendingMehndi1.png',
      'assets/images/TrendingMehndi2.png',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: galleryImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            galleryImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
