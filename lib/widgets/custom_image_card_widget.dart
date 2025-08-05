import 'package:flutter/material.dart';

class CustomImageCard extends StatefulWidget {
  final String imageUrl;
  final bool isAsset;
  final bool showFavoriteIcon;
  final bool favoriteSelected;
  final double width;
  final double height;
  final VoidCallback? onFavoriteToggle;


  const CustomImageCard({
    Key? key,
    required this.imageUrl,
    this.isAsset = false,
    this.showFavoriteIcon = true,
    this.favoriteSelected = false,
    this.width = 100,
    this.height = 102,
    this.onFavoriteToggle,
  }) : super(key: key);
  @override
  State<CustomImageCard> createState() => _CustomImageCard();
}

class _CustomImageCard extends State<CustomImageCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.isAsset
                    ? Image.asset(
                  widget.imageUrl,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  widget.imageUrl,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.cover,
                ),
              ),
              if (widget.showFavoriteIcon)
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: widget.onFavoriteToggle, // 🔁 Toggle via parent
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Icon(
                        widget.favoriteSelected ? Icons.favorite : Icons.favorite_border,
                        size: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // child: CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: 10,
                  //   child: Icon(
                  //     showFavoriteIcon && favoriteSelected
                  //         ? Icons.favorite  // Show favorite icon if both conditions are true
                  //         : Icons.favorite_border,  // Show favorite_border icon if the conditions are false
                  //     size: 14,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
