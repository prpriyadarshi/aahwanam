import 'package:aahwanam/screens/account/detailed_deliveredmy_packages.dart';
import 'package:aahwanam/widgets/custom_image_card_widget.dart';
import 'package:aahwanam/widgets/custom_package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';
import '../../widgets/custom_cart_card.dart';

class MyPackagesScreen extends StatefulWidget {
  const MyPackagesScreen({super.key});


  @override
  State<MyPackagesScreen> createState() => _MyPackagesScreen();
}

class _MyPackagesScreen extends State<MyPackagesScreen> {
  bool isAllSelected = true; // Toggle state

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
        final packageItems = state.packages;
        final cartdata = state.cartdata;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Packages"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAllSelected = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAllSelected ? const Color(0xFF1E535B) : Colors.white,
                      foregroundColor: isAllSelected ? Colors.white : const Color(0xFF1E535B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF1E535B), width: 1),
                      ),
                    ),
                    child: const Text("Booked Packages"),
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
                      backgroundColor: isAllSelected ? Colors.transparent : const Color(0xFF1E535B),
                      foregroundColor: isAllSelected ? const Color(0xFF1E535B) : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF1E535B), width: 1),
                      ),
                    ),
                    child: const Text("Cart"),
                  ),
                ),
              ],
            ),
          ),

          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isAllSelected
                  ? (packageItems.isEmpty
                  ? const Center(child: Text("Your wishlist is empty"))
                  : ListView.builder(
                itemCount: packageItems.length,
                itemBuilder: (context, index) {
                  final package = packageItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomPackageCard(
                      title: package['title'],
                      servicesIncluded: package['servicesIncluded'],
                      price: package['price'],
                      status: package['status'],
                      onTap: () {
                        print("Tapped: ${package['title']}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedDeliveredmyPackagesScreen(package: package),
                          ),
                        );
                      },
                    ),
                  );
                },
              ))
                  : (cartdata.isEmpty
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
                    ),
                  );
                },
              )),
            ),
          ),

          // Footer Buttons (Cart only)
          if (!isAllSelected)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // decoration: const BoxDecoration(
              //   color: Colors.white,
              //   boxShadow: [
              //     BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2)),
              //   ],
              // ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add other services logic
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
                      child: const Text("Add Other Services"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Create package logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E535B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Create Package"),
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


