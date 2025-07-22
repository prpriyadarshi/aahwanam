import 'package:aahwanam/blocs/Photographer/photographer_bloc.dart';
import 'package:aahwanam/blocs/Photographer/photographer_event.dart';
import 'package:aahwanam/blocs/Photographer/photographer_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_bottom_sheet.dart';
import 'package:aahwanam/widgets/custom_photograph_servicecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotostudioDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Photo Studio"),
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
                    tabs: [
                      const Tab(text: 'Overview'),
                      const Tab(text: 'Gallery'),
                      const Tab(text: 'Review'),
                    ],

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
}
