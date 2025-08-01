import 'package:aahwanam/widgets/booking_bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
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
            appBar: AppBar(
              title: const Text("Cart"),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
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
              padding: const EdgeInsets.all(16.0),
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
                      }, details: '',
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
