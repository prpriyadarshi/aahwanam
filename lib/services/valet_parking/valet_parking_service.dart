import 'package:aahwanam/blocs/valetParking/valetParking_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/valetParking/valetParking_bloc.dart';
import '../../blocs/valetParking/valetParking_event.dart';
import '../../widgets/custom_valet_servicecard.dart';

class ValetParkingServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return BlocProvider(
      create: (context) => ValetParkingBloc()..add(FetchValetParking()),
      child: Scaffold(




        body: BlocBuilder<ValetParkingBloc, ValetParkingState>(
          builder: (context, state) {
            if (state is ValetParkingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ValetParkingLoaded) {
              final details = state.serviceDetails;
              return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CustomValetServiceCard(


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
            } else if (state is ValetParkingError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },

        ),
      ),
    );
  }
}