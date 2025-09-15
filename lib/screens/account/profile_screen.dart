import 'package:aahwanam/screens/account/account_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import '../../widgets/custom_inputfield.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  /// Show confirmation dialog before deleting account
  void _showDeleteConfirmationDialog() {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / 390;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          child: SizedBox(
            width: size.width * 0.85,
            height: size.height * 0.25,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
                vertical: size.height * 0.03,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Are you sure you want to\ndelete account?',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textFontStyle(
                          14 * textScale,
                          const Color(0xFF575959),
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'Deleting your account will remove all the orders and history of your account.',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textFontStyle(
                          13 * textScale,
                          const Color(0xFF6B6B6B),
                          FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF78A3EB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                            ),
                          ),
                          child: Text(
                            'No',
                            style: TextFontStyle.textFontStyle(
                              14 * textScale,
                              const Color(0xFF78A3EB),
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showAccountDeletedDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF78A3EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                            ),
                          ),
                          child: Text(
                            'Yes',
                            style: TextFontStyle.textFontStyle(
                              14 * textScale,
                              Colors.white,
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Show dialog after account is deleted
  void _showAccountDeletedDialog() {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / 390;

    showDialog(
      context: context,
      builder: (_) => Center(
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.07),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Account Deleted!',
                  style: TextFontStyle.textFontStyle(
                    14 * textScale,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Text(
                  'Your account has been successfully deleted.',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textFontStyle(
                    13 * textScale,
                    const Color(0xFF575959),
                    FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / 390; // Base iPhone 12 width

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AccountLoaded) {
          _firstNameController.text = state.firstName;
          _lastNameController.text = state.lastName;
          _phoneController.text = state.phone;
          _emailController.text = state.email;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18 * textScale,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF575959),
                ),
              ),
              leading: IconButton(
                padding: EdgeInsets.only(top: 2, left: size.width * 0.03),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Color(0xFF575959),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountScreen()),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.015,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image with Edit Icon
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.10,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const AssetImage('assets/images/profile.png')
                          as ImageProvider,
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: GestureDetector(
                            onTap: _pickProfileImage,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF1E535B),
                                    Colors.pinkAccent,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  size: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Profile Details",
                    style: TextFontStyle.textFontStyle(
                      17 * textScale,
                      const Color(0xFF575959),
                      FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * 0.00),

                  // Input fields
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          controller: _firstNameController,
                          labelText: "First Name *",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: size.width * 0.01),
                      Expanded(
                        child: CustomInputField(
                          controller: _lastNameController,
                          labelText: "Last Name *",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.00),

                  CustomInputField(
                    controller: _phoneController,
                    labelText: "Phone Number *",
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.00),

                  CustomInputField(
                    controller: _emailController,
                    labelText: "Email Address *",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: size.height * 0.025),

                  // Submit button
                  Center(
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.050,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);

                          context.read<AccountBloc>().add(UpdateAccountInfo(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E535B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextFontStyle.textFontStyle(
                            14 * textScale,
                            Colors.white,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),

                  const Divider(thickness: 1, color: Color(0xFFE4E4E4)),
                  SizedBox(height: size.height * 0.040),

                  // Delete Account Section
                  GestureDetector(
                    onTap: _showDeleteConfirmationDialog,
                    child: Text(
                      "Delete Account",
                      style: TextFontStyle.textFontStyle(
                        14 * textScale,
                        const Color(0xFFD75252),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.0001),
                  Text(
                    "Deleting your account will remove all the orders and history of your account.",
                    style: TextFontStyle.textFontStyle(
                      14 * textScale,
                      const Color(0xFF757575),
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
