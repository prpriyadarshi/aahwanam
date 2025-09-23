import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Welcome after 1 second and REMOVE splash from stack
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.welcome,
            (route) => false, //  no splash screen in back stack
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E535B), //  immediate splash color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFE94E77),
                  Color(0xFFF0A28E),
                  Color(0xFFF9B85D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'AAHWANAM',
                style: TextFontStyle.textFontStyle(
                  20,
                  const Color(0xFFFFFFFF),
                  FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
