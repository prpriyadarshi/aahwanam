import 'package:aahwanam/screens/Packages/event_details_screen.dart';
import 'package:aahwanam/screens/account/detailed_packagecart_screen.dart';
import 'package:aahwanam/widgets/custom_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../routes/app_routes.dart';
import 'mypackage_details.dart';

class MyPackageCart extends StatefulWidget {
  const MyPackageCart({super.key});

  @override
  State<MyPackageCart> createState() => _MyPackageCartState();
}

class _MyPackageCartState extends State<MyPackageCart> {
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
          final cartdata = state.cartdata;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              title: Text(
                "Package Cart",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF575959),
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement share functionality
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: (cartdata.isEmpty)
                        ? const Center(child: Text("Your cart is empty"))
                        : ListView.builder(
                      itemCount: cartdata.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartdata[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomCartCard(
                            title: cartItem['title'],
                            description: cartItem['description'],
                            price: cartItem['price'],
                            imageUrl: cartItem['imageUrl'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailsScreen(
                                    serviceId: cartItem['id'],
                                    showIncludedPackages: true,
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
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.Subcategory,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black26),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Add Other Services",
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFF1E535B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailedPackageCartScreenadd(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E535B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Create Package",
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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