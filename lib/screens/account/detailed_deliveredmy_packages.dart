import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/account/RateServiceScreen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    // Dynamic sizes
    double fontSmall = isTablet ? 16 : 12;
    double fontMedium = isTablet ? 18 : 14;
    double fontLarge = isTablet ? 20 : 16;
    double imageWidth = isTablet ? 100 : 67;
    double imageHeight = isTablet ? 80 : 52;
    double starSize = isTablet ? 55 : 40;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "My Packages",
          style: TextFontStyle.textFontStyle(
            fontLarge,
            const Color(0xFF575959),
            FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(top: 2, left: isTablet ? 20 : 12),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF575959),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 24 : 16),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Birthday Party Package",
                style: TextFontStyle.textFontStyle(
                  fontMedium,
                  const Color(0XFF575959),
                  FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: isTablet ? 24 : 16),
            ..._buildPackageItems(imageWidth, imageHeight, fontSmall),
            SizedBox(height: isTablet ? 32 : 16),

            // Bill Details Divider
            _buildSectionDivider("Bill Details", fontMedium),
            SizedBox(height: isTablet ? 20 : 6),
            _buildBillRow("Package Charges", "₹ 32,000",
                showInfo: true, bold: false, fontSize: 12),
            _buildBillRow("Platform Fee", "₹ 100", fontSize: 12),
            _buildBillRow("Transport Fee", "FREE", fontSize: 12),
            _buildBillRow("Paid", "₹ 32,100",
                bold: true, fontSize: 12),
            SizedBox(height: isTablet ? 32 : 16),
            // Rate Service Divider
            _buildSectionDivider("Rate Service", fontMedium),
            SizedBox(height: isTablet ? 16 : 8),
            _buildRatingRow(starSize),
            SizedBox(height: isTablet ? 32 : 20),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildPackageItems(
      double imageWidth, double imageHeight, double fontSize) {
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
                width: imageWidth,
                height: imageHeight,
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
                        fontSize, const Color(0XFF575959), FontWeight.w500),
                  ),
                  Text(
                    service["price"]!,
                    style: TextFontStyle.textFontStyle(
                        fontSize, const Color(0XFF1E535B), FontWeight.w600),
                  ),
                  Text(
                    "Delivered on–23–03–25",
                    style: TextFontStyle.textFontStyle(
                        fontSize, const Color(0XFF757575), FontWeight.w400),
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
      {bool showInfo = false,
        bool bold = false,
        required double fontSize}) {
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
                    fontSize: fontSize,
                    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
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
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRatingRow(double starSize) {
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
              size: starSize,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSectionDivider(String title, double fontSize) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextFontStyle.textFontStyle(
              fontSize, const Color(0XFF575959), FontWeight.w500),
        ),
        const SizedBox(width: 8),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
