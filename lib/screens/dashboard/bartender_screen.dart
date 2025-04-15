
import 'package:aahwanam/blocs/bartender/bartender_bloc.dart';
import 'package:aahwanam/blocs/bartender/bartender_event.dart';
import 'package:aahwanam/blocs/bartender/bartender_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/package_card.dart';

class BartenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BartenderBloc()..add(FetchBartender()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Bartender")),
        body: BlocBuilder<BartenderBloc, BartenderState>(
          builder: (context, state) {
            if (state is BartenderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BartenderLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Packages",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF575959),
                            ),
                          ),

                          const Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1E535B),
                            ),
                          ),


                        ],
                      ),
                      const SizedBox(height: 10),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.Packages.length,
                        itemBuilder: (context, index) {
                          final package = state.Packages[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0), // Adjust spacing between cards
                            child: PackageCard(
                              title: package['title'],
                              description: package['description'],
                              price: package['price'],
                              details: package['details'],
                              imagePath: package['imagePath'],
                              rating: package['rating'],
                            ),
                          );
                        },
                      ),



                    ],
                  ),
                ),
              );
            } else if (state is BartenderError) {
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
