// photographer_screen.dart

import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/screens/dashboard/view_all_packages.dart';
import 'package:aahwanam/widgets/custom_combined_event_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Photographer/photographer_bloc.dart';
import '../../blocs/Photographer/photographer_event.dart';
import '../../blocs/Photographer/photographer_state.dart';
import '../../widgets/custom_circle_widget.dart';
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
        appBar: AppBar(title: const Text("Photographers")),
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
}
