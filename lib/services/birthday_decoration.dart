import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../blocs/decor/decor_bloc.dart';
import '../blocs/decor/decor_event.dart';
import '../blocs/decor/decor_state.dart';
import '../screens/dashboard/decoration_theme.dart';
import '../widgets/custom_card_widget.dart';

class BirthdayDecoration extends StatelessWidget {
  final Map<String, String> decorator;

  const BirthdayDecoration({super.key, required this.decorator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildSearchBar()),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
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
                    children: [
                      Icon(Icons.calendar_today, size: 24, color: Color(0xFF004d40)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(Icons.access_time, size: 10, color: Color(0xFF004d40)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => DecorBloc()..add(FetchDecor()),
        child: BlocBuilder<DecorBloc, DecorState>(
          builder: (context, state) {
            if (state is DecorLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DecorLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomCardWidgets.buildSection(
                    context,
                    title: "Decorators",
                    data: state.decorators, // ← from Bloc state
                    showViewAll: true,
                    onViewAll: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DecorationTheme(decorator: decorator),
                        ),
                      );
                    },
                  ),
                ),
              );

            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ),

      ),
    );
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
}