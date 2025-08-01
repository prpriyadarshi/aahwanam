import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String details;
  final String imagePath;
  final double? rating;
  final bool showLikeIcon;

  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;


  const PackageCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.details,
    required this.imagePath,
    this.rating,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.showLikeIcon = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 0,
      color: const Color(0xFFFFEFDF),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row( // <-- Changed: Top Row only (Image + Details + Buttons)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    imagePath,
                    height: 130,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                if (showLikeIcon)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.favorite,
                        size: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // Text + Buttons Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style:
                          TextFontStyle.textFontStyle( 14, Color(0xFF575959),FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (rating != null)
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFEFAA37),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style:
                                TextFontStyle.textFontStyle( 12, Color(0xFF575959),FontWeight.w500)
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Text(
                    description,
                    style:
                      TextFontStyle.textFontStyle( 14, Color(0xFF575959),FontWeight.w400)
                  ),
                  const SizedBox(height: 8),
                  // Price and Details
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 14,
                        color: Color(0xFF1E535B),
                      ),
                      Text(
                        price,
                        style:
                          TextFontStyle.textFontStyle( 12, Color(0xFF575959),FontWeight.w600)
                      ),

                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    details,
                    style:
                      TextFontStyle.textFontStyle( 12, Color(0xFF575959),FontWeight.w400)
                  ),

                  // Now the buttons immediately after text!
                  if (primaryButtonText != null || secondaryButtonText != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (secondaryButtonText != null)
                          SizedBox(
                            height: 29,
                            child: OutlinedButton(
                              onPressed: onSecondaryButtonPressed,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFF1E535B),
                                  width: 1, // Border width
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF1E535B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9), // Border radius
                                ),
                                padding: EdgeInsets.all(8),
                                // Ensure text fits properly without extra padding
                              ),
                              child: Text(
                                secondaryButtonText!,
                                style: TextFontStyle.textFontStyle( 12, Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        if (secondaryButtonText != null && primaryButtonText != null)
                          const SizedBox(width: 8),
                        if (primaryButtonText != null)
                          SizedBox(

                            height: 29,
                            child: ElevatedButton(
                              onPressed: onPrimaryButtonPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E535B),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9), // Border radius 9px
                                  side: const BorderSide(
                                    color: Color(0xFF1E535B), // Border color
                                    width: 1,                // Border width 1px
                                  ),
                                ),
                                padding: EdgeInsets.all(8),
                                // Remove default padding
                              ),
                              child: Text(
                                primaryButtonText!,
                                style: TextFontStyle.textFontStyle( 12, Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
