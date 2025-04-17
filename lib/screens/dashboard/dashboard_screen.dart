import 'package:aahwanam/routes/app_routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/dashboard/dashboard_bloc.dart';
import '../../blocs/dashboard/dashboard_event.dart';
import '../../blocs/dashboard/dashboard_state.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_image_card_widget.dart';
import '../Photographer/photographer_screen.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardContent(), // Full dashboard content
    Center(child: Text("Services")),
    Center(child: Text("Concepts")),
    Center(child: Text("Account")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),

      body: BlocProvider(
        create: (context) => DashboardBloc()..add(LoadDashboardData()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DashboardLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 5),
                      _buildSliderSection(state.sliderImages),
                      const SizedBox(height: 5),

                      CustomCircleWidget(
                        heading: "Categories",
                        categories: state.categories,
                        showViewAll: true,
                        onCategoryTap: (String categoryName) {
                          // Map category names to route names
                          final Map<String, String> categoryRoutes = {
                            'Photographer': AppRoutes.photographer,
                            'Chef': AppRoutes.chef,
                            'Bartender': AppRoutes.bartender,
                            'Makeup': AppRoutes.makeup,
                            'Entertainment': AppRoutes.entertainment,
                            'Mehndi': AppRoutes.mehndi,
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
                      ),


                      const SizedBox(height: 5),
                      // Decorators Section
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Decorators in your city",
                        data: state.decorators,
                        onViewAll: () => _navigateTo(context, "Decorators"),
                      ),

                      // Mehndi Artists Section
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Mehndi Artists for you",
                        data: state.mehndiArtists,
                        onViewAll: () => _navigateTo(context, "Mehndi Artists"),
                      ),

                      // Trending Section
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0), // No left padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Trending",
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
                            itemCount: state.trendingItems.length,
                            itemBuilder: (context, index) {
                              final item = state.trendingItems[index];
                              return CustomImageCard(
                                imageUrl: item['image']!,
                                isAsset: item['image']!.startsWith('assets/'),
                              );
                            },
                          ),
                        ),
                      ),


                      // Packages for all Section
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Packages for all events",
                        data: state.packagesForAllItems,
                        onViewAll: () => _navigateTo(context, "Mehndi Artists"),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DashboardError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Welcome to Dashboard!'));
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

Widget _buildSliderSection(List<String> images) {
  return CarouselSlider(
    items: images.map((image) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: image.startsWith('assets/')
            ? Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 146.0,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 1.0,
    ),
  );
}

void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}
