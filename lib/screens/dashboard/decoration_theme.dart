import 'package:flutter/material.dart';

import '../../widgets/custom_date_time_bottom_sheet.dart';

class DecorationTheme extends StatefulWidget {
  final List<Map<String, String>> decorators;
  final Map<String, String>? selectedDecorator;

  const DecorationTheme({
    super.key,
    required this.decorators,
    this.selectedDecorator,
    required Function(Map<String, String>) onCardTap,
  });


  @override
  State<DecorationTheme> createState() => _DecorationThemeState();
}

class _DecorationThemeState extends State<DecorationTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildSearchBar()),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24)),
                      ),
                      builder: (context) =>
                          CustomDateTimeBottomSheet(
                            onConfirm: (DateTime fullDateTime) {
                              print("Selected DateTime: $fullDateTime");
                            },
                          ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.calendar_today, size: 24,
                          color: Color(0xFF004d40)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.access_time, size: 10,
                            color: Color(0xFF004d40)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
Widget _buildSearchBar() {
  return TextField(
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
  );
}