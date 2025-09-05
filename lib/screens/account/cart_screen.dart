import 'package:aahwanam/widgets/booking_bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/package_card.dart'; // Import your PackageCard

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              title: Text("Cart",
                style: TextFontStyle.textFontStyle(
                  16,                         // Font size
                  Color(0xFF575959),          // Text color
                  FontWeight.w500,            // Font weight
                ),),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                padding: const EdgeInsets.only(top: 2, left: 12),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Color(0xFF575959),
                ),
                onPressed: () {
                  Navigator.pop(context); // ✅ Go back to previous screen
                  // Or use push to go to a specific screen:
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement share functionality if needed
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: ListView.builder(
                itemCount: state.addToCart.length,
                itemBuilder: (context, index) {
                  final booking = state.addToCart[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: PackageCard(
                      title: booking['title'],
                      description: booking['description'],
                      price: booking['price'],
                      imagePath: booking['imagePath'],
                      rating: booking['rating'],
                      primaryButtonText: "Book Now",
                      onPrimaryButtonPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return BookingBottomSheet(
                              booking: booking, // You can pass more data if needed
                            );
                          },
                        );
                      },
                      secondaryButtonText: "Move to Wishlist",
                      onSecondaryButtonPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "${booking['title']} moved to Wishlist")),
                        );
                      },
                    ),
                  );
                },
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
