import 'package:flutter/material.dart';

class PackageCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String? details;
  final String imagePath;
  final double? rating;
  final bool showLikeIcon;

  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onTap;


  const PackageCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    this.details,
    required this.imagePath,
    this.rating,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.showLikeIcon = false,
    this.onTap,
  }) : super(key: key);
  @override
  State<PackageCard> createState() => _PackageCardState();
}
class _PackageCardState extends State<PackageCard> {
  bool isLiked = true;

@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(6),
      child: Card(
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
                      widget.imagePath,
                      height: 130,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.showLikeIcon)
                    Positioned(
                      top: 4,
                      right: 4,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(2),
                        child:  Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 16,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
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
                            widget.title,
                            style: const TextStyle(
                              fontFamily: 'Poppins', // Font family
                              fontSize: 14, // Size in px (Flutter uses logical pixels)
                              fontWeight: FontWeight.w500, // Equivalent to weight 500 (Medium)
                              // height: 1.0, // Line height = 100% (1.0 means 100%)
                              letterSpacing: 0.0, // 0% letter spacing
                              color: Color(0xFF575959), // Text color
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.rating != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFEFAA37),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF575959),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Description
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontFamily: 'Poppins',      // Font family
                        fontSize: 14,              // Size in px (Flutter uses logical pixels)
                        fontWeight: FontWeight.w400, // Equivalent to weight 500 (Medium)
                        // height: 1.0,               // Line height = 100% (1.0 means 100%)
                        letterSpacing: 0.0,        // 0% letter spacing
                        color: Color(0xFF757575),  // Text color
                      ),
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
                          widget.price,
                          style: const TextStyle(
                            fontFamily: 'Poppins',      // Font family
                            fontSize: 12,              // Size in px (Flutter uses logical pixels)
                            fontWeight: FontWeight.w600, // Equivalent to weight 500 (Medium)
                            // height: 1.0,               // Line height = 100% (1.0 means 100%)
                            letterSpacing: 0.0,        // 0% letter spacing
                            color: Color(0xFF1E535B),  // Text color
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (widget.details != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.details!,
                        style: const  TextStyle(
                          fontFamily: 'Poppins',
                          // Font family
                          fontSize: 12,              // Size in px (Flutter uses logical pixels)
                          fontWeight: FontWeight.w500, // Equivalent to weight 500 (Medium)
                          // height: 1.0,               // Line height = 100% (1.0 means 100%)
                          letterSpacing: 0.0,        // 0% letter spacing
                          color: Color(0xFF575959),  // Text color
                        ),
                      ),
                    ],

                    // Now the buttons immediately after text!
                    if (widget.primaryButtonText != null || widget.secondaryButtonText != null) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (widget.secondaryButtonText != null)
                            SizedBox(
                              width: 122,
                              height: 29,
                              child: OutlinedButton(
                                onPressed: widget.onSecondaryButtonPressed,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFFDFC), // ✅ correct bg color
                                  side: const BorderSide(
                                    color: Color(0xFF1E535B),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  padding: EdgeInsets.zero, // ✅ remove default padding
                                ),
                                child: Text(
                                  widget.secondaryButtonText!,
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF1E535B),
                                  ),
                                ),
                              ),
                            ),

                          if (widget.secondaryButtonText != null && widget.primaryButtonText != null)
                            const SizedBox(width: 8),

                          if (widget.primaryButtonText != null)
                            SizedBox(
                              width: 74,
                              height: 29,
                              child: ElevatedButton(
                                onPressed: widget.onPrimaryButtonPressed,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E535B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }

}
