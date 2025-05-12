import 'package:aahwanam/blocs/entertainment/entertainment_bloc.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_event.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntertainmentAllServicesSubList extends StatelessWidget{
  const EntertainmentAllServicesSubList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntertainmentBloc()..add(FetchEntertainment()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Photographers")),
        body: BlocBuilder<EntertainmentBloc, EntertainmentState>(
          builder: (context, state) {
            if (state is EntertainmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EntertainmentLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section
                      GestureDetector(

                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.entertainmentAllDetails);
                        },

                        child: CustomCardWidgets.buildSection(
                          context,
                          title: "Choreographers",
                          data: state.Choreographers,
                          showViewAll: false,
                          onViewAll: () => _navigateTo(context, "Decorators"),
                        ),
                      ),

                    ],
                  ),
                ),
              );
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



void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}
