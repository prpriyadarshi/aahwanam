import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_action_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0XFFFFF6ED),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "Sign in to continue",
                      style: TextFontStyle.textFontStyle(
                        18,
                        const Color(0xFF575959),
                        FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Expanded(
                          child: _labeledField("First Name *", firstNameController),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _labeledField("Last Name", lastNameController),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _labeledField("Phone Number *", phoneController),
                    const SizedBox(height: 16),

                    CustomActionButton(
                      text: "Sign up",
                      backgroundColor: const Color(0xFF1E535B),
                      textColor: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.053,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.dashboard);
                        SignUpUser(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          phoneController.text,
                          passwordController.text,
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: const [
                        Expanded(child: Divider(color: Color(0xFF575959))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Or",
                            style: TextStyle(color: Color(0xFF575959)),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFF575959))),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon("assets/images/Apple.png"),
                        const SizedBox(width: 38),
                        _buildSocialIcon("assets/images/Facebook.png"),
                        const SizedBox(width: 38),
                        _buildSocialIcon("assets/images/Google.png"),
                      ],
                    ),

                     const SizedBox(height: 131),

                    // SizedBox(height: constraints.maxHeight * 0.1),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextFontStyle.textFontStyle(
                            16,
                            const Color(0xFF575959),
                            FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, AppRoutes.signIn),
                          child: Text(
                            "Sign in",
                            style: TextFontStyle.textFontStyle(
                              16,
                              const Color(0xFF1E535B),
                              FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            );
          },
        ),
      ),

    );
  }

  Widget _labeledField(String label, TextEditingController controller,
      {bool obscure = false}) {
    final String cleanHint = label.replaceAll("*", "").trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextFontStyle.textFontStyle(
            14,
            const Color(0xFF575959),
            FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          cursorColor: const Color(0xFF575959),
          decoration: InputDecoration(
            hintText: "Enter $cleanHint",
            hintStyle: TextFontStyle.textFontStyle(
              14,
              const Color(0xFF757575),
              FontWeight.w400,
            ),
            filled: true,
            fillColor: const Color(0xFFFFF6ED),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Image.asset(assetPath, width: 30, height: 30);
  }
}
