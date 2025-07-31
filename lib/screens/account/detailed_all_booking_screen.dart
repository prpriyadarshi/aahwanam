import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/dashboard/e_invitation_screen.dart';
import 'package:aahwanam/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/package_card.dart';

class DetailedAllBookingScreen extends StatefulWidget {
  final Map<String, dynamic> package;

  const DetailedAllBookingScreen({required this.package, Key? key})
      : super(key: key);

  @override
  State<DetailedAllBookingScreen> createState() =>
      _DetailedAllBookingScreenState();
}

class _DetailedAllBookingScreenState extends State<DetailedAllBookingScreen> {
  bool _showEventDetails = false;
  bool _showBillDetails = false;
  bool _showStatusDetails = false;

  @override
  Widget build(BuildContext context) {
    final package = widget.package;

    return Scaffold(
      appBar: AppBar(title: Text('Booking Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Package Card
            Card(
              elevation: 4,
              color: const Color(0xFFFFEFDF),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  // <-- this is key: use Row, not Column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // LEFT SIDE: Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            package['imagePath'],
                            fit: BoxFit.cover,
                            width: 80,
                            height: 100,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),
                    // RIGHT SIDE: Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              package['title'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF575959),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              package['description'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF757575),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Price: ₹${package['price']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Color(0xFF1E535B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Accordion: Event Details
            _buildAccordion(
              title: "Event Details",
              expanded: _showEventDetails,
              onToggle: () =>
                  setState(() => _showEventDetails = !_showEventDetails),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Date & Time in a Row
                  Row(
                    children: [
                      // Event Date
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Event Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF575959))),
                            const SizedBox(height: 6),
                            _buildInputBox("22, Feb 2025"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Event Time
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Event Time",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF575959))),
                            const SizedBox(height: 6),
                            _buildInputBox("11:15 PM"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Event Address
                  const Text("Event Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575959))),
                  const SizedBox(height: 6),
                  _buildInputBoxWithTitle("Financial District, Hyderabad",
                      "Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,"),

                  const SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 18),

            // Accordion: Bill Details
            _buildAccordion(
              title: "Bill Details",
              expanded: _showBillDetails,
              onToggle: () =>
                  setState(() => _showBillDetails = !_showBillDetails),
              child: Column(
                children: [
                  _buildInfoRow("Makeup Charges", "₹ 8,000"),
                  _buildInfoRow("Hairstyle Charges", "₹ 2,000"),
                  _buildInfoRow("Platform Fee", "100"),
                  _buildInfoRow("Transport Fee", "FREE", isFree: true),
                  _buildInfoRow("Paid", "₹ 10,100",
                      isPaid: true, isPaidValue: true),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Accordion: Booking Status
            _buildAccordion(
              title: "Booking Status",
              expanded: _showStatusDetails,
              onToggle: () =>
                  setState(() => _showStatusDetails = !_showStatusDetails),
              child: Column(
                children: [
                  _buildStatusStep("Booking Confirmed", "22, Feb", true),
                  _buildStatusStep("Artist Assigned", "Today", true),
                  _buildStatusStep("Delivery", "25, Feb", false, isLast: true),
                ],
              ),
            ),

            SizedBox(height: 20),
            Text("Artist assigned for you",
                style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            // Artist Card
            Card(
              color: const Color(0xFFF8F8F8),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(33), // Set border radius here
              ),
              child: ListTile(
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.png'),
                  ),
                ),
                title: Text("Janey Cooper"),
                subtitle: Text("Support Team"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildCircleIcon(Icons.call),
                    const SizedBox(width: 8),
                    _buildCircleIcon(Icons.chat),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EInvitationScreen()),
                  );
                  // TODO: Add send invitation logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black26),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Send Invitation"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E535B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Other Services"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccordion({
    required String title,
    required bool expanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF575959))),
            trailing: IconButton(
              icon: Icon(expanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onPressed: onToggle,
            ),
          ),
          if (expanded)
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: child),
        ],
      ),
    );
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

  Widget _buildInfoRow(
    String label,
    String value, {
    bool isPaid = false,
    bool isFree = false,
    bool isPaidValue = false,
  }) {
    Color valueColor;
    FontWeight valueWeight;

    if (isPaid) {
      valueColor = const Color(0xFF1E535B); // Dark teal
      valueWeight = FontWeight.bold;
    } else if (isFree) {
      valueColor = Colors.green;
      valueWeight = FontWeight.w600;
    } else if (isPaidValue) {
      valueColor = Color(0xFF1E535B);
      valueWeight = FontWeight.w600;
    } else {
      valueColor = Colors.grey;
      valueWeight = FontWeight.w500;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: valueWeight, color: valueColor, fontSize: 14)),
          Text(value,
              style: TextStyle(
                  fontWeight: valueWeight, color: valueColor, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildInputBoxWithTitle(String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBox(String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(value,
          style: const TextStyle(fontSize: 14, color: Color(0xFF575959))),
    );
  }

  Widget _buildStatusStep(String title, String date, bool completed,
      {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and line
          Column(
            children: [
              // Status circle
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: completed ? Color(0xFF1E535B) : Colors.white,
                  border: Border.all(
                    color: completed ? Color(0xFF1E535B) : Colors.grey,
                    width: 2,
                  ),
                ),
              ),

              // Connector line
              if (!isLast)
                Container(
                  width: 2,
                  height: 38,
                  color: Colors.grey.shade400,
                ),
            ],
          ),
          const SizedBox(width: 12),

          // Title and date aligned in one row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title text
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                // Date aligned right
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
