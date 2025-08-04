import 'dart:io';

import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/screens/account/mypackages_screen.dart';
import 'package:aahwanam/screens/account/profile_screen.dart';
import 'package:aahwanam/screens/account/booking_screen.dart';
import 'package:aahwanam/screens/account/wishlist_screen.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:aahwanam/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dashboard/dashboard_screen.dart';
import 'cart_screen.dart';
import 'package:image_picker/image_picker.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? _profileImage; // ✅ store picked image

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery); // or camera
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // ✅ update state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountBloc()..add(LoadAccountInfo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Information'),
          // leading: const BackButton(),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
          ),
        ),
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountLoaded) {
              return ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  Card(
                    color: const Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16), // ✅ border-radius: 16px
                    ),
                    child: SizedBox(
                      width: 328, // ✅ fixed width
                      height: 83, // ✅ fixed height
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            // ✅ Profile Image with edit icon
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 25.5, // ✅ diameter ~51px
                                  backgroundImage: AssetImage(state.profileUrl),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: _pickProfileImage,
                                    // Implement method
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),

                            // ✅ Texts: Name & Email
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.firstName} ${state.lastName}',
                              style: TextFontStyle.textFontStyle(
                                  16, Colors.white, FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.email,
                                  style: TextFontStyle.textFontStyle(
                                      14, Color(0xFFE4E4E4), FontWeight.w400),

                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Your Information",
                      style: TextFontStyle.textFontStyle(
                          14, Color(0xFF575959), FontWeight.w500),
                  ),
                  CustomTile(
                    imagePath: 'assets/images/Vector.png',
                    title: 'Profile',
                    bgColor: Color(0xFFE3FDEE),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<AccountBloc>(context),
                              child: const ProfileScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  CustomTile(
                      imagePath: 'assets/images/bookings.png',
                      title: 'Bookings',
                      bgColor: Color(0xFFDFE3FF),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: BlocProvider.of<AccountBloc>(context),
                                child: const BookingScreen(),
                              );
                            },
                          ),
                        );
                      }),
                  CustomTile(
                      imagePath: 'assets/images/cart.png',
                      title: 'Cart',
                      bgColor: Color(0xFFDFF4FF),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: BlocProvider.of<AccountBloc>(context),
                                child: const CartScreen(),
                              );
                            },
                          ),
                        );
                      }),
                  CustomTile(
                      imagePath: 'assets/images/wishlist.png',
                      title: 'Wishlist',
                      bgColor: Color(0xFFFFECEC),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: BlocProvider.of<AccountBloc>(context),
                                child: const WishlistScreen(),
                              );
                            },
                          ),
                        );
                      }),
                  CustomTile(
                      imagePath: 'assets/images/mypackages.png',
                      title: 'My Packages',
                      bgColor: Color(0xFFE9FFE2),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: BlocProvider.of<AccountBloc>(context),
                                child: const MyPackagesScreen(),
                              );
                            },
                          ),
                        );
                      }),
                  const SizedBox(height: 10),
                  Text("Other",
                      style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  CustomTile(
                      imagePath: 'assets/images/budget planner.png',
                      title: 'Budget Planner',
                      bgColor: Color(0xFFFFF4DF),
                      onTap: () {}),
                  CustomTile(
                      imagePath: 'assets/images/refer people.png',
                      title: 'Refer People',
                      bgColor: Color(0xFFFFE8FB),
                      onTap: () {}),
                  const SizedBox(height: 80),
                  Container(
                    width: 328,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 16),
                    // Optional: Matches your `left` and `top`
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle logout action here
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 1,
                            color: Color(0xFF1E535B)), // Border width and color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border radius
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text("Logout",
                          style: TextStyle(color: Color(0xFF1E535B))),
                    ),
                  )
                ],
              );
            } else if (state is AccountError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
