import 'package:aahwanam/widgets/booking_bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/package_card.dart'; // Import your PackageCard

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // ✅ Responsive text size based on screen width
  double _getResponsiveFontSize(double screenWidth, double baseSize) {
    if (screenWidth < 360) {
      return baseSize * 0.85; // Small devices
    } else if (screenWidth > 600) {
      return baseSize * 1.2; // Tablets
    }
    return baseSize; // Normal phones
  }

  // ✅ Responsive padding
  EdgeInsets _getResponsivePadding(double screenWidth) {
    if (screenWidth > 600) {
      return const EdgeInsets.fromLTRB(28, 0, 28, 28); // Tablet
    }
    return const EdgeInsets.fromLTRB(18, 0, 18, 18); // Phones
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AccountLoaded) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;

              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  titleSpacing: 0,
                  title: Text(
                    "Cart",
                    style: TextFontStyle.textFontStyle(
                      _getResponsiveFontSize(screenWidth, 16),
                      const Color(0xFF575959),
                      FontWeight.w500,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  leading: IconButton(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.005,
                      left: screenWidth * 0.03,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: screenWidth * 0.045, // Responsive icon size
                      color: const Color(0xFF575959),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: screenWidth * 0.01, // Adjust right spacing
                        left: screenWidth * 0.02, // Adjust left spacing
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.share_outlined,
                          size: screenWidth * 0.06,
                          color: Color(0xFF1E535B), // ✅ Set custom color
                        ),
                        onPressed: () {
                          // Implement share functionality
                        },
                      ),
                    )
                  ],
                ),
                body: SafeArea(
                  child: Padding(
                    padding: _getResponsivePadding(screenWidth),
                    child: ListView.builder(
                      itemCount: state.addToCart.length,
                      itemBuilder: (context, index) {
                        final booking = state.addToCart[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: screenHeight * 0.015,
                          ), // Responsive spacing
                          child: PackageCard(
                            title: booking['title'],
                            description: booking['description'],
                            price: booking['price'],
                            imagePath: booking['imagePath'],
                            rating: booking['rating'],
                            imageType: PackageImageType
                                .cart, // ✅ Force Cart Image style
                            primaryButtonText: "Book Now",
                            onPrimaryButtonPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) {
                                  return BookingBottomSheet(
                                    booking: booking,
                                  );
                                },
                              );
                            },
                            secondaryButtonText: "Move to Wishlist",
                            onSecondaryButtonPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${booking['title']} moved to Wishlist",
                                    style: TextStyle(
                                      fontSize: _getResponsiveFontSize(
                                        screenWidth,
                                        14,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const Scaffold(
          body: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
