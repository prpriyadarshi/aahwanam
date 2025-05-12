import 'package:aahwanam/widgets/custom_image_card_widget.dart';
import 'package:aahwanam/widgets/custom_package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/account/account_state.dart';

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
        final conceptsTabImages = state.conceptsTabImages;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
        children: [
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
                  ),
                  child: const Text("Services"),
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
                  ),
                  child: const Text("Concepts"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Expanded(
            child: packageItems.isEmpty
                ? const Center(child: Text("Your wishlist is empty"))
                : isAllSelected
                ? ListView.builder(
              itemCount: state.packages.length,
              itemBuilder: (context, index) {
                final package = state.packages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CustomPackageCard(
                    title: package['title'],
                    servicesIncluded: package['servicesIncluded'],
                    price: package['price'],
                    status: package['status'],
                  ),
                );
              },
            )
                : const Center(
              child: Text("No concepts available"),
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


