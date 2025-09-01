import 'package:flutter/material.dart';
import '../custom_text_field.dart';
import 'customAddbutton.dart';

class EventServiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String? description;
  final bool isListLayout;
  final int count;
  final ValueChanged<String>? onAddTap;
  final ValueChanged<int>? onCountChanged;
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
    const Color commonTealColor = Color(0xFF1E535B);

    final Widget countWidget = CustomAddButton(
      count: count,
      onAddPressed: () {
        onAddTap?.call(uniqueKey);
      },
      onCountChanged: (newCount) {
        onCountChanged?.call(newCount);
      },
    );

    if (isListLayout) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEFDF),
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
                    style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w500),
                  ),
                  if (description != null && description!.isNotEmpty)
                    Text(
                      description!,
                      style: TextFontStyle.textFontStyle(13, const Color(0xFF575959), FontWeight.w400),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextFontStyle.textFontStyle(15, commonTealColor, FontWeight.w500),
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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
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
            Flexible(
              child: Text(
                title,
                style: TextFontStyle.textFontStyle(13, const Color(0xFF575959), FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Flexible(
              child: Text(
                price,
                style: TextFontStyle.textFontStyle(13, commonTealColor, FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }
  }
}