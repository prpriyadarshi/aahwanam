import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/screens/Packages/events_screen.dart';
import 'package:aahwanam/screens/concepts/concepts_screen.dart';
import 'package:aahwanam/services/services_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../blocs/concepts/concepts_bloc.dart';
import '../../blocs/dashboard/dashboard_bloc.dart';
import '../../blocs/dashboard/dashboard_event.dart';
import '../../blocs/dashboard/dashboard_state.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_image_card_widget.dart';
import '../account/account_screen.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardContent(), // Index 0
    ServicesScreen(),   // Index 1
    BlocProvider(
      create: (_) => ConceptsBloc(),
      child: ConceptsScreen(), // Index 2
    ),
    const AccountScreen(), // Index 3
    const EventScreen(showPopupOnLoad: true), // Index 4: Event Screen with popup flag
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('index $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _selectedIndex != 3
          ? CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      )
          : null,
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Location icon pressed");
                  },
                  child: Image.asset(
                    'assets/images/location.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hyderabad",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF575959),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Financial District, Kapil Hub",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print("cart icon pressed");
                  },
                  child: Image.asset(
                    'assets/images/cart.png',
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 10,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: Color(0xFF004d40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => DashboardBloc()..add(LoadDashboardData()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(
                child: SpinKitSpinningLines(
                  color: Color(0xFF1E535B),
                  size: 50.0,
                ),
              );
            } else if (state is DashboardLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0),
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
                          // Map category names to route namesMicrosoft Teams
                          //
                          //
                          // Profile picture.
                          // Renuka Chinthala
                          final Map<String, String> categoryRoutes = {
                            'Photographer': AppRoutes.photographer,
                            'Chef': AppRoutes.chef,
                            'Bartender': AppRoutes.bartender,
                            'Makeup': AppRoutes.makeup,
                            'Entertainment': AppRoutes.entertainment,
                            'Mehndi': AppRoutes.mehndi,
                            'Decor': AppRoutes.decor,
                            'Pandit': AppRoutes.pandit,
                          };

                          final routeName = categoryRoutes[categoryName];
                          if (routeName != null) {
                            Navigator.pushNamed(context, routeName);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No route available for $categoryName')),
                            );
                          }
                        },
                        onViewAll: () {
                          final dashboardScreenState = context.findAncestorStateOfType<_DashboardScreenState>();
                          if (dashboardScreenState != null) {
                            dashboardScreenState._onItemTapped(1);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Unable to navigate to Services tab')),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Decorators in your city",
                        data: state.decorators,
                        showViewAll: true,
                        onViewAll: () => _navigateTo(context, "Decorators"),
                      ),
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Mehndi Artists for you",
                        data: state.mehndiArtists,
                        showViewAll: true,
                        onViewAll: () => _navigateTo(context, "Mehndi Artists"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
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
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Packages for all events",
                        data: state.packagesForAllItems,
                        showViewAll: true,
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
  Navigator.pushNamed(context, '/$section');
}