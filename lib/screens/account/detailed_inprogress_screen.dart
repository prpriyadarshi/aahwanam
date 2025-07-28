import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_bottom_sheet.dart';
import 'package:aahwanam/widgets/custom_photograph_servicecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedInprogressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc()..add(LoadAccountInfo()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Avoid default back button
          // toolbarHeight: 80, // Custom height
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left,
                        size: 32, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => print("Time icon pressed"),
                    child: Image.asset('assets/images/timer.png',
                        width: 24, height: 24),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => print("Cart icon pressed"),
                    child: Image.asset('assets/images/cart.png',
                        width: 24, height: 24),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => print("Favorite pressed"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountLoaded) {
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
            } else if (state is AccountError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a booking"));
          },
        ),
      ),
    );
  }
}
