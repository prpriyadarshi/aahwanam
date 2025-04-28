import 'package:aahwanam/blocs/eInvitation/eInvitation_bloc.dart';
import 'package:aahwanam/blocs/eInvitation/eInvitation_event.dart';
import 'package:aahwanam/blocs/eInvitation/eInvitation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/custom_template_widget.dart';

class EInvitationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EinvitationBloc()..add(FetchEinvitation()),
      child: Scaffold(
        appBar: AppBar(title: const Text("E-Invitation"),
        scrolledUnderElevation: 0),
        body: BlocBuilder<EinvitationBloc, EinvitationState>(
          builder: (context, state) {
            if (state is EinvitationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EinvitationLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Our Services Section
                      CustomCircleWidget(
                        heading: "Invitation Themes",
                        categories: state.invitationThemes,
                        showViewAll: false,
                        onCategoryTap: (String categoryName) {
                          // Navigation logic or category-specific actions
                        },
                        onViewAll: () {},

                      ),
                      const SizedBox(height: 2),

                      // Packages Section
                      CustomTemplateGrid(
                        templates: state.trendyTemplates,
                        title: 'Trendy Templates',
                        showViewAll: true,
                        onViewAll: () {
                          // Handle "View All" click
                          print('View All clicked!');
                        },
                      ),

                      const SizedBox(height: 2),

                      // Packages Section
                      CustomTemplateGrid(
                        templates: state.videoTemplates,
                        title: 'Video Templates',
                        showViewAll: true,
                        onViewAll: () {
                          // Handle "View All" click
                          print('View All clicked!');
                        },
                      ),

                    ],
                  ),
                ),
              );
            } else if (state is EinvitationError) {
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
