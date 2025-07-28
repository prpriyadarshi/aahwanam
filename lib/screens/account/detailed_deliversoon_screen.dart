import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/account/RateServiceScreen.dart';
import 'package:aahwanam/services/chatscreen.dart';
import 'package:aahwanam/services/connectingscreen.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon:
                  const Icon(Icons.chevron_left, color: Colors.black, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "My Packages",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Anniversary Package",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF575959)),
              ),
            ),
            const SizedBox(height: 16),
            ..._buildPackageItems(),
            // const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                "Connect with us",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 328,
              height: 49,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CircleAvatar(
                      radius: 17.5, // 35/2
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Janey Cooper",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575959),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        "Support Team",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF575959),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ConnectingScreen()),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 13, // for 26x26
                          backgroundColor: Color(0xFF1E535B),
                          child:
                              Icon(Icons.call, size: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Chatscreen()),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 13, // for 26x26
                          backgroundColor: Color(0xFF1E535B),
                          child:
                              Icon(Icons.chat, size: 14, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                SizedBox(width: 8),
                Text(
                  "Bill Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0XFF575959)),
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
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF575959)),
                  ),
                  Text(service["price"]!,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF1E535B),
                          fontWeight: FontWeight.w600)),
                  const Text("Delivered on–23–03–25",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF757575),
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Color(0xFF1E535B), // Background color
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), // White icon
        onPressed: () {},
        padding: EdgeInsets.zero, // Remove extra padding
        constraints: BoxConstraints(), // Remove IconButton constraints
      ),
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
