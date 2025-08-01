import 'package:aahwanam/screens/dashboard/photo_gallery.dart';
import 'package:aahwanam/screens/dashboard/reviewList.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/PackageDetail/package_detail_bloc.dart';
import '../../blocs/PackageDetail/package_detail_event.dart';
import '../../blocs/PackageDetail/package_detail_state.dart';
import '../../routes/app_routes.dart';
import '../../widgets/book_service_screen.dart';
import '../../widgets/custom_ChangeAddressSheet.dart';
import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/custom_inputfield.dart';


class PackageDetailScreen extends StatelessWidget {
  final Map<String, dynamic> package;
  const PackageDetailScreen({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PackageDetailBloc()..add(LoadPackageDetail(package)),
      child: BlocBuilder<PackageDetailBloc, PackageDetailState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.package?['title'] ?? ''),
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                bottom: const TabBar(
                  indicatorColor: Colors.teal,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                  fontSize: 18,

                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                  fontFamily: 'Poppins',
                ),
                  tabs: [
                    Tab(text: "All Details"),
                    Tab(text: "Gallery"),
                    Tab(text: "Review"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  // ✅ Ensure these widgets are not wrapped in Scaffold or another DefaultTabController
                  _buildDetailsTab(state),
                  PhotoGallery(photoGallery: package["photo_gallery"]),

                  ReviewList(reviews: package["reviews"], galleryImages: state.gallery),
                ],
              ),
              bottomNavigationBar: BottomActionBar(
                onAddToCart: () {
                  // Handle add to cart
                },
                onBookService: (BuildContext context) {
                  // Handle booking
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookServiceScreen(package: package)),
                  );
                },
              ),

            ),

          );


        },
      ),
    );

  }

  Widget _buildDetailsTab(PackageDetailState state) {
    return Container(
      color: Colors.white,
    child: SingleChildScrollView(

      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "About ${state.package?['title']}",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  // Font family
                  fontSize: 16,              // Size in px (Flutter uses logical pixels)
                  fontWeight: FontWeight.w500, // Equivalent to weight 500 (Medium)
                  height: 1.0,               // Line height = 100% (1.0 means 100%)
                  letterSpacing: 0.0,        // 0% letter spacing
                  color: Color(0xFF575959),  // Text color
                ),
              ),
              Text(
                "₹${state.package?['price']}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            state.package?['description'],
            style: const TextStyle(
            fontFamily: 'Poppins',
            // Font family
            fontSize: 16,              // Size in px (Flutter uses logical pixels)
            fontWeight: FontWeight.w400, // Equivalent to weight 500 (Medium)
            height: 1.5,               // Line height = 100% (1.0 means 100%)
            letterSpacing: 0.0,        // 0% letter spacing
            color: Color(0xFF575959),  // Text color
          ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Included in this Package are:",
            style:const TextStyle(
              fontSize: 16,

              fontWeight: FontWeight.w500,
              color: Color(0xFF575959),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 6),
          ...((package["included"] as List<String>)
              .map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text("• $item",
                style: const TextStyle(
              fontSize: 16,

              fontWeight: FontWeight.w400,
              color: Color(0xFF575959),
              fontFamily: 'Poppins',
            ),),
          )).toList()),
          // const SizedBox(height: 20),
          // const Divider(),
          // const SizedBox(height: 10),
          // const Text(
          //   "Details & Requirements",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Poppins'),
          // ),
         Column(
          children: [
            const SizedBox(height: 30), // Push it down

            Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFDDDDDD), // Light grey color
                ),
              ),
              const SizedBox(width: 10),

              const Text(
                "Details & Requirements",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFF575959),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ],
          ),
         ],
         ),
          const SizedBox(height: 20),

          // const SizedBox(height: 15),
          EventDateTimePicker(),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  labelText: 'No. Of Guests',
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomInputField(
                  labelText: 'No. Of Bartenders',

                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomChangeAddressSheet(),
          const SizedBox(height: 20),
        ],
      ),

    ),
    );
  }
}
