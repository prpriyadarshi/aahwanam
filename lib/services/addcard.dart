import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card", style: TextStyle(color: Colors.black)),

        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        child: SizedBox(
          width: 170, // 👈 Set reasonable width
          child: FittedBox( // 👈 Wrap to fit contents
            fit: BoxFit.scaleDown,
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E535B),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {  },
              child: const Text(
                "Proceed to Pay ₹2,100",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Card Number",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),

            const SizedBox(height: 6),
            _buildCardContainer(

              child: TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "XXXX XXXX XXXX XXXX",
                  border: InputBorder.none,
                ),
              ),
              icon: Icons.credit_card,
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Expiry",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      _buildCardContainer(
                        icon: Icons.calendar_today,
                        child: TextField(
                          controller: _expiryController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            hintText: "MM/YY",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("CVV",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      _buildCardContainer(
                        icon: Icons.lock,
                        child: TextField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "CVV",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  Widget _buildCardContainer({required Widget child, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: child),
          const SizedBox(width: 10),
          Icon(icon, color: Colors.grey[600], size: 20),
        ],
      ),
    );
  }

}
