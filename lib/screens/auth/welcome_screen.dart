import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_action_button.dart';
import '../../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFF6ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 174),

              Column(
                children: [
                  Image.asset(
                    'assets/images/Welcome.png',
                    height: 313,
                    width: 313,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Let’s make your day special!",
                    style: TextFontStyle.textFontStyle(
                      20,
                      const Color(0xFF575959),
                      FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomActionButton(
                    text: "Sign in",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signIn),
                    backgroundColor: const Color(0xFF1E535B),
                    borderColor: const Color(0XFF1E535B),
                    textColor: const Color(0XFFFFFFFF),
                    height: MediaQuery.of(context).size.height * 43 / 812,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 12),
                  CustomActionButton(
                    text: "Sign up",
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signUp),
                    backgroundColor: const Color(0XFFFFF6ED),
                    borderColor: const Color(0xFF1E535B),
                    textColor: const Color(0xFF575959),
                    height: MediaQuery.of(context).size.height * 43 / 812,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
