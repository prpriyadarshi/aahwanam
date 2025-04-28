import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
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
                  Center(
              child: Stack(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace or handle network if needed
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 18, color: Colors.black),
                  ),
                ),
              ],
              ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Profile Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            labelText: 'First Name *',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Last Name *',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number *',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address *',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Submit"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(thickness: 1.2),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Call delete account event or dialog
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Deleting your account will remove all the orders and history of your account.",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AccountLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("Something went wrong")),
          );
        }
      },
    );
  }
}

