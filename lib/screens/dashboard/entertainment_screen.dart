import 'package:aahwanam/blocs/entertainment/entertainment_bloc.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_event.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_language_dropdown.dart';

class EntertainmentScreen extends StatefulWidget {
  @override
  _EntertainmentScreenState createState() => _EntertainmentScreenState();
}


class _EntertainmentScreenState extends State<EntertainmentScreen> {
  @override
  final List<String> languages = ['English', 'Hindi', 'Telugu', 'Tamil'];
  String? selectedLanguage;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment'),
      ),

      body: BlocProvider(
        create: (context) => EntertainmentBloc()..add(FetchEntertainment()),
        child: BlocBuilder<EntertainmentBloc, EntertainmentState>(
          builder: (context, state) {
            if (state is EntertainmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EntertainmentLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Reduced vertical padding
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Entertainment Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "All Services",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF575959)
                            ),
                          ),
                          Flexible( // Ensures the dropdown gets a proper size within the Row
                            child: CustomDropdown(
                              hintText: "Select Language",
                              items: languages,
                              selectedItem: selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  selectedLanguage = value;
                                });
                                context.read<EntertainmentBloc>().add(UpdateSelectedEntertainmentLanguage(value!));
                              },
                              width: 160,
                              height: 30,
                            ),
                          ),
                        ],
                      ),

                      CustomCardWidgets.buildSection(
                        context,
                        title: "",
                        data: state.Services,
                        showViewAll: false,

                        onViewAll: () => _navigateTo(context, "Decorators"),
                      ),

                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
              );
            } else if (state is EntertainmentError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Welcome to Dashboard!'));
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
