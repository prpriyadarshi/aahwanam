import 'package:aahwanam/blocs/Photographer/photographer_bloc.dart';
import 'package:aahwanam/blocs/Photographer/photographer_event.dart';
import 'package:aahwanam/blocs/Photographer/photographer_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_photograph_servicecard.dart';

class ViewAllPackages extends StatelessWidget {
  final bool fromViewAll;
  final String categoryName;

  const ViewAllPackages({this.fromViewAll = false, this.categoryName = "", super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
      child: BlocBuilder<PhotographerBloc, PhotographerState>(
        builder: (context, state) {
          if (state is PhotographerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PhotographerLoaded) {
            List getListLength(String categoryName) {
              print("checking category name---------$categoryName");
              if (fromViewAll) {
                return state.packages;
              } else {
                switch (categoryName) {
                  case "Birthday":
                    return state.birthdayPackages;
                  case "Baby Shoot":
                    return state.babyShootPackages;
                  case "Prewedding":
                    return state.preWeddingPackages;
                  case "Marriage":
                    return state.fullWeddingPackages;
                }
              }
              return state.packages;
            }

            String getTitle() {
              if (fromViewAll) {
                return "All Packages for You"; // Title when 'View All' is clicked
              } else {
                return "Packages for $categoryName"; // Title for specific categories
              }
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text("View All Packages"),
                scrolledUnderElevation: 0,

              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTitle(), // Add your desired title here
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF575959),
                      ),
                    ),
                    const SizedBox(height: 16), // Add spacing between the title and the list
                    Expanded(
                      child: ListView.builder(
                        itemCount: getListLength(categoryName).length,
                        itemBuilder: (context, index) {
                          final package = getListLength(categoryName)[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0), // Adjust spacing between cards
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,AppRoutes.photoAndVideographer);
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
    );
  }
}
