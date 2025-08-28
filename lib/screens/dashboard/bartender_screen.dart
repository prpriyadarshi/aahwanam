import 'package:aahwanam/blocs/bartender/bartender_bloc.dart';
import 'package:aahwanam/blocs/bartender/bartender_event.dart';
import 'package:aahwanam/blocs/bartender/bartender_state.dart';
import 'package:aahwanam/screens/dashboard/package_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/package_card.dart';

class BartenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BartenderBloc()..add(FetchBartender()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,

          scrolledUnderElevation: 0,
          toolbarHeight: 56,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.only(left: 8),
                splashRadius: 20,
                constraints: const BoxConstraints(),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(height: 40, child: _buildSearchBar()),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                        ),
                        builder: (context) => CustomDateTimeBottomSheet(
                          onConfirm: (DateTime fullDateTime) {
                            print("Selected DateTime: $fullDateTime");
                          },
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: const [
                        Icon(Icons.calendar_today, size: 20, color: Color(0xFF004d40)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(Icons.access_time, size: 10, color: Color(0xFF004d40)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/images/cart.png', width: 24, height: 24),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocBuilder<BartenderBloc, BartenderState>(
          builder: (context, state) {
            if (state is BartenderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BartenderLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Packages",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF575959),
                            ),
                          ),




                        ],
                      ),
                      const SizedBox(height: 10),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.Packages.length,
                        itemBuilder: (context, index) {
                          final package = state.Packages[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PackageDetailScreen(package: package),
                                  ),
                                );
                              },
                              child: PackageCard(
                                title: package['title'],
                                description: package['description'],
                                price: package['price'],
                                details: package['details'],
                                imagePath: package['imagePath'],
                                rating: package['rating'],
                              ),
                            ),
                          );
                        },
                      ),


                    ],
                  ),
                ),
              );
            } else if (state is BartenderError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },
        ),
      ),
    );
  }
}

Widget _buildSearchBar() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search here...',
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: const Color(0xFFF8F8F8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}