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
    // Define common properties for both states (Add/Increment-Decrement)
    const double commonHorizontalPadding = 10; // Padding for 'Add' button text
    const double commonVerticalPadding = 4; // Padding for 'Add' button text
    final BorderRadius commonBorderRadius = BorderRadius.circular(6);
    final Color commonTealColor = Color(0xFF1E535B); // The specific teal color from the image

    final Widget countWidget = count == 0
        ? GestureDetector(
      onTap: () {
        onCountChanged?.call(1);
        onAddTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: commonHorizontalPadding,
            vertical: commonVerticalPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF1E535B),width: 1.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          "Add",
          style: TextFontStyle.textFontStyle(
              10, Color(0xFF1E535B), FontWeight.w500),
        ),
      ),
    )
        : Container(
      // This container will be the same size and shape as the "Add" button
      decoration: BoxDecoration(
        color:  Color(0xFF1E535B),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color:  Color(0xFF1E535B),width: 1),
      ),
      // The padding here is to control the overall size of the teal container
      // and must be carefully balanced with the content inside.
      // Let's rely on the content's sizing and min-width/height.
      child: Row(
        mainAxisSize: MainAxisSize.min, // Essential to constrain width
        children: [
          // Remove button
          SizedBox(
            width: 24, // Fixed width for the button area
            height: 24, // Fixed height for the button area
            child: IconButton(
              icon: const Icon(Icons.remove, size: 12, color: Colors.white), // Reduced icon size
              onPressed: () => onCountChanged?.call(count - 1),
              splashRadius: 12,
              padding: EdgeInsets.zero, // Remove all internal padding
              constraints: const BoxConstraints(), // Remove default constraints
            ),
          ),
          Text(
            '$count',
            style: TextFontStyle.textFontStyle(
                10, Colors.white, FontWeight.w500), // Reduced font size to fit
          ),
          // Add button
          SizedBox(
            width: 24, // Fixed width for the button area
            height: 24, // Fixed height for the button area
            child: IconButton(
              icon: const Icon(Icons.add, size: 12, color: Colors.white), // Reduced icon size
              onPressed: () => onCountChanged?.call(count + 1),
              splashRadius: 14,
              padding: EdgeInsets.zero, // Remove all internal padding
              constraints: const BoxConstraints(), // Remove default constraints
            ),
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
                            15, commonTealColor, FontWeight.bold),
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
                13, commonTealColor, FontWeight.w600),
          ),
        ],
      );
    }
  }
}