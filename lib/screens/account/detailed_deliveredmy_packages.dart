import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/account/RateServiceScreen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/package_card.dart';

class DetailedDeliveredmyPackagesScreen extends StatefulWidget {
  final Map<String, dynamic> package;

  const DetailedDeliveredmyPackagesScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  State<DetailedDeliveredmyPackagesScreen> createState() =>
      _DetailedDeliveredmyPackagesScreen();
}

class _DetailedDeliveredmyPackagesScreen
    extends State<DetailedDeliveredmyPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("My Packages",
          style: TextFontStyle.textFontStyle(
            16,                         // Font size
            Color(0xFF575959),          // Text color
            FontWeight.w500,            // Font weight
          ),),
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
            Navigator.pop(context); // ✅ Go back to previous screen
            // Or use push to go to a specific screen:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Birthday Party Package",
                style:TextFontStyle.textFontStyle(14,Color(0XFF575959), FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            ..._buildPackageItems(),
            const SizedBox(height: 24),
            Row(
              children:  [
                Expanded(child: Divider(thickness: 1)),
                SizedBox(width: 8),
                Text(
                  "Bill Details",
                  style:TextFontStyle.textFontStyle(14,Color(0XFF575959), FontWeight.w500),
                ),
                SizedBox(width: 8),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 12),
            _buildBillRow("Package Charges", "₹ 32,000", showInfo: true),
            _buildBillRow("Platform Fee", "₹ 100"),
            _buildBillRow("Transport Fee", "FREE"),
            _buildBillRow("Paid", "₹ 32,100", bold: true),
            const SizedBox(height: 24),

            Row(
              children:  [
                Expanded(child: Divider(thickness: 1)),
                SizedBox(width: 8),
                Text(
                  "Rate Service",
                  style:TextFontStyle.textFontStyle(14,Color(0XFF575959), FontWeight.w500),
                ),
                SizedBox(width: 8),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 8),
            _buildRatingRow(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPackageItems() {
    final services = [
      {
        "title": "Decoration",
        "price": "₹ 8,000",
        "image": "assets/images/cartdecoration.png"
      },
      {
        "title": "Makeup",
        "price": "₹ 8,000",
        "image": "assets/images/cartdecoration2.png"
      },
      {
        "title": "Bartender",
        "price": "₹ 8,000",
        "image": "assets/images/cartbortender.png"
      },
      {
        "title": "Royal valet Service",
        "price": "₹ 8,000",
        "image": "assets/images/RoyalvaletService.png"
      },
    ];

    return services.map((service) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFCEFEA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                service["image"]!,
                width: 67,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service["title"]!,
                    style:TextFontStyle.textFontStyle(12,Color(0XFF575959), FontWeight.w500),
                  ),
                  Text(service["price"]!,
                    style:TextFontStyle.textFontStyle(12,Color(0XFF1E535B), FontWeight.w600),
                  ),
                  Text("Delivered on–23–03–25",
                    style:TextFontStyle.textFontStyle(12,Color(0XFF757575), FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildBillRow(String label, String value,
      {bool showInfo = false, bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
                if (showInfo) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.info_outline, size: 14),
                ]
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingRow() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RateServiceScreen()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              index < 4 ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
