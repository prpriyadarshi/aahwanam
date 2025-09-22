import 'package:aahwanam/widgets/booking_bottom_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../widgets/custom_image_card_widget.dart';
import '../../widgets/package_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isAllSelected = true;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final shortestSide = screen.shortestSide;
    final isTablet = shortestSide > 600;

    // Scaling function based on screen width (reference width 390)
    double scale(double size) => size * (screen.width / 390);

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AccountLoaded) {
          final wishlistItems = state.wishlist;
          final conceptsTabImages = state.conceptsTabImages;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              title: Text(
                "Wishlist",
                style: TextFontStyle.textFontStyle(
                  isTablet ? 22 : scale(16),
                  const Color(0xFF575959),
                  FontWeight.w600,
                ),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                padding: EdgeInsets.only(left: scale(8)),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: scale(18),
                  color: const Color(0xFF575959),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: scale(12),
                    left: scale(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.share_outlined,
                      size: scale(24),
                      color: const Color(0xFF1E535B),
                    ),
                    onPressed: () {
                      // Implement share functionality
                    },
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 30 : scale(14),
                vertical: isTablet ? 20 : scale(10),
              ),
              child: Column(
                children: [
                  // Toggle Buttons Row
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => setState(() => isAllSelected = true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isAllSelected
                                ? const Color(0xFF1E535B)
                                : Colors.white,
                            foregroundColor: isAllSelected
                                ? Colors.white
                                : const Color(0xFF1E535B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale(12)),
                              side: const BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: isTablet ? 16 : scale(10),
                            ),
                          ),
                          child: Text(
                            "Services",
                            style: TextFontStyle.textFontStyle(
                              isTablet ? 16 : scale(14),
                              isAllSelected ? Colors.white : const Color(0xFF1E535B),
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: scale(8)),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => setState(() => isAllSelected = false),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isAllSelected
                                ? Colors.transparent
                                : const Color(0xFF1E535B),
                            foregroundColor: isAllSelected
                                ? const Color(0xFF1E535B)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(scale(12)),
                              side: const BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: isTablet ? 16 : scale(10),
                            ),
                          ),
                          child: Text(
                            "Concepts",
                            style: TextFontStyle.textFontStyle(
                              isTablet ? 16 : scale(14),
                              isAllSelected ? const Color(0xFF1E535B) : Colors.white,
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isTablet ? 20 : scale(12)),

                  // Cards List
                  Expanded(
                    child: isAllSelected
                        ? (wishlistItems.isEmpty
                        ? Center(
                      child: Text(
                        "Your wishlist is empty",
                        style: TextFontStyle.textFontStyle(
                          isTablet ? 18 : scale(14),
                          Colors.black,
                          FontWeight.w400,
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        final item = wishlistItems[index];
                        return Padding(
                          padding:
                          EdgeInsets.only(bottom: isTablet ? 20 : scale(12)),
                          child: PackageCard(
                            title: item['title'],
                            description: item['description'],
                            price: item['price'],
                            imagePath: item['imagePath'],
                            rating: item['rating'],
                            showLikeIcon: true,
                            imageType: PackageImageType.wishlist,
                            primaryButtonText: "Move to Cart",
                            onPrimaryButtonPressed: () {},
                            // Add these properties to control button sizes
                            primaryButtonWidth: 145, // Set width for primary button
                            primaryButtonHeight: 29, // Set height for primary button
                            secondaryButtonText: "Remove",
                            onSecondaryButtonPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${item['title']} removed from Wishlist",
                                  ),
                                ),
                              );
                            },
                            // Add these properties to control button sizes
                            secondaryButtonWidth: 75, // Set width for secondary button
                            secondaryButtonHeight: 29, // Set height for secondary button
                          ),
                        );
                      },
                    ))
                        : (conceptsTabImages.isEmpty
                        ? Center(
                      child: Text(
                        "No concepts available",
                        style: TextFontStyle.textFontStyle(
                          isTablet ? 18 : scale(14),
                          Colors.black,
                          FontWeight.w400,
                        ),
                      ),
                    )
                        : GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: conceptsTabImages.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2,
                        mainAxisSpacing: isTablet ? 16 : scale(10),
                        crossAxisSpacing: isTablet ? 16 : scale(10),
                        childAspectRatio: isTablet
                            ? 1.3
                            : (screen.height > 800 ? 1.1 : 1),
                      ),
                      itemBuilder: (context, index) {
                        final item = conceptsTabImages[index];
                        return CustomImageCard(
                          imageUrl: item['imagePath'],
                          width: (screen.width -
                              (isTablet ? 64 : scale(28))) /
                              (isTablet ? 3 : 2),
                          height: isTablet ? 180 : scale(146),
                          isAsset: true,
                          favoriteSelected: item['isLiked'],
                          onFavoriteToggle: () {
                            setState(() {
                              item['isLiked'] = !item['isLiked'];
                            });
                          },
                        );
                      },
                    )),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
