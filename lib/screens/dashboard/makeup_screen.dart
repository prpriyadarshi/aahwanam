import 'package:aahwanam/blocs/makeup/makeup_bloc.dart';
import 'package:aahwanam/blocs/makeup/makeup_event.dart';
import 'package:aahwanam/blocs/makeup/makeup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_image_card_widget.dart';

class MakeupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('MakeUp'),
      ),

      body: BlocProvider(
        create: (context) => MakeupBloc()..add(FetchMakeup()),
        child: BlocBuilder<MakeupBloc, MakeupState>(
          builder: (context, state) {
            if (state is MakeupLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MakeupLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Reduced vertical padding
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomCircleWidget(
                        heading: "Makeup Look",
                        categories: state.makeUpLook,
                        showViewAll: true,
                        onCategoryTap: (String categoryName) {
                          // Map category names to route names
                          final Map<String, String> categoryRoutes = {
                            // Add more categories and routes here
                          };

                          final routeName = categoryRoutes[categoryName];
                          if (routeName != null) {
                            Navigator.pushNamed(context, routeName);
                          } else {
                            // Handle cases where a route is not mapped
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No route available for $categoryName')),
                            );
                          }
                        },
                        onViewAll: () {},

                      ),


                      const SizedBox(height: 2),

                      CustomCircleWidget(
                        heading: "Hair Style Look",
                        categories: state.hairStyleLook,
                        showViewAll: true,
                        onCategoryTap: (String categoryName) {
                          // Map category names to route names
                          final Map<String, String> categoryRoutes = {
                            // Add more categories and routes here
                          };

                          final routeName = categoryRoutes[categoryName];
                          if (routeName != null) {
                            Navigator.pushNamed(context, routeName);
                          } else {
                            // Handle cases where a route is not mapped
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No route available for $categoryName')),
                            );
                          }
                        },
                        onViewAll: () {},

                      ),


                      const SizedBox(height: 2),
                      // Decorators Section
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Makeup & Hair Artists",
                        data: state.makeupAndHairArtists,
                        showViewAll: true,

                        onViewAll: () => _navigateTo(context, "Decorators"),
                      ),


                      // Trending Section
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0), // No left padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Trending Looks",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF575959),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _navigateTo(context, "Trending"),
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
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.trendingLooks.length,
                            itemBuilder: (context, index) {
                              final item = state.trendingLooks[index];
                              return CustomImageCard(
                                imageUrl: item['image']!,
                                isAsset: item['image']!.startsWith('assets/'),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
              );
            } else if (state is MakeupError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Welcome to Dashboard!'));
          },
        ),
      ),
    );
  }
}

void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}
