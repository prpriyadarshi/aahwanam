import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

/// 🛒 Cart Image Widget
class CartImage extends StatelessWidget {
  final String imagePath;
  const CartImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        imagePath,
        height: 125,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// 📅 Booking Image Widget
class BookingImage extends StatelessWidget {
  final String imagePath;
  const BookingImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        imagePath,
        height: 110,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// ❤️ Wishlist Image Widget
class WishlistImage extends StatelessWidget {
  final String imagePath;
  const WishlistImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        imagePath,
        height: 125,
        width: 85,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// Enum to select which image widget to use
enum PackageImageType { cart, booking, wishlist }

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
  final bool isWishlist;
  final VoidCallback? onTap;

  final PackageImageType imageType;

  // NEW: Button size properties
  final double? primaryButtonWidth;
  final double? primaryButtonHeight;
  final double? secondaryButtonWidth;
  final double? secondaryButtonHeight;

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
    this.isWishlist = false,
    this.showLikeIcon = false,
    this.onTap,
    this.imageType = PackageImageType.cart,
    // NEW: Button size parameters with defaults
    this.primaryButtonWidth,
    this.primaryButtonHeight,
    this.secondaryButtonWidth,
    this.secondaryButtonHeight,
  }) : super(key: key);

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool isLiked = true;

  /// Chooses which image widget to render
  Widget _buildImage() {
    switch (widget.imageType) {
      case PackageImageType.cart:
        return CartImage(imagePath: widget.imagePath);
      case PackageImageType.booking:
        return BookingImage(imagePath: widget.imagePath);
      case PackageImageType.wishlist:
        return WishlistImage(imagePath: widget.imagePath);
    }
  }

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image + like icon
              Stack(
                children: [
                  _buildImage(),
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
                          child: Icon(
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
                    // Title + Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextFontStyle.textFontStyle(
                                14, const Color(0xFF575959), FontWeight.w500),
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
                                style: TextFontStyle.textFontStyle(
                                    12, const Color(0xFF575959), FontWeight.w400),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // Description
                    Text(
                      widget.description,
                      style: TextFontStyle.textFontStyle(
                          13, const Color(0xFF757575), FontWeight.w400),
                    ),
                    const SizedBox(height: 4),

                    // Price
                    Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee,
                          size: 14,
                          color: Color(0xFF1E535B),
                        ),
                        Text(
                          widget.price,
                          style: TextFontStyle.textFontStyle(
                              12, const Color(0xFF1E535B), FontWeight.w600),
                        ),
                      ],
                    ),

                    if (widget.details != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        widget.details!,
                        style: TextFontStyle.textFontStyle(
                            13, const Color(0xFF575959), FontWeight.w600),
                      ),
                    ],

                    // ... existing code ...

// Buttons
                    if (widget.primaryButtonText != null ||
                        widget.secondaryButtonText != null) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (widget.secondaryButtonText != null)
                            SizedBox(
                              width: widget.secondaryButtonWidth ?? 120, // Use custom width or default
                              height: widget.secondaryButtonHeight ?? 29, // Use custom height or default
                              child: OutlinedButton(
                                onPressed: widget.onSecondaryButtonPressed,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFFDFC),
                                  side: const BorderSide(
                                    color: Color(0xFF1E535B),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  widget.secondaryButtonText!,
                                  style: TextFontStyle.textFontStyle(
                                      12, const Color(0xFF1E535B), FontWeight.w500),
                                ),
                              ),
                            ),
                          if (widget.secondaryButtonText != null &&
                              widget.primaryButtonText != null)
                            const SizedBox(width: 8),
                          if (widget.primaryButtonText != null)
                            SizedBox(
                              width: widget.primaryButtonWidth ?? 90, // Use custom width or default
                              height: widget.primaryButtonHeight ?? 29, // Use custom height or default
                              child: ElevatedButton(
                                onPressed: widget.onPrimaryButtonPressed,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E535B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  widget.primaryButtonText ?? "",
                                  style: TextFontStyle.textFontStyle(
                                      12, Colors.white, FontWeight.w500),
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
