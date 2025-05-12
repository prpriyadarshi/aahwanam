import 'package:aahwanam/blocs/Photographer/photographer_bloc.dart';
import 'package:aahwanam/blocs/Photographer/photographer_event.dart';
import 'package:aahwanam/blocs/Photographer/photographer_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/screens/dashboard/photostudio_details_screen.dart';
import 'package:aahwanam/widgets/custom_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoAndVideographers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Photographers")),
        body: BlocBuilder<PhotographerBloc, PhotographerState>(
          builder: (context, state) {
            if (state is PhotographerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotographerLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PhotostudioDetailsScreen()),
                          );
                        },

                        child: CustomCardWidgets.buildSection(
                          context,
                          title: "Photo & Videographers",
                          data: state.photoAndvideographers,
                          showViewAll: true,
                          onViewAll: () => _navigateTo(context, "Decorators"),
                        ),
                      ),

                    ],
                  ),
                ),
              );
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


void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}
