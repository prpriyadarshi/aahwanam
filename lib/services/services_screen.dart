import 'package:aahwanam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Cubit for managing navigation
class ServiceCubit extends Cubit<Widget?> {
  ServiceCubit() : super(null);

  void navigateTo(Widget route) {
    emit(route);
  }
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
    {"image": "assets/images/Invitation.png", "title": "Einvitation", "route":  AppRoutes.einvitation},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocListener<ServiceCubit, Widget?>(
        listener: (context, route) {
          if (route != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => route));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Services"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),

          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575959),
                  ),
                ),
                const SizedBox(height: 16),
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
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                          childAspectRatio:0.7,
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
                                      height: MediaQuery.of(context).size.width * 0.28, // Responsive height
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  service["title"]!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.03, // Responsive font size
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF575959),
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
}
