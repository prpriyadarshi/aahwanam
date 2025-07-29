import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  final List<dynamic> images;

  const PhotoGallery({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kitty Party Section
            _buildCategorySection(
              context,
              "Kitty Party",
              _getKittyPartyImages(),
            ),

            const SizedBox(height: 24),

            // Get Together Section
            _buildCategorySection(
              context,
              "Get Together",
              _getGetTogetherImages(),
            ),

            const SizedBox(height: 24),

            // Birthday Party Section
            _buildCategorySection(
              context,
              "Birthday Party",
              _getBirthdayPartyImages(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String categoryTitle, List<String> categoryImages) {
    if (categoryImages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Title
        Text(
          categoryTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 12),

        // Images Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.0,
          ),
          itemCount: categoryImages.length,
          itemBuilder: (context, index) {
            return _buildImageCard(context, categoryImages[index], index, categoryImages);
          },
        ),
      ],
    );
  }

  Widget _buildImageCard(BuildContext context, String imageUrl, int index, List<String> allImages) {
    return GestureDetector(
      onTap: () => _openImageViewer(context, imageUrl, index, allImages),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _buildImage(imageUrl),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.isEmpty) {
      return Container(
        color: Colors.grey[200],
        child: const Icon(
          Icons.image,
          size: 40,
          color: Colors.grey,
        ),
      );
    }

    // Handle network images
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Icon(
              Icons.broken_image,
              size: 40,
              color: Colors.grey,
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
                strokeWidth: 2,
              ),
            ),
          );
        },
      );
    }

    // Handle asset images
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: const Icon(
            Icons.broken_image,
            size: 40,
            color: Colors.grey,
          ),
        );
      },
    );
  }

  // These methods categorize your images - adjust based on your actual data structure
  List<String> _getKittyPartyImages() {
    // Add your specific kitty party images here
    List<String> kittyPartyImages = [
      // Add your image URLs here - replace these with your actual image paths
      'assets/images/Kitty-party1.png', // Replace with your first image URL
      'assets/images/Kitty-party2.png', // Replace with your second image URL
      'assets/images/Kitty-party3.png', // Replace with your second image URL
      // Replace with your third image URL
       // Replace with your second image URL
      // Replace with your fourth image URL
    ];

    // If you have images in your data that should be in kitty party category
    if (images.isNotEmpty) {
      for (var image in images) {
        if (image is Map<String, dynamic> && image['category'] == 'Kitty Party') {
          String imageUrl = image['url'] ?? image['image'] ?? '';
          if (imageUrl.isNotEmpty && !kittyPartyImages.contains(imageUrl)) {
            kittyPartyImages.add(imageUrl);
          }
        }
      }
    }

    // Remove placeholder URLs if you haven't replaced them yet
    kittyPartyImages.removeWhere((url) => url.startsWith('https://your-image-url'));

    return kittyPartyImages;
  }

  List<String> _getGetTogetherImages() {
    if (images.isEmpty) return [];

    List<String> getTogetherImages = [];
    for (var image in images) {
      if (image is Map<String, dynamic> && image['category'] == 'Get Together') {
        getTogetherImages.add(image['url'] ?? image['image'] ?? '');
      } else if (image is String) {
        if (images.indexOf(image) % 3 == 1) {
          getTogetherImages.add(image);
        }
      }
    }

    // If no specific categorization, take middle third of images
    if (getTogetherImages.isEmpty && images.isNotEmpty) {
      int thirdSize = (images.length / 3).ceil();
      int startIndex = thirdSize;
      for (int i = startIndex; i < startIndex + thirdSize && i < images.length; i++) {
        String imageUrl = images[i] is String ? images[i] :
        (images[i]['url'] ?? images[i]['image'] ?? '');
        if (imageUrl.isNotEmpty) getTogetherImages.add(imageUrl);
      }
    }

    return getTogetherImages;
  }

  List<String> _getBirthdayPartyImages() {
    if (images.isEmpty) return [];

    List<String> birthdayPartyImages = [];
    for (var image in images) {
      if (image is Map<String, dynamic> && image['category'] == 'Birthday Party') {
        birthdayPartyImages.add(image['url'] ?? image['image'] ?? '');
      } else if (image is String) {
        if (images.indexOf(image) % 3 == 2) {
          birthdayPartyImages.add(image);
        }
      }
    }

    // If no specific categorization, take last third of images
    if (birthdayPartyImages.isEmpty && images.isNotEmpty) {
      int thirdSize = (images.length / 3).ceil();
      int startIndex = thirdSize * 2;
      for (int i = startIndex; i < images.length; i++) {
        String imageUrl = images[i] is String ? images[i] :
        (images[i]['url'] ?? images[i]['image'] ?? '');
        if (imageUrl.isNotEmpty) birthdayPartyImages.add(imageUrl);
      }
    }

    return birthdayPartyImages;
  }

  void _openImageViewer(BuildContext context, String imageUrl, int index, List<String> categoryImages) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenImageViewer(
          imageUrl: imageUrl,
          images: categoryImages,
          initialIndex: index,
        ),
      ),
    );
  }
}

// Full screen image viewer
class _FullScreenImageViewer extends StatefulWidget {
  final String imageUrl;
  final List<String> images;
  final int initialIndex;

  const _FullScreenImageViewer({
    Key? key,
    required this.imageUrl,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${currentIndex + 1} of ${widget.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          final imageUrl = widget.images[index];

          return InteractiveViewer(
            child: Center(
              child: imageUrl.startsWith('http')
                  ? Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              )
                  : Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}