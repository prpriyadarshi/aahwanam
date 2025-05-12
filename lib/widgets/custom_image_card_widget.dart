import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String imageUrl;
  final bool isAsset;
  final bool showFavoriteIcon;
  final bool favoriteSelected;
  final double width;
  final double height;


  const CustomImageCard({
    Key? key,
    required this.imageUrl,
    this.isAsset = false,
    this.showFavoriteIcon = true,
    this.favoriteSelected = false,
    this.width = 100,
    this.height = 102,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  imageUrl,
                  width: width,
                  height: height,
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
                      showFavoriteIcon && favoriteSelected
                          ? Icons.favorite  // Show favorite icon if both conditions are true
                          : Icons.favorite_border,  // Show favorite_border icon if the conditions are false
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
