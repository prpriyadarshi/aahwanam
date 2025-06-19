import 'dart:async';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../widgets/custom_action_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<FocusNode> _keyboardFocusNodes =
  List.generate(6, (_) => FocusNode());

  late Timer _timer;
  Duration _remainingTime = const Duration(minutes: 3);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void _onOtpChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    setState(() {});
  }

  void _onKeyPress(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      final controller = _controllers[index];
      if (controller.text.isEmpty && index > 0) {
        _controllers[index - 1].clear();
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  String getEnteredOTP() {
    return _controllers.map((c) => c.text.trim()).join();
  }

  bool get isOtpComplete {
    print("errro..............");
    return _controllers.every((controller) => controller.text.trim().isNotEmpty);
  }

  void _submitOtp() {
    print("Working..............");

    if (!isOtpComplete) return;
    final otp = getEnteredOTP();
    // context.read<AuthBloc>().add(VerifyOTP(otp));
    Navigator.pushNamed(context, AppRoutes.dashboard);
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    for (final f in _keyboardFocusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otpFields = List.generate(6, (index) {
      return Container(
        width: 42,
        height: 41,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1E535B), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: RawKeyboardListener(
          focusNode: _keyboardFocusNodes[index],
          onKey: (event) => _onKeyPress(event, index),
          child: Center(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              cursorColor: const Color(0xFF575959),
              style: const TextStyle(
                color: Color(0xFF1E535B),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
              ),
              onChanged: (value) => _onOtpChanged(index, value),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFDF3EA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF575959),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  text: "Enter the code from sms we have sent to\n",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF757575),
                  ),
                  children: [
                    TextSpan(
                      text: "9837401241",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF757575),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  _formatDuration(_remainingTime),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF1E535B),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(otpFields.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: otpFields[index],
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn’t get OTP? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF575959),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add resend OTP logic here
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF1E535B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),
              CustomActionButton(
                text: "Submit",
                onPressed: isOtpComplete ? _submitOtp : null,
                backgroundColor: const Color(0xFF1E535B),
                borderColor: Colors.transparent,
                textColor: Colors.white,
                height: 50,
                width: double.infinity,
              ),
              const SizedBox(height: 430),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
