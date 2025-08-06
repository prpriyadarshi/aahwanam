import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatefulWidget {
  final double amount;

  const PaymentSuccessPage({Key? key, required this.amount}) : super(key: key);

  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _pageController;
  late Animation<double> _iconScale;
  late Animation<double> _pageSlide;

  @override
  void initState() {
    super.initState();

    // ✅ Icon animation (scale)
    _iconController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _iconScale = CurvedAnimation(parent: _iconController, curve: Curves.elasticOut);

    // ✅ Page animation (slide up)
    _pageController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _pageSlide =
        Tween<double>(begin: 100, end: 0).animate(CurvedAnimation(parent: _pageController, curve: Curves.easeOut));

    // Start animations
    _iconController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _pageController.forward();
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _pageSlide.value),
              child: child,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // ✅ Animated Icon
              ScaleTransition(
                scale: _iconScale,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E535B).withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E535B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 60, color: Colors.white),
                      ),
                      // ✅ Decorative Crosses
                      Positioned(top: 20, left: 0, child: _crossIcon()),
                      Positioned(top: 20, right: 0, child: _crossIcon()),
                      Positioned(bottom: 20, left: 0, child: _crossIcon()),
                      Positioned(bottom: 20, right: 0, child: _crossIcon()),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Payment Successful !",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                "Rs ${widget.amount.toStringAsFixed(0)} /-",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "22 Feb 2024        08:40 AM",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500, // 500 weight
                  fontFamily: 'Poppins',       // Set font family
                ),
              ),


              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "UPI Transaction ID",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 22),
                        Text("To: Aahvanam", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 22),
                        Text("From: User XYZ", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "UPI Transaction ID",
                          style: TextStyle(
                                  ),
                        ),
                        SizedBox(height: 22),
                        Text("Paytm123@axis", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 22),
                        Text("phonePe123@axis", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),

              // const Spacer(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _actionButton(Icons.error_outline, "Issue"),
                    _actionButton(Icons.share, "Share"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crossIcon() {
    return const Icon(Icons.close, size: 18, color: Color(0xFF1E535B));
  }

  Widget _actionButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFF1E535B), size: 20),
      label: Text(label, style: const TextStyle(color: Color(0xFF1E535B))),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: const BorderSide(color: Color(0xFF1E535B)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
