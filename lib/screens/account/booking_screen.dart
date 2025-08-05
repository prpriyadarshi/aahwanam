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
              title:  Text("Bookings",
                style: TextFontStyle.textFontStyle(
                  16,                         // Font size
                  Color(0xFF575959),          // Text color
                  FontWeight.w500,            // Font weight
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
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
              ),
            ),

            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            backgroundColor: isAllBookingsSelected
                                ? Color(0xFF1E535B) // Highlight color
                                : Colors.white,
                            // Default background color
                            foregroundColor: isAllBookingsSelected
                                ? Colors.white // Text color when selected
                                : Color(0xFF1E535B),
                            // Text color when not selected
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Color(0xFF1E535B), width: 1),
                            ),
                          ),
                          child: const Text("All Bookings"),
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
                            foregroundColor: isAllBookingsSelected
                                ? Color(
                                    0xFF1E535B) // Text color when not selected
                                : Colors.white,
                            // Text color when selected
                            backgroundColor: isAllBookingsSelected
                                ? Colors.transparent // Default background
                                : Color(0xFF1E535B),
                            // Highlight color when selected
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Color(0xFF1E535B), width: 1),
                            ),
                          ),
                          child: const Text("In Progress"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
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
                          padding: const EdgeInsets.only(bottom: 8.0),
                          // Adjust spacing between cards
                          child: PackageCard(
                            title: package['title'],
                            description: package['description'],
                            price: package['price'],
                            details: package['details'],
                            imagePath: package['imagePath'],
                            rating: package['rating'],
                            onTap: () {
                              if (isAllBookingsSelected) {
                                // Navigate to All Bookings Details Page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailedAllBookingScreen(
                                            package: package),
                                  ),
                                );
                              } else {
                                final title =
                                    package['title']?.toLowerCase() ?? '';
                                if (title.contains('dream decor')) {
                                  // Pass necessary data to DecorationTheme screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DecorationTheme(
                                        decorator: {
                                          'name': _extractDecoratorName(
                                              package['title'] ?? ''),
                                          'image': package['imagePath'] ?? '',
                                          'rating': '4.5',
                                          // Provide default or real rating
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
                                          // Or dynamic if available
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
                  ),
                ],
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
