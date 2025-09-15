import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_text_field.dart'; // Make sure this contains AppRoutes.splash

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.welcome,
            (route) => true, // Removes all previous routes
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1E535B),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your image here
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              // Gradient text
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xFFE94E77), // #E94E77
                    Color(0xFFF0A28E), // #F0A28E
                    Color(0xFFF9B85D), // #F9B85D
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child:  Text(
                  'AAHWANAM',
                  style: TextFontStyle.textFontStyle(20, const Color(0xFFFFFFFF), FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}