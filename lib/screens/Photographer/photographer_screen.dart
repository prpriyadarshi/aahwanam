import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Photographer/photographer_bloc.dart';
import '../../blocs/Photographer/photographer_event.dart';
import '../../blocs/Photographer/photographer_state.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/package_card.dart';

class PhotographerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
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
                      // Our Services Section
                      CustomCircleWidget(
                        heading: "Our Services",
                        categories: state.photographers,
                        showViewAll: false,
                        onCategoryTap: (String categoryName) {
                          // Navigation logic or category-specific actions
                        },
                      ),
                      const SizedBox(height: 5),

                      // Packages Section
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

                          const Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1E535B),
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
                            padding: const EdgeInsets.only(bottom: 8.0), // Adjust spacing between cards
                            child: PackageCard(
                              title: package['title'],
                              description: package['description'],
                              price: package['price'],
                              details: package['details'],
                              imagePath: package['imagePath'],
                              rating: package['rating'],
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
