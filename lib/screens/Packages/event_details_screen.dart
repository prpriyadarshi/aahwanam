import 'package:aahwanam/blocs/Subcategory/subcategory%20event.dart';
import 'package:aahwanam/blocs/Subcategory/subcategory%20state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Subcategory/subcategory bloc.dart';
import '../../widgets/Subcategory/service_card_details.dart';
import '../../widgets/custom_top_bar.dart';

class EventDetailsScreen extends StatefulWidget {
  final String serviceId;
  final bool showIncludedPackages;

  const EventDetailsScreen({
    Key? key,
    required this.serviceId,
    this.showIncludedPackages = false,
  }) : super(key: key);

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late int _currentQuantity;

  @override
  void initState() {
    super.initState();
    // Initialize the quantity.
    // If you're coming from EventServiceCard and want to reflect its count,
    // you'd need to pass the initial quantity here via widget.
    // For now, it defaults to 1.
    _currentQuantity = 1;
  }

  void _updatePackageQuantity(int newQuantity) {
    setState(() {
      _currentQuantity = newQuantity;
      // Ensure quantity doesn't go below zero if not navigating back immediately
      if (_currentQuantity < 0) {
        _currentQuantity = 0;
      }
    });

    // ✨ NEW LOGIC: If quantity becomes 0, navigate back
    if (_currentQuantity == 0) {
      print('Quantity reached 0, navigating back to previous screen.');
      Navigator.pop(context);
    }
    print('PackageDetails quantity updated to: $_currentQuantity');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubcategoryBloc()..add(LoadEventDetails(widget.serviceId)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomTopBar(
          onBack: () => Navigator.pop(context),
          onSearchChanged: (value) {
            print("Search typed: $value");
          },
          onCalendarTap: () {
            print("Calendar tapped");
          },
          onCartTap: () {
            print("Cart tapped");
          },
          onFavoriteTap: () {
            print("Favorite tapped");
          },
        ),
        body: BlocBuilder<SubcategoryBloc, SubcategoryState>(
          builder: (context, state) {
            if (state.eventDetails.isNotEmpty) {
              final eventPackageDetails = state.eventDetails.first;
              return PackageDetails(
                eventpackagedetails: eventPackageDetails,
                showIncludedPackages: widget.showIncludedPackages,
                quantity: _currentQuantity, // Pass the state quantity
                onQuantityChanged: _updatePackageQuantity, // Pass the update callback
              );
            } else if (state.status == SubcategoryStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == SubcategoryStatus.failure) {
              return const Center(
                child: Text('Failed to load event details. Please try again.'),
              );
            } else {
              return const Center(child: Text('No event details found.'));
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    print('Checking out with quantity: $_currentQuantity');
                    // Add your checkout logic here
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF233B32),
                    side: const BorderSide(color: Color(0xFF233B32)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Check Out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print('Adding other services. Current quantity: $_currentQuantity');
                    Navigator.pop(context); // Or navigate to a service selection screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF233B32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Add other services',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}