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

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        // 1. If data is loading, show a loading indicator
        if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), // Loading state
          );
        }

        // 2. If data is loaded, show the profile information
        if (state is AccountLoaded) {
          _firstNameController.text = state.firstName;
          _lastNameController.text = state.lastName;
          _phoneController.text = state.phone;
          _emailController.text = state.email;

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: const Text("Profile"),
              leading: const BackButton(),
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
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickProfileImage,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit,
                                  size: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Profile Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF575959)),
                  ),
                  const SizedBox(height: 16),

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
                      const SizedBox(width: 10),
                      // Add spacing between the two fields
                      Expanded(
                        child: CustomInputField(
                          controller: _lastNameController,
                          labelText: "Last Name *",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  CustomInputField(
                    controller: _phoneController,
                    labelText: "Phone Number *",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  CustomInputField(
                    controller: _emailController,
                    labelText: "Email Address *",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 30),

                  // Submit button with white text color and rounded corners
                  SizedBox(
                    width: double.infinity,
                    height: 48,
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
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Submit",
                        style:
                            TextStyle(color: Colors.white), // White text color
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Divider for separation
                  const Divider(thickness: 1, color: Color(0xFFE4E4E4)),
                  const SizedBox(height: 10),

                  // Delete Account Section
                  GestureDetector(
                    onTap: () {
                      // Call delete account event or dialog
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Color(0xFFD75252),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Deleting your account will remove all the orders and history of your account.",
                    style: TextStyle(
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }

        // 3. If there's an error or other state, show a fallback message
        return const Scaffold(
          body: Center(child: Text("Something went wrong")),
        );
      },
    );
  }
}
