import 'package:aahwanam/widgets/booking_bottom_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../widgets/custom_image_card_widget.dart';
import '../../widgets/package_card.dart'; // Your custom card

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isAllSelected = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600; // Tablet/iPad check

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
                  isTablet ? 20 : 16, // Responsive font size
                  const Color(0xFF575959),
                  FontWeight.w600,
                ),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                padding: EdgeInsets.only(
                  top: 2,
                  left: isTablet ? 20 : 12,
                ),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Color(0xFF575959),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share functionality if needed
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                isTablet ? 30 : 18,
                0,
                isTablet ? 30 : 18,
                isTablet ? 30 : 18,
              ),
              child: Column(
                children: [
                  // Toggle Buttons Row
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isAllSelected = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isAllSelected
                                ? const Color(0xFF1E535B)
                                : Colors.white,
                            foregroundColor: isAllSelected
                                ? Colors.white
                                : const Color(0xFF1E535B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: isTablet ? 16 : 10,
                            ),
                          ),
                          child: Text(
                            "Services",
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isAllSelected = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isAllSelected
                                ? Colors.transparent
                                : const Color(0xFF1E535B),
                            foregroundColor: isAllSelected
                                ? const Color(0xFF1E535B)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: isTablet ? 16 : 10,
                            ),
                          ),
                          child: Text(
                            "Concepts",
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isTablet ? 20 : 10),

                  // Cards List
                  Expanded(
                    child: wishlistItems.isEmpty
                        ? const Center(child: Text("Your wishlist is empty"))
                        : isAllSelected
                    // For "Services"
                        ? ListView.builder(
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) {
                        final item = wishlistItems[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: isTablet ? 20 : 12,
                          ),
                          child: PackageCard(
                            title: item['title'],
                            description: item['description'],
                            price: item['price'],
                            imagePath: item['imagePath'],
                            rating: item['rating'],
                            showLikeIcon: true,
                            primaryButtonText: "Book Now",
                            onPrimaryButtonPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                builder: (context) {
                                  return BookingBottomSheet(
                                    booking: item,
                                  );
                                },
                              );
                            },
                            secondaryButtonText: "Remove",
                            onSecondaryButtonPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${item['title']} removed from Wishlist",
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                    // For "Concepts"
                        : GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: conceptsTabImages.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2, // ✅ Tablet support
                        mainAxisSpacing: isTablet ? 16 : 8,
                        crossAxisSpacing: isTablet ? 16 : 8,
                        childAspectRatio: isTablet ? 1.3 : 1.2,
                      ),
                      itemBuilder: (context, index) {
                        final item = conceptsTabImages[index];
                        return CustomImageCard(
                          imageUrl: item['imagePath'],
                          width: screenWidth / (isTablet ? 3 : 2),
                          height: isTablet ? 180 : 146,
                          isAsset: true,
                          favoriteSelected: item['isLiked'],
                          onFavoriteToggle: () {
                            setState(() {
                              item['isLiked'] = !item['isLiked'];
                            });
                          },
                        );
                      },
                    ),
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
