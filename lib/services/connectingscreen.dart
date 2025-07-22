// connecting_screen.dart
import 'package:flutter/material.dart';

import '../widgets/custom_date_time_bottom_sheet.dart';

class ConnectingScreen extends StatelessWidget {
  const ConnectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // match your card color
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 56, // Optional: standard height
        titleSpacing: 0,   // <-- THIS removes default left spacing
        leadingWidth: 0,   // <-- Prevents default space reserved for leading
        title: Row(
          children: [
            // Back icon tightly aligned to the edge
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
              onPressed: () {
                Navigator.pop(context);
              },
              padding: const EdgeInsets.only(left: 8), // control spacing manually
              splashRadius: 20,
              constraints: const BoxConstraints(), // Removes extra padding
            ),

            // Your search bar and trailing icons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 40,
                  child: _buildSearchBar(),
                ),
              ),
            ),

            // Trailing icons
            Row(
              children: [
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (context) => CustomDateTimeBottomSheet(
                        onConfirm: (DateTime fullDateTime) {
                          print("Selected DateTime: $fullDateTime");
                        },
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(Icons.calendar_today, size: 20, color: Color(0xFF004d40)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.access_time, size: 10, color: Color(0xFF004d40)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/images/cart.png', width: 24, height: 24),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),


      body: Padding(
     padding: const EdgeInsets.all(12.0),
     child: Column(

       children: [
        ClipRRect(
           borderRadius: BorderRadius.circular(30), // You can adjust the radius
           child: Image.asset(
             'assets/images/Connecting.png',
             width: 1800,
             height: 240,
             fit: BoxFit.contain,
           ),
         ),

         const SizedBox(height: 20),
       ],

     ),
   ),

      );

  }
  Widget _buildSearchBar() {
    return SizedBox(

      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );


  }
}
