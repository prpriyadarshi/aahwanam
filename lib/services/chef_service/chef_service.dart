import 'package:aahwanam/blocs/chef/chef_state.dart';
import 'package:aahwanam/services/chef_service/chef_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/chef/chef_bloc.dart';
import '../../blocs/chef/chef_event.dart';



import '../../widgets/custom_card_chef.dart';
import '../../widgets/custom_card_makup.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/custom_text_field.dart';

class ChefService extends StatelessWidget {
  final Map<String, String> chefs;

  const ChefService({super.key, required this.chefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 56,
        titleSpacing: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
              onPressed: () {
                Navigator.pop(context);
              },
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
      ),
      body: BlocProvider(
        create: (context) => ChefBloc()..add(FetchChefs()),
        child: BlocBuilder<ChefBloc, ChefState>(
          builder: (context, state) {
            if (state is ChefLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChefLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomCardChefWidgets.buildSection(
                    context,
                    title: "Chefs",
                    data: state.chefs,
                    showViewAll: false,
                    onViewAll: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChefDecoration(chefs: chefs),
                        ),

                      );
                    },
                  ),
                ),
              );
            } else if (state is ChefError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: TextFontStyle.textFontStyle(
        14,
        Color(0xFF575959),
        FontWeight.w500,
      ),

      decoration: InputDecoration(
        hintText: 'Search here...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
