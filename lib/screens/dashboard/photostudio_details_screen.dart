import 'package:aahwanam/blocs/Photographer/photographer_bloc.dart';
import 'package:aahwanam/blocs/Photographer/photographer_event.dart';
import 'package:aahwanam/blocs/Photographer/photographer_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_bottom_sheet.dart';
import 'package:aahwanam/widgets/custom_photograph_servicecard.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_date_time_bottom_sheet.dart';

class PhotostudioDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
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
              Image.asset('assets/images/cart.png', width: 24, height: 24),
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
        bottomNavigationBar: BottomActionBar(
          onAddToCart: () {
            // Handle add to cart
          },
          onBookService: (BuildContext context) {
            // Handle booking
            Navigator.pushNamed(context, AppRoutes.bookPhotographService);
          },
        ),

        body: BlocBuilder<PhotographerBloc, PhotographerState>(
          builder: (context, state) {
            if (state is PhotographerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotographerLoaded) {
              final details = state.serviceDetails;
              return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CustomServiceCard(
                    name: details.name,
                    imagePath: details.imagePath,
                    price: details.price,
                    rating: details.rating,
                    heading: details.heading,
                    packagePrice: details.packagePrice,
                    description: details.description,
                    subHeading: details.subHeading,
                    subHeadingDetails: details.subHeadingDetails,
                    eventTitle: details.eventTitle,
                    address: details.address,
                    addressDescription: details.addressDescription,
                    mediaSections: details.mediaSections,
                    reviewPhotoUrls: details.reviewPhotoUrls,
                    totalRatings: details.totalRatings,
                    totalReviews: details.totalReviews,
                    averageRating: details.averageRating,

                  ));
            } else if (state is PhotographerError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },

        ),
      ),
    );
  }
  Widget _buildSearchBar() {
    return SizedBox(
      height: 40,
      width: 200,
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
  void _navigateTo(BuildContext context, String section) {
    // Navigation logic
    Navigator.pushNamed(context, '/$section');
  }
}