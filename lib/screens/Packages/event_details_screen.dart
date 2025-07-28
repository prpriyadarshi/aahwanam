// Updated EventDetailsScreen with dynamic service loading

import 'package:aahwanam/blocs/Subcategory/subcategory%20event.dart';
import 'package:aahwanam/blocs/Subcategory/subcategory%20state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Subcategory/subcategory bloc.dart';
import '../../widgets/Subcategory/service_card_details.dart';
import '../../widgets/custom_top_bar.dart';

class EventDetailsScreen extends StatelessWidget {
  final String serviceId; // Add serviceId parameter
  final bool showIncludedPackages;

  const EventDetailsScreen({
    super.key,
    required this.serviceId, // Make serviceId required
    this.showIncludedPackages = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Load specific event details based on serviceId
      create: (context) => SubcategoryBloc()..add(LoadEventDetails(serviceId)),
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
            // Check if eventDetails list is not empty
            if (state.eventDetails.isNotEmpty) {
              final eventPackageDetails = state.eventDetails.first;
              return PackageDetails(
                eventpackagedetails: eventPackageDetails,
                showIncludedPackages: showIncludedPackages,
              );
            } else {
              // Handle the case where data is not yet loaded or is empty
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
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
                    Navigator.pop(context);
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