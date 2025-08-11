import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_action_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cream background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Verify your phone number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF575959),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We will send you a confirmation code",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Phone Number *",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                cursorColor: Color(0xFF575959),
                style: const TextStyle(color: Color(0xFF575959)),
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF575959)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF575959)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF575959), width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomActionButton(
                text: "Get OTP",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.otpVerification);
                },
                backgroundColor: const Color(0xFF1E535B),
                borderColor: Colors.transparent,
                textColor: Colors.white,
                height: 50,
                width: double.infinity,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 950),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.signUp),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1E535B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
