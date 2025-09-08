import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../widgets/custom_text_field.dart';
import 'addcard.dart';
import 'paymentsuccess.dart';

class PaymentOptionsScreen extends StatefulWidget {
  final double? total; // ✅ Make it nullable if optional

  const PaymentOptionsScreen({Key? key, this.total}) : super(key: key);

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  String selectedPaymentMethod = "upi";
  bool useDefaultUpi = true;
  late Razorpay _razorpay;

  final String amount = "1";

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _launchRazorpay({String? upiId}) {
    var options = {
      'key': 'rzp_live_KK4RDkGbtZzQf1',
      'amount': ((widget.total ?? 0) * 100).toInt(), // ✅ Correct conversion
      'name': 'Aahwanam',
      'description': 'Service Payment',
      'prefill': {
        'contact': '9014944283',
        'email': 'archanaashannagari@gmail.com',
      },
      if (!useDefaultUpi) 'method': 'upi',
      if (!useDefaultUpi && upiId != null) 'vpa': upiId,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Payment failed. Please try again.")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("External Wallet Selected: ${response.walletName}")),
    );
  }

  Future<void> _showUpiInputDialog() async {
    String? upiId = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text("Enter UPI ID", style: TextFontStyle.textFontStyle(
            12,
            Color(0xFF575959),
            FontWeight.w400,
          ),),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "example@upi"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: Text("Submit", style: TextFontStyle.textFontStyle(
                12,
                Color(0xFF575959),
                FontWeight.w400,
              ),),
            ),
          ],
        );
      },
    );

    if (upiId != null && upiId.contains('@')) {
      setState(() {
        useDefaultUpi = false;
        selectedPaymentMethod = "upi";
      });
      _launchRazorpay(upiId: upiId);
    } else if (upiId != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid UPI ID")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Options",
          style: TextFontStyle.textFontStyle(
            18,
            Color(0xFF575959),
            FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1E535B)),
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10), // ✅ Move button slightly up
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          width: 170,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: ElevatedButton(
              onPressed: () {
                if (selectedPaymentMethod == 'upi' && !useDefaultUpi) {
                  _showUpiInputDialog();
                } else {
                  _launchRazorpay();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E535B),
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Proceed to Pay ₹${widget.total?.toStringAsFixed(2) ?? '0.00'}",
                style: TextFontStyle.textFontStyle(
                  12,
                  Colors.white,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),

      body: _buildBody(),

    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _upiSection(),
        const SizedBox(height: 16),
        Text("Cards",

          style: TextFontStyle.textFontStyle(
            12,
            Color(0xFF575959),
            FontWeight.bold,
          ),

        ),
        const SizedBox(height: 10),
        _cardSection(),
        const SizedBox(height: 24),
        Text("Pay On Delivery",
          style: TextFontStyle.textFontStyle(
            12,
            Color(0xFF575959),
            FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _codSection(),
      ],
    );
  }

  Widget _upiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pay by UPI",
          style: TextFontStyle.textFontStyle(
            14,
            const Color(0xFF575959),
            FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            border: Border.all(color: const Color(0xFFE2E2E2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentOptionCard(
                title: "Pay by any UPI app",
                subtitle: "Use any UPI app on your phone to pay",
                leadingIcon: Icons.account_balance_wallet_outlined,
                selected: selectedPaymentMethod == "upi" && useDefaultUpi,
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = "upi";
                    useDefaultUpi = true;
                  });
                },
                showArrow: false,
              ),

              const SizedBox(height: 8),
              const Divider(color: Color(0xFFF1F1F1)),
              const SizedBox(height: 8),
              Row(

                children: [
                  _buildMiniUpiIcon("assets/images/paytm.jpg", "Paytm", () {
                    setState(() {
                      selectedPaymentMethod = "upi";
                      useDefaultUpi = true;
                    });
                    _launchRazorpay();
                  }),
                  const SizedBox(width: 40),
                  _buildMiniUpiIcon(
                      "assets/images/phonepay.jpg", "PhonePe", () {
                    setState(() {
                      selectedPaymentMethod = "upi";
                      useDefaultUpi = true;
                    });
                    _launchRazorpay();
                  }),
                ],
              ),

              const SizedBox(height: 8),
              const Divider(color: Color(0xFFF1F1F1)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _showUpiInputDialog,
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E535B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                          Icons.add, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add new UPI ID",
                      style: TextFontStyle.textFontStyle(
                        14,
                        const Color(0xFF1E535B),
                        FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Color(0xFF1E535B)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10), // Reduced padding
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(12), // Slightly smaller radius
      ),
      child: _buildPaymentOptionCard(
        title: "Debit / Credit Cards",
        leadingIcon: Icons.credit_card,
        selected: selectedPaymentMethod == "card",
        onTap: () {
          setState(() {
            selectedPaymentMethod = "card";
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddCardScreen()),
          );
        },
      ),
    );
  }

  Widget _codSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10), // Reduced padding
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: _buildPaymentOptionCard(
        title: "Cash On Delivery",
        leadingIcon: Icons.money,
        selected: selectedPaymentMethod == "cod",
        onTap: () {
          setState(() {
            selectedPaymentMethod = "cod";
          });
        },
      ),
    );
  }



  Widget _buildPaymentOptionCard({
    required String title,
    String? subtitle,
    required IconData leadingIcon,
    required VoidCallback onTap,
    bool selected = false,
    bool showArrow = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // ✅ Full width
        padding: const EdgeInsets.symmetric(vertical: 12),
        // ✅ Better touch area
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ✅ Distribute space
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(leadingIcon, color: const Color(0xFF1E535B)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.55, // ✅ Prevent overflow
                      child: Text(
                        title,
                        style: TextFontStyle.textFontStyle(
                          14,
                          const Color(0xFF575959),
                          FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.55,
                          child: Text(
                            subtitle,
                            style: const TextStyle(fontSize: 12,
                                color: Colors.grey),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                if (showArrow)
                  const Icon(Icons.arrow_forward_ios, size: 16,
                      color: Color(0xFF1E535B)),
                if (selected)
                  const Icon(Icons.check_circle, color: Color(0xFF1E535B)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniUpiIcon(String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.start,
            style: TextFontStyle.textFontStyle(
              12,
              const Color(0xFF575959),
              FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}