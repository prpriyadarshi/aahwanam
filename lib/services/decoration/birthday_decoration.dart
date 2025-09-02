import 'package:aahwanam/widgets/custom_card_birthday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/decor/decor_bloc.dart';
import '../../blocs/decor/decor_event.dart';
import '../../blocs/decor/decor_state.dart';


import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import 'decoration_theme.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';

class BirthdayDecoration extends StatelessWidget {
  final Map<String, String> decorator;

  const BirthdayDecoration({super.key, required this.decorator});

  @override
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
              icon: const Icon(Icons.arrow_back_ios_new,
                  size: 24, color: Color(0xFF1E535B)),
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.only(left: 4),
              splashRadius: 20,
              constraints: const BoxConstraints(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 40,
                width:190,
                child: _buildSearchBar(),
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
        create: (context) => DecorBloc()..add(FetchDecor()),
        child: BlocBuilder<DecorBloc, DecorState>(
          builder: (context, state) {
            if (state is DecorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DecorLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomCardBirthdayWidgets.buildSection(
                    context,
                    title: "Decorators",


                    data: state.decorators,
                    showViewAll: false,
                    onViewAll: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DecorationTheme(decorator: decorator),
                        ),

                      );
                      const SizedBox(height: 5);

                    },
                  ),

                ),

              );
            }  else {
              return const Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: 40,
      width: 210,
      child: TextField(
        style: TextFontStyle.textFontStyle(
          14,
          const Color(0xFF575959),
          FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'Search here...',
          // Padding applied only to the left of the icon
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10), // 5 px from left edge
            child: const Icon(Icons.search, size: 20, color: Color(0xFF575959)),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 25,
            minHeight: 20,
          ),
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0), // text padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
