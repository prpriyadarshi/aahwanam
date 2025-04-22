import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountBloc()..add(LoadAccountInfo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Information'),
          leading: const BackButton(),
        ),
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountLoaded) {
              return Column(
                children: [
                  // Main content (ListView)
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        Card(
                          color: const Color(0xD9164248),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                AssetImage(state.profileUrl)),
                            title: Text(state.name,
                                style: const TextStyle(color: Colors.white)),
                            subtitle: Text(state.email,
                                style: const TextStyle(color: Colors.white70)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Your Information",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.0, // 100% line-height
                            letterSpacing: 0,
                            color: Color(0xFF575959),
                          ),
                        ),
                        CustomTile(
                          imagePath: 'assets/images/Vector.png',
                          title: 'Profile',
                          bgColor: Color(0xFFE3FDEE),
                          onTap: () {},
                        ),
                        CustomTile(
                          imagePath: 'assets/images/bookings.png',
                          title: 'Bookings',
                          bgColor: Color(0xFFDFE3FF),
                          onTap: () {},
                        ),
                        CustomTile(
                          imagePath: 'assets/images/cart.png',
                          title: 'Cart',
                          bgColor: Color(0xFFDFF4FF),
                          onTap: () {},
                        ),
                        CustomTile(
                          imagePath: 'assets/images/wishlist.png',
                          title: 'Wishlist',
                          bgColor: Colors.pinkAccent.shade100,
                          onTap: () {},
                        ),
                        CustomTile(
                          imagePath: 'assets/images/mypackages.png',
                          title: 'My Packages',
                          bgColor: Colors.greenAccent,
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Other",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CustomTile(
                          imagePath: 'assets/images/budget planner.png',
                          title: 'Budget Planner',
                          bgColor: Colors.orangeAccent.shade100,
                          onTap: () {},
                        ),
                        CustomTile(
                          imagePath: 'assets/images/refer people.png',
                          title: 'Refer People',
                          bgColor: Colors.purple.shade100,
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  // Spacer to adjust the logout button's position (move up a bit)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle logout action here
                        },
                        child: const Text("Logout"),
                      ),
                    ),
                  ),
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

