import 'package:aahwanam/blocs/Pandit/Pandit_bloc.dart';
import 'package:aahwanam/blocs/pandit/pandit_event.dart';
import 'package:aahwanam/blocs/pandit/pandit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pandit/pandit_theme.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_language_dropdown.dart';
import '../../widgets/custom_pandit_service.dart';


class PanditScreen extends StatefulWidget {
  @override
  _PanditScreenState createState() => _PanditScreenState();
}

class _PanditScreenState extends State<PanditScreen> {
  @override
  final List<String> languages = ['English', 'Hindi', 'Telugu', 'Tamil'];
  String? selectedLanguage;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pandit'),
      ),

      body: BlocProvider(
        create: (context) => PanditBloc()..add(FetchPandit()),
        child: BlocBuilder<PanditBloc, PanditState>(
          builder: (context, state) {
            if (state is PanditLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PanditLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Reduced vertical padding
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pooja Theme",
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
                                context.read<PanditBloc>().add(UpdateSelectedLanguage(value!));
                              },
                              width: 160,
                              height: 30,
                            ),
                          ),
                        ],
                      ),

                      // Decorators Section
                      CustomPanditCardWidgets.buildSection(
                        context,
                        title: "Pooja Themes",
                        data: state.poojaTheme,
                        showViewAll: true,
                          onViewAll: () {
                            // Show first item or navigate to a full list page
                            if (state.poojaTheme.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PanditTheme(),
                                ),
                              );
                            }
                          }, // Or appropriate route



                      ),




                    ],
                  ),
                ),
              );
            } else if (state is PanditLoadedError) {
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
