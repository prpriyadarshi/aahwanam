// payment_success_screen.dart

import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text("Payment",
            style: TextFontStyle.textFontStyle(
              12,
              Color(0xFF575959),
              FontWeight.bold,
            ),
           ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.check_circle, color: Color(0xFF1E535B), size: 100),
            SizedBox(height: 20),
            Text(
              "Payment Successful!",
              style: TextFontStyle.textFontStyle(
                22,
                Color(0xFF575959),
                FontWeight.bold,
              ),

            ),
            SizedBox(height: 10),
            Text(
              "Thank you for your payment.",
              style: TextFontStyle.textFontStyle(
                16,
                Colors.grey,
                FontWeight.bold,
              ),


            ),
          ],
        ),
      ),
    );
  }
}
