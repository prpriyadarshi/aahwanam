import 'package:aahwanam/screens/account/detailed_all_booking_screen.dart';
import 'package:aahwanam/screens/account/detailed_inprogress_screen.dart';
import 'package:aahwanam/screens/dashboard/dashboard_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_state.dart';

import '../../services/decoration/decoration_theme.dart';
import '../../services/makeup_hair_service/MakeupDecor.dart';
import '../../widgets/package_card.dart';
import 'account_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _extractDecoratorName(String fullTitle) {
    final parts = fullTitle.split('by');
    if (parts.length > 1) {
      return parts[1].trim(); // Get the text after "by"
    }
    return fullTitle; // fallback if "by" is not found
  }

  // Track which button is selected
  bool isAllBookingsSelected = true; // Set default to All Bookings

  @override
  Widget build(BuildContext context) {
    // Responsive helpers
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        // 1. Show loading indicator while fetching data
        if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. Show booking info when data is loaded
        if (state is AccountLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text(
                "Bookings",
                style: TextStyle(
                  fontSize: isTablet ? 22 : 18,
                  color: const Color(0xFF575959),
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                padding: const EdgeInsets.only(top: 2, left: 12),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Color(0xFF575959),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountScreen()),
                  );
                },
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Toggle buttons: All Bookings / In Progress
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isAllBookingsSelected = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: isTablet ? 12 : 11,
                                ),
                                backgroundColor: isAllBookingsSelected
                                    ? const Color(0xFF1E535B)
                                    : Colors.white,
                                foregroundColor: isAllBookingsSelected
                                    ? Colors.white
                                    : const Color(0xFF1E535B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color: Color(0xFF1E535B), width: 1),
                                ),
                              ),
                              child: Text(
                                "All Bookings",
                                style: TextStyle(
                                  fontSize: isTablet ? 12 : 13,
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
                                  isAllBookingsSelected = false;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: isTablet ? 18 : 11,
                                ),
                                foregroundColor: isAllBookingsSelected
                                    ? const Color(0xFF1E535B)
                                    : Colors.white,
                                backgroundColor: isAllBookingsSelected
                                    ? Colors.transparent
                                    : const Color(0xFF1E535B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color: Color(0xFF1E535B), width: 1),
                                ),
                              ),
                              child: Text(
                                "In Progress",
                                style: TextStyle(
                                  fontSize: isTablet ? 12 : 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // ✅ List of Bookings (All / In Progress)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: isAllBookingsSelected
                            ? state.bookings.length
                            : state.inProgressBookings.length,
                        itemBuilder: (context, index) {
                          final package = isAllBookingsSelected
                              ? state.bookings[index]
                              : state.inProgressBookings[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: PackageCard(
                              title: package['title'],
                              description: package['description'],
                              price: package['price'],
                              details: package['details'],
                              imagePath: package['imagePath'],
                              rating: package['rating'],
                              imageType: PackageImageType.booking, // ✅ Booking usage
                              onTap: () {
                                if (isAllBookingsSelected) {
                                  // Navigate to All Bookings Details
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailedAllBookingScreen(package: package),
                                    ),
                                  );
                                } else {
                                  final title =
                                      package['title']?.toLowerCase() ?? '';
                                  if (title.contains('dream decor')) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DecorationTheme(
                                          decorator: {
                                            'name': _extractDecoratorName(
                                                package['title'] ?? ''),
                                            'image': package['imagePath'] ?? '',
                                            'rating': '4.5',
                                            'price': package['price'] ?? '',
                                          },
                                        ),
                                      ),
                                    );
                                  } else if (title.contains('blush makeover')) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MakeUpTheme(
                                          makeupHair: {
                                            'name': _extractDecoratorName(
                                                package['title'] ?? ''),
                                            'image': package['imagePath'] ?? '',
                                            'rating': '4.2',
                                            'price': package['price'] ?? '',
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        // 3. Handle unknown or error state
        return const Scaffold(
          body: Center(child: Text("Something went wrong.")),
        );
      },
    );
  }
}
