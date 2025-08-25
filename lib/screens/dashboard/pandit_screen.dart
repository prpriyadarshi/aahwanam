import 'package:aahwanam/blocs/Pandit/Pandit_bloc.dart';
import 'package:aahwanam/blocs/pandit/pandit_event.dart';
import 'package:aahwanam/blocs/pandit/pandit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pandit/pandit_theme.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/custom_language_dropdown.dart';
import '../../widgets/custom_pandit_service.dart';
import '../../widgets/custom_text_field.dart';


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
        elevation: 0,
        automaticallyImplyLeading: false,

        scrolledUnderElevation: 0,
        toolbarHeight: 56,
        titleSpacing: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.only(left: 8),
              splashRadius: 20,
              constraints: const BoxConstraints(),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(height: 40, child: _buildSearchBar()),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      builder: (context) => CustomDateTimeBottomSheet(
                        onConfirm: (DateTime fullDateTime) {
                          print("Selected DateTime: $fullDateTime");
                        },
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(Icons.calendar_today, size: 20, color: Color(0xFF004d40)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.access_time, size: 10, color: Color(0xFF004d40)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/images/cart.png', width: 24, height: 24),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
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
                           Text(
                            "Pooja Theme",
                            style:  TextFontStyle.textFontStyle( 16, Color(0xFF575959),FontWeight.w600),
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
                    data: state.poojaTheme, // ✅ Works now
                    showViewAll: true,
                    onViewAll: () {
                      if (state.poojaTheme.isNotEmpty) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PanditTheme()));
                      }
                    },
                    showTitle: false,
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

Widget _buildSearchBar() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search here...',
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: const Color(0xFFF8F8F8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

void _navigateTo(BuildContext context, String section) {
  // Navigation logic
  Navigator.pushNamed(context, '/$section');
}
