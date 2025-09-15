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
Widget _supportSectionTitle(String title) {
  return Text(
    title,
    style: TextFontStyle.textFontStyle(16, const Color(0xFF1E535B), FontWeight.w500),
  );
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Text('Account Information',
            style: TextFontStyle.textFontStyle(
              16,                         // Font size
              Color(0xFF575959),          // Text color
              FontWeight.w600,            // Font weight
            ),
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(top: 2, left: 10),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Color(0xFF575959),
            ),
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
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                children: [
                  Card(
                    color: const Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14), // ✅ border-radius: 16px
                    ),
                    child: SizedBox(
                      width: 328, // ✅ fixed width
                      height: 85, // ✅ fixed height
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        child: Row(
                          children: [
                            // ✅ Profile Image with edit icon
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30, // ✅ diameter ~51px
                                  backgroundImage: AssetImage(state.profileUrl),
                                ),
                                Positioned(
                                  bottom: -0.8,
                                  right: 6,
                                  child: GestureDetector(
                                    onTap: _pickProfileImage,
                                    child: Container(
                                      padding: const EdgeInsets.all(2), // Border thickness
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF1E535B) ,      // top-left color
                                            Colors.pinkAccent,  // bottom-right color
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(3), // Inner circle padding
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 7,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),

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
                          14, Color(0xFF575959), FontWeight.w600),
                  ),
                  CustomTile(
                    imagePath: 'assets/images/profileimage.png',
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
                      imagePath: 'assets/images/booking1.png',
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
                      imagePath: 'assets/images/cart1.png',
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
                      imagePath: 'assets/images/wishlist1.png',
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
                      imagePath: 'assets/images/mypackages1.png',
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
                  const SizedBox(height: 12),
                  Text("Others",
            style: TextFontStyle.textFontStyle(
            14,                         // Font size
            Color(0xFF575959),          // Text color
            FontWeight.w500,            // Font weight
            ),                  ),
                  // CustomTile(
                  //     imagePath: 'assets/images/budget planner1.png',
                  //     title: 'Budget Planner',
                  //     bgColor: Color(0xFFFFF4DF),
                  //     onTap: () {}),
                  CustomTile(
                      imagePath: 'assets/images/refer people1.png',
                      title: 'Refer People',
                      bgColor: Color(0xFFFFE8FB),
                      onTap: () {}),
                  const SizedBox(height: 10),
                  _supportSectionTitle('Aahwanam Support*'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E535B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.call, color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '3659252957',
                        style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: 328,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 68),
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
                      child: Text("Logout",
                          style: TextFontStyle.textFontStyle(
                            14,                         // Font size
                            Color(0xFF1E535B),          // Text color
                            FontWeight.w500,            // Font weight
                          ),
                          ),
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
