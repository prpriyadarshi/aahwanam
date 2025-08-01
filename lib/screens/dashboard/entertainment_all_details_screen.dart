import 'package:aahwanam/blocs/entertainment/entertainment_bloc.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_event.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_bottom_sheet.dart';
import 'package:aahwanam/widgets/custom_photograph_servicecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntertainmentAllDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return BlocProvider(
      create: (context) => EntertainmentBloc()..add(FetchEntertainment()),
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
            Navigator.pushNamed(context, AppRoutes.entertainmentBookServiceScreen);
          },
        ),

        body: BlocBuilder<EntertainmentBloc, EntertainmentState>(
          builder: (context, state) {
            if (state is EntertainmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EntertainmentLoaded) {
              final details = state.entertainmentDetails;
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
                    label1: details.label1,
                    label2: details.label2,
                    initialValue1: details.initialValue1,
                    initialValue2: details.initialValue2,
                    address: details.address,
                    addressDescription: details.addressDescription,
                    mediaSections: details.mediaSections,
                    reviewPhotoUrls: details.reviewPhotoUrls,
                    totalRatings: details.totalRatings,
                    totalReviews: details.totalReviews,
                    averageRating: details.averageRating,
                  ));
            } else if (state is EntertainmentError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },
        ),
      ),
    );
  }
}