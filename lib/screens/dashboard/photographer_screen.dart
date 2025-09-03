// photographer_screen.dart

import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/screens/dashboard/view_all_packages.dart';
import 'package:aahwanam/widgets/custom_combined_event_date_time_picker.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Photographer/photographer_bloc.dart';
import '../../blocs/Photographer/photographer_event.dart';
import '../../blocs/Photographer/photographer_state.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/package_card.dart';

class PhotographerScreen extends StatefulWidget {
  @override
  _PhotographerScreenState createState() => _PhotographerScreenState();
}

class _PhotographerScreenState extends State<PhotographerScreen> {
  late PhotographerBloc photographerBloc;

  @override
  void initState() {
    super.initState();

    photographerBloc = PhotographerBloc()..add(FetchPhotographers());

    // Show the DateTime Picker after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUnifiedDateTimePicker(context);
    });
  }

  void _showUnifiedDateTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false, // Prevent closing unless "Set" is pressed
      builder: (_) => EventCombinedDateTimePicker(
        onDateTimeSelected: (selectedDateTime) {
          print("Date and time selected: $selectedDateTime");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => photographerBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    size: 24, color: Color(0xFF1E535B)),
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.only(left: 4),
                splashRadius: 20,
                constraints: const BoxConstraints(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 40,
                  width:190,
                  child: _buildSearchBar(),
                ),
              ),



              SizedBox(width: 10),
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
        ),
        body: BlocBuilder<PhotographerBloc, PhotographerState>(
          builder: (context, state) {
            if (state is PhotographerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotographerLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCircleWidget(
                        heading: "Our Services",
                        categories: state.photographers,
                        showViewAll: false,
                        onCategoryTap: (String categoryName) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ViewAllPackages(categoryName: categoryName)));
                        },
                        onViewAll: () {},
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Packages for you",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF575959),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ViewAllPackages(fromViewAll: true)));
                            },
                            child: const Text(
                              "View All",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1E535B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.packages.length,
                        itemBuilder: (context, index) {
                          final package = state.packages[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.photoAndVideographer);
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
            } else if (state is PhotographerError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return SizedBox(
      height: 40,
      width: 200,
      child: TextField(
        style: TextFontStyle.textFontStyle(
          14,
          const Color(0xFF575959),
          FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Search here...',
          // Padding applied only to the left of the icon
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10), // 5 px from left edge
            child: const Icon(Icons.search, size: 20, color: Color(0xFF575959)),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 20,
          ),
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0), // text padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
