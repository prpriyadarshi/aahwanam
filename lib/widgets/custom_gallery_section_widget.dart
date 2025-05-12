import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GallerySectionWidget extends StatelessWidget {
  final String title;
  final List<String> mediaPaths;
  final bool isVideo;
  final bool isGrid;

  const GallerySectionWidget({
    Key? key,
    required this.title,
    required this.mediaPaths,
    required this.isVideo,
    this.isGrid = false, // Default is horizontal scroll
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF575959),
          ),
        ),
        const SizedBox(height: 8),
        isGrid
            ? GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mediaPaths.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 96 / 102,
          ),
          itemBuilder: (context, index) => _buildMediaItem(mediaPaths[index]),
        )
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: mediaPaths.map((path) => _buildMediaItem(path)).toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMediaItem(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              path,
              width: 96,
              height: 102,
              fit: BoxFit.cover,
            ),
          ),
          if (isVideo)
            const Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
