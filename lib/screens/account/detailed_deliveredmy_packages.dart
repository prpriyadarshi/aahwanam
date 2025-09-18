import 'package:aahwanam/screens/account/RateServiceScreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_field.dart';

class DetailedDeliveredmyPackagesScreen extends StatefulWidget {
  final Map<String, dynamic> package;

  const DetailedDeliveredmyPackagesScreen({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  State<DetailedDeliveredmyPackagesScreen> createState() =>
      _DetailedDeliveredmyPackagesScreenState();
}

class _DetailedDeliveredmyPackagesScreenState
    extends State<DetailedDeliveredmyPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    // Screen size
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Responsive scaling factors
    double textScale = screenWidth / 390; // base iPhone width
    if (textScale < 0.8) textScale = 0.8;
    if (textScale > 1.3) textScale = 1.3;

    double imageScale = screenWidth / 390;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "My Packages",
          style: TextFontStyle.textFontStyle(
              16 * textScale, const Color(0xFF575959), FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF575959),
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Birthday Party Package",
                style: TextFontStyle.textFontStyle(
                    14 * textScale, const Color(0xFF575959), FontWeight.w500),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ..._buildPackageItems(screenWidth, imageScale, textScale),
            SizedBox(height: screenHeight * 0.01),

            // Bill Details Divider
            _buildSectionDivider("Bill Details", textScale),
            SizedBox(height: screenHeight * 0.010),
            _buildBillRow("Package Charges", "₹ 32,000",
                showInfo: true, bold: false, textScale: textScale),
            _buildBillRow("Platform Fee", "₹ 100",
                bold: false, textScale: textScale),
            _buildBillRow("Transport Fee", "FREE",
                bold: false, textScale: textScale),
            _buildBillRow("Paid", "₹ 32,100",
                bold: true, textScale: textScale),
            SizedBox(height: screenHeight * 0.02),

            // Rate Service Divider
            _buildSectionDivider("Rate Service", textScale),
            SizedBox(height: screenHeight * 0.020),
            _buildRatingRow(screenWidth, textScale),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPackageItems(
      double screenWidth, double imageScale, double textScale) {
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
                width: screenWidth * 0.2,
                height: screenWidth * 0.15,
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
                        12 * textScale, const Color(0XFF575959), FontWeight.w500),
                  ),
                  Text(
                    service["price"]!,
                    style: TextFontStyle.textFontStyle(
                        12 * textScale, const Color(0XFF1E535B), FontWeight.w600),
                  ),
                  Text(
                    "Delivered on–23–03–25",
                    style: TextFontStyle.textFontStyle(
                        11 * textScale, const Color(0XFF757575), FontWeight.w400),
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
                      bold ? FontWeight.bold : FontWeight.normal),
                ),
                if (showInfo) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.info_outline, size: 16),
                ]
              ],
            ),
          ),
          Text(
            value,
            style: TextFontStyle.textFontStyle(
                12 * textScale,
                const Color(0XFF575959),
                bold ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _buildRatingRow(double screenWidth, double textScale) {
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Icon(
              index < 4 ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 28 * textScale,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionDivider(String title, double textScale) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextFontStyle.textFontStyle(
              14 * textScale, const Color(0XFF575959), FontWeight.w500),
        ),
        const SizedBox(width: 8),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
