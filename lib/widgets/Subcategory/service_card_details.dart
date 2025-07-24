// package_details.dart

import 'package:aahwanam/models/subcategory_model.dart';
import 'package:flutter/material.dart';

// Import the new custom address widget

import '../custom_ChangeAddressSheet.dart';
import '../custom_event_date_time _picker.dart'; // ✨ IMPORTANT: Update this path to your actual project structure

class PackageDetails extends StatelessWidget {
  final EventDetails eventpackagedetails;

  const PackageDetails({
    Key? key,
    required this.eventpackagedetails, required Null Function() onChangeAddress,
    // Removed 'required Null Function() onChangeAddress,' as the address logic is now self-contained
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image Container
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 184 / 812,
                width: MediaQuery.of(context).size.width * 328 / 375,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFF4F4F4),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        eventpackagedetails.eventImage,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 118 / 812,
                        width: MediaQuery.of(context).size.width * 308 / 375,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 8 / 812),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ballon Decoration',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF575959),
                                ),
                              ),
                              Text(
                                eventpackagedetails.eventPrice,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0,
                                  color: Color(0xFF575959),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildQuantityCounter(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              eventpackagedetails.Description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Event Details',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 12),
            EventDateTimePicker(),
            const SizedBox(height: 16),
            const Text(
              'Event Address',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            // ✨ Use the new, self-contained CustomChangeAddressSheet widget here
            const CustomChangeAddressSheet(),
            const SizedBox(height: 16),
            const Text(
              'Previous Work',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Birthday Decor',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: Color(0xFF575959),
              ),
            ),
            const SizedBox(height: 8),
            _buildPreviousWorkList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // --- Helper methods for PackageDetails (no address-related pop-up methods here) ---

  Widget _buildQuantityCounter() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.remove, size: 20, color: Color(0xFF575959)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF575959),
              ),
            ),
          ),
          Icon(Icons.add, size: 20, color: Color(0xFF575959)),
        ],
      ),
    );
  }

  Widget _buildPreviousWorkList() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventpackagedetails.perviousWorkImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                eventpackagedetails.perviousWorkImages[index],
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}