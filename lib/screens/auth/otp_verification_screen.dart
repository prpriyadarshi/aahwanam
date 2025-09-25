import 'dart:async';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
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

  bool _isResendEnabled = false; // Added for resend enable/disable

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
        setState(() {
          _isResendEnabled = true; //  Timer 0 -> enable resend
        });
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _remainingTime = const Duration(minutes: 3);
      _isResendEnabled = false; //Reset -> disable resend
    });
    _startTimer();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void _onOtpChanged(int index, String value) {
    // Optional: restart timer if expired and user enters OTP
    if (_remainingTime.inSeconds == 0) {
      _resetTimer();
    }

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
    return _controllers.every((controller) => controller.text.trim().isNotEmpty);
  }

  void _submitOtp() {
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
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    final otpFields = List.generate(6, (index) {
      return Container(
        width: screenWidth * 0.11,
        height: screenWidth * 0.11,
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
              style: TextStyle(
                color: const Color(0xFF1E535B),
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.05,
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
      backgroundColor: const Color(0xFFFFF6ED),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          "OTP Verification",
                          style: TextFontStyle.textFontStyle(
                              18, const Color(0xFF575959), FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            text: "Enter the code from sms we have sent to\n",
                            style: TextFontStyle.textFontStyle(
                                12, const Color(0xFF757575), FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "9837401241",
                                style: TextFontStyle.textFontStyle(
                                    12, const Color(0xFF757575),
                                    FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Center(
                          child: Text(
                            _formatDuration(_remainingTime),
                            style: TextFontStyle.textFontStyle(
                                14, const Color(0xFF1E535B), FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: List.generate(otpFields.length, (index) {
                            return Expanded(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: otpFields[index],
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn’t get OTP? ",
                              style: TextFontStyle.textFontStyle(
                                  12, const Color(0xFF575959), FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: _isResendEnabled
                                  ? () {
                                // TODO: Call resend OTP API here
                                _resetTimer(); // restart timer
                              }
                                  : null,
                              child: Text(
                                "Resend OTP",
                                style: TextFontStyle.textFontStyle(
                                  12,
                                  _isResendEnabled
                                      ? const Color(0xFF1E535B)
                                      : Colors.grey,
                                  FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        CustomActionButton(
                          text: "Submit",
                          onPressed: isOtpComplete ? _submitOtp : null,
                          backgroundColor: const Color(0xFF1E535B),
                          borderColor: Colors.transparent,
                          textColor: Colors.white,
                          height:
                          MediaQuery.of(context).size.height * 43 / 812,
                          width: double.infinity,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "Don’t have an account? ",
                          //       style: TextFontStyle.textFontStyle(
                          //           16, const Color(0xFF575959),
                          //           FontWeight.w400),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.pushNamed(
                          //             context, AppRoutes.signUp);
                          //       },
                          //       child: Text(
                          //         "Sign up",
                          //         style: TextFontStyle.textFontStyle(
                          //             16, const Color(0xFF1E535B),
                          //             FontWeight.w400),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                        const SizedBox(height: 18),
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
