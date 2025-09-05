import 'package:aahwanam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_date_time_bottom_sheet.dart';
import '../widgets/custom_text_field.dart';
// Cubit for managing navigation
class ServiceCubit extends Cubit<String?> {
  ServiceCubit() : super(null);

  // Trigger navigation
  void navigateTo(String route) => emit(route);

  // Go back
  void goBack() => emit('back');

  // Reset state so next time same route can fire again
  void clearRoute() => emit(null);
}


class ServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {"image": "assets/images/Anniversary.png", "title": "Decoration", "route": AppRoutes.decor},
    {"image": "assets/images/Bartender (1).png", "title": "Bartender", "route": AppRoutes.bartender},
    {"image": "assets/images/Chef1.png", "title": "Chef", "route":  AppRoutes.chef},
    {"image": "assets/images/Valet1.png", "title": "Valet Parking", "route":  AppRoutes.valet},
    {"image": "assets/images/Makeup (1).png", "title": "Makeup & Hair", "route":  AppRoutes.makeup},
    {"image": "assets/images/Pandit (1).png", "title": "Pandit", "route":  AppRoutes.pandit},
    {"image": "assets/images/DJ (1).png", "title": "Entertainment", "route":  AppRoutes.entertainment},
    {"image": "assets/images/Mehndi (1).png", "title": "Mehndi", "route":  AppRoutes.mehndi},
    {"image": "assets/images/Photography1.png", "title": "Photography", "route":  AppRoutes.photographer},
    {"image": "assets/images/Invitation.png", "title": "E-Invitation", "route":  AppRoutes.einvitation},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocListener<ServiceCubit, String?>(
        listener: (context, route) {
          if (route != null) {
            Navigator.pushNamed(context, route);
          }
        },
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
                Image.asset('assets/images/cart.png', width: 20, height: 20),
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

          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Services",
                  style: TextFontStyle.textFontStyle(
                    18,
                    Color(0xFF575959),
                    FontWeight.w600,
                  ),

                ),
                const SizedBox(height: 7),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate the number of columns based on screen width
                      int crossAxisCount = (constraints.maxWidth / 200).floor();
                      crossAxisCount = crossAxisCount < 2 ? 2 : crossAxisCount; // Min 2 columns

                      return GridView.builder(
                        itemCount: services.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio:0.73,
                        ),
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return GestureDetector(
                            onTap: () {
                              // Use Cubit to navigate
                              BlocProvider.of<ServiceCubit>(context).navigateTo(service["route"]);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    side: BorderSide(
                                      color: Color(0xFFF4F4F4),
                                      width: 1.0,
                                    )
                                  ),
                                  elevation: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(
                                      service["image"]!,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width * 0.28, // Responsive width
                                      height: MediaQuery.of(context).size.width * 0.30, // Responsive height
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  service["title"]!,
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle.textFontStyle(
                                    MediaQuery.of(context).size.width * 0.034,
                                    Color(0xFF575959),
                                    FontWeight.w500,
                                  ),

                                ),
                              ],
                            ),
                          );
                        },
                      );


                    },
                  ),
                                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return SizedBox(
      height: 40,
      width: 210,
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
