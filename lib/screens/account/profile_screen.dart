import 'package:aahwanam/screens/account/account_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import '../../widgets/custom_inputfield.dart'; // Your custom widget for input fields
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
            width: 450,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Text(
                        'Are you sure you want to\ndelete account?',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textFontStyle(
                          14,
                          const Color(0xFF575959),
                          FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Deleting your account will remove all the orders and history of your account.',
                        textAlign: TextAlign.center,
                        style: TextFontStyle.textFontStyle(
                          13,
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
                            padding: const EdgeInsets.symmetric(vertical: 4),
                          ),
                          child: Text(
                            'No',
                            style: TextFontStyle.textFontStyle(
                              14,
                              const Color(0xFF78A3EB),
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showAccountDeletedDialog();

                            /// Trigger delete event here if needed
                            /// context.read<AccountBloc>().add(DeleteAccount());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF78A3EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                          ),
                          child: Text(
                            'Yes',
                            style: TextFontStyle.textFontStyle(
                              14,
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
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Account Deleted!',
                  style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Your account has been successfully deleted.',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textFontStyle(
                    13,
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
              title: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF575959),
                ),
              ),
              leading: IconButton(
                padding: const EdgeInsets.only(top: 2, left: 12),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Color(0xFF575959),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image with Edit Icon
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
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
                  const SizedBox(height: 18),
                  Text(
                    "Profile Details",
                    style: TextFontStyle.textFontStyle(
                      18,
                      const Color(0xFF575959),
                      FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Reusable InputFields widgets
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          controller: _firstNameController,
                          labelText: "First Name *",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomInputField(
                          controller: _lastNameController,
                          labelText: "Last Name *",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  CustomInputField(
                    controller: _phoneController,
                    labelText: "Phone Number *",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 2),

                  CustomInputField(
                    controller: _emailController,
                    labelText: "Email Address *",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),

                  // Submit button
                  Center(
                    child: SizedBox(
                      width: 280,
                      height: 45,
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
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          "Submit",
                          style: TextFontStyle.textFontStyle(
                            14,
                            Colors.white,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Divider(thickness: 1, color: Color(0xFFE4E4E4)),
                  const SizedBox(height: 10),

                  // Delete Account Section
                  GestureDetector(
                    onTap: _showDeleteConfirmationDialog,
                    child: Text(
                      "Delete Account",
                      style: TextFontStyle.textFontStyle(
                        14,
                        const Color(0xFFD75252),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Deleting your account will remove all the orders and history of your account.",
                    style: TextFontStyle.textFontStyle(
                      14,
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
