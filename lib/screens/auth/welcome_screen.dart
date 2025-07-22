import 'package:flutter/material.dart';
import '../../../widgets/custom_action_button.dart';
import '../../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 80), // Top space

                        Column(
                          children: [
                            Image.asset(
                              'assets/images/Welcome.png',
                              height: 315,
                              width: 315,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Let’s make your day special!",
                              style: TextStyle(
                                fontSize: 22  ,
                                color: Color(0xFF575959),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        const SizedBox(height: 40), // Space between content and buttons

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomActionButton(
                              text: "Sign in",
                              onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                              backgroundColor: const Color(0xFF1E535B),
                              borderColor: Colors.transparent,
                              textColor: Colors.white,
                              height: 50,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 12),
                            CustomActionButton(
                              text: "Sign up",
                              onPressed: () => Navigator.pushNamed(context, AppRoutes.signUp),
                              backgroundColor: Colors.white,
                              borderColor: const Color(0xFF1E535B),
                              textColor: const Color(0xFF575959),
                              height: 50,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 32), // Bottom space
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
