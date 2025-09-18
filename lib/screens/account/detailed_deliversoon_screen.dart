import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/account/RateServiceScreen.dart';
import 'package:aahwanam/services/chatscreen.dart';
import 'package:aahwanam/services/connectingscreen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/package_card.dart';

class DetailedDeliverSoonScreen extends StatefulWidget {
  final Map<String, dynamic> package;

  const DetailedDeliverSoonScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  State<DetailedDeliverSoonScreen> createState() =>
      _DetailedDeliverSoonScreen();
}

class _DetailedDeliverSoonScreen extends State<DetailedDeliverSoonScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "My Packages",
          style: TextFontStyle.textFontStyle(
            16 * textScale,
            const Color(0xFF575959),
            FontWeight.w500,
          ),
        ),
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
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF575959)),
            onPressed: () {
              // Share functionality here
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
                "Anniversary Package",
                style: TextFontStyle.textFontStyle(
                  14 * textScale,
                  const Color(0XFF575959),
                  FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ..._buildPackageItems(textScale),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                "Connect with us",
                style: TextFontStyle.textFontStyle(
                  12 * textScale,
                  const Color(0XFF575959),
                  FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: 65,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),
                    child: CircleAvatar(
                      radius: 17.5,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Janey Cooper",
                        style: TextFontStyle.textFontStyle(
                          12 * textScale,
                          const Color(0XFF575959),
                          FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Support Team",
                        style: TextFontStyle.textFontStyle(
                          10 * textScale,
                          const Color(0XFF575959),
                          FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ConnectingScreen()),
                        ),
                        child: const CircleAvatar(
                          radius: 13,
                          backgroundColor: Color(0xFF1E535B),
                          child: Icon(Icons.call,
                              size: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Chatscreen()),
                        ),
                        child: const CircleAvatar(
                          radius: 13,
                          backgroundColor: Color(0xFF1E535B),
                          child: Icon(Icons.chat,
                              size: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1)),
                const SizedBox(width: 8),
                Text(
                  "Bill Details",
                  style: TextFontStyle.textFontStyle(
                    14 * textScale,
                    const Color(0XFF575959),
                    FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 12),
            _buildBillRow("Package Charges", "₹ 32,000",
                textScale: textScale, showInfo: true),
            _buildBillRow("Platform Fee", "₹ 100", textScale: textScale),
            _buildBillRow("Transport Fee", "FREE", textScale: textScale),
            _buildBillRow("Total", "₹ 32,100",
                textScale: textScale, bold: true),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPackageItems(double textScale) {
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
          color: const Color(0xFFFFF2E4),
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
                    style: TextFontStyle.textFontStyle(
                      12 * textScale,
                      const Color(0XFF575959),
                      FontWeight.w500,
                    ),
                  ),
                  Text(
                    service["price"]!,
                    style: TextFontStyle.textFontStyle(
                      12 * textScale,
                      const Color(0XFF1E535B),
                      FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Delivered on–23–03–25",
                    style: TextFontStyle.textFontStyle(
                      11 * textScale,
                      const Color(0XFF757575),
                      FontWeight.w400,
                    ),
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
      {bool showInfo = false, bool bold = false, required double textScale}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  label,
                  style: TextFontStyle.textFontStyle(
                    12 * textScale,
                    const Color(0XFF575959),
                    bold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (showInfo) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.info_outline,
                      size: 14, color: Color(0XFF757575)),
                ]
              ],
            ),
          ),
          Text(
            value,
            style: TextFontStyle.textFontStyle(
              12 * textScale,
              const Color(0XFF575959),
              bold ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingRow(double textScale) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              index < 4 ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 40 * textScale,
            ),
          ),
        ),
      ),
    );
  }
}
