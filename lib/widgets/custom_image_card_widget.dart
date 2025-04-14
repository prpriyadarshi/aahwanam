import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String imageUrl;
  final bool isAsset;
  final bool showFavoriteIcon;

  const CustomImageCard({
    Key? key,
    required this.imageUrl,
    this.isAsset = false,
    this.showFavoriteIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: isAsset
                    ? Image.asset(
                  imageUrl,
                  width: 100,
                  height: 102,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  imageUrl,
                  width: 100,
                  height: 102,
                  fit: BoxFit.cover,
                ),
              ),
              if (showFavoriteIcon)
                Positioned(
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
        ],
      ),
    );
  }
}
