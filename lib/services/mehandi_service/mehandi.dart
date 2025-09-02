import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/mehndi/mehndi_bloc.dart';
import '../../blocs/mehndi/mehndi_event.dart';
import '../../blocs/mehndi/mehndi_state.dart';
import '../../widgets/custom_card_makup.dart';
import '../../widgets/custom_card_mehndi.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';


class MehndiService extends StatelessWidget {
  final Map<String, String> mehndiArtist;

  const MehndiService({super.key, required this.mehndiArtist,});

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
        create: (context) => MehndiBloc()..add(FetchMehndi()),
        child: BlocBuilder<MehndiBloc, MehndiState>(
          builder: (context, state) {
            if (state is MehndiLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MehndiLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: CustomCardMehndiWidgets.buildSection(
                    context,
                    title: "Mehndi",
                    data: state.mehndiArtists,
                    showViewAll: false,
                    onViewAll: () {
                      if (state.mehndiArtists.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MehndiService(
                              mehndiArtist: state.mehndiArtists[0], // pass the first artist
                            ),
                          ),
                        );
                      }
                    },

                  ),
                ),
              );
            } else if (state is MehndiLoadedError) {
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
