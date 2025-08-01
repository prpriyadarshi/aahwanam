import 'package:flutter/material.dart';
import '../custom_text_field.dart'; // Ensure this import is correct

class EventServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String? description;
  final bool isListLayout;
  final int count;
  final ValueChanged<int>? onCountChanged;
  final VoidCallback? onAddTap;
  final String uniqueKey;

  const EventServiceCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.description,
    this.isListLayout = false,
    this.count = 0,
    this.onCountChanged,
    this.onAddTap,
    required this.uniqueKey,
  });

  @override
  Widget build(BuildContext context) {
    final Widget countWidget = count == 0
        ? GestureDetector(
      onTap: () {
        onCountChanged?.call(1);
        onAddTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          "Add",
          style: TextFontStyle.textFontStyle(
              12, const Color(0xFF1E535B), FontWeight.w500),
        ),
      ),
    )
        : Container(
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 20, color: Colors.white),
            onPressed: () => onCountChanged?.call(count - 1),
            splashRadius: 20,
          ),
          Text(
            '$count',
            style: TextFontStyle.textFontStyle(
                18, Colors.white, FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 20, color: Colors.white),
            onPressed: () => onCountChanged?.call(count + 1),
            splashRadius: 20,
          ),
        ],
      ),
    );

    if (isListLayout) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.textFontStyle(
                        16, const Color(0xFF575959), FontWeight.bold),
                  ),
                  if (description != null && description!.isNotEmpty)
                    Text(
                      description!,
                      style: TextFontStyle.textFontStyle(
                          13, Colors.grey[600]!, FontWeight.w400),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextFontStyle.textFontStyle(
                            15, Colors.teal, FontWeight.bold),
                      ),
                      countWidget,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: countWidget,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextFontStyle.textFontStyle(
                13, const Color(0xFF575959), FontWeight.w600),
          ),
          Text(
            price,
            style: TextFontStyle.textFontStyle(
                13, Colors.teal, FontWeight.w600),
          ),
        ],
      );
    }
  }
}
