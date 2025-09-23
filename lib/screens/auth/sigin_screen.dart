import 'package:aahwanam/widgets/custom_text_field.dart';
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
      backgroundColor: const Color(0xFFFFF6ED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Verify your phone number",
                style: TextFontStyle.textFontStyle(18, const Color(0xFF575959), FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                "We will send you a confirmation code",
                style: TextFontStyle.textFontStyle(12, const Color(0xFF757575), FontWeight.w400),
              ),
              const SizedBox(height: 18),
              Text(
                "Phone Number *",
                style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                cursorColor: const Color(0xFF575959),
                style: const TextStyle(color: Color(0xFF575959)),
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextFontStyle.textFontStyle(14, const Color(0xFF757575), FontWeight.w400),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF575959), width: 1.5),
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
                height: MediaQuery.of(context).size.height*43/812,
                width: double.infinity,
              ),
              // const Spacer(), // pushes sign-up row to bottom
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.signUp),
                    child:  Text(
                      "Sign up",
                      style: TextFontStyle.textFontStyle(16, const Color(0xFF1E535B), FontWeight.w400),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
