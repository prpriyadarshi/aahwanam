import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/decor/decor_bloc.dart';
import '../../blocs/decor/decor_event.dart';
import '../../blocs/decor/decor_state.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_image_card_widget.dart';

class DecorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Decor'),
      ),

      body: BlocProvider(
        create: (context) => DecorBloc()..add(FetchDecor()),
        child: BlocBuilder<DecorBloc, DecorState>(
          builder: (context, state) {
            if (state is DecorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DecorLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Reduced vertical padding
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomCircleWidget(
                        heading: "Events & Themes",
                        categories: state.eventsAndThemes,
                        showViewAll: false,
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
                        title: "Decorators",
                        data: state.decorators,
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
                              "Recommended Decorations",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF575959),
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
                            itemCount: state.trendingDecorations.length,
                            itemBuilder: (context, index) {
                              final item = state.trendingDecorations[index];
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
            } else if (state is DecorLoadedError) {
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
