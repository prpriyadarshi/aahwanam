
import 'package:aahwanam/blocs/chef/chef_bloc.dart';
import 'package:aahwanam/blocs/chef/chef_event.dart';
import 'package:aahwanam/blocs/chef/chef_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_circle_widget.dart';

class ChefScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChefBloc()..add(FetchChefs()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Chefs")),
        body: BlocBuilder<ChefBloc, ChefState>(
          builder: (context, state) {
            if (state is ChefLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChefLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section
                      CustomCircleWidget(
                        heading: "Categories",
                        categories: state.Categories,
                        showViewAll: false,
                        onCategoryTap: (String categoryName) {
                          // Navigation logic or category-specific actions
                        },
                        onViewAll: () {
                          Navigator.of(context).maybePop(); // Navigate back to the parent if needed
                          // final dashboardScreenState = context.findAncestorStateOfType<_DashboardScreenState>();
                          // dashboardScreenState?._onItemTapped(1); // Navigate to the Services tab (index 1)
                        },
                      ),
                      const SizedBox(height: 2),

                      // Packages Section
                      CustomCardWidgets.buildSection(
                        context,
                        title: "Chefs for you",
                        data: state.chefs,
                        showViewAll: true,
                        onViewAll: () => _navigateTo(context, "Decorators"),
                      ),


                    ],
                  ),
                ),
              );
            } else if (state is ChefError) {
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
