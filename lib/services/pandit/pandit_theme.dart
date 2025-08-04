import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/pandit/pandit_bloc.dart';
import '../../blocs/pandit/pandit_event.dart';
import '../../blocs/pandit/pandit_state.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/custom_language_dropdown.dart';

class PanditTheme extends StatefulWidget {
  const PanditTheme({super.key});

  @override
  State<PanditTheme> createState() => _PanditThemeState();
}

class _PanditThemeState extends State<PanditTheme> {
  final List<String> languages = ['English', 'Hindi', 'Telugu', 'Tamil'];
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PanditBloc()..add(FetchPandit()),
      child: Scaffold(
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
        body: BlocBuilder<PanditBloc, PanditState>(
          builder: (context, state) {
            if (state is PanditLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PanditLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    /// Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pooja Theme",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF575959),
                          ),
                        ),
                        CustomDropdown(
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
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// Pooja List
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.Theme.length,
                        itemBuilder: (context, index) {
                          final pooja = state.Theme[index];

                          return Card(
                            elevation: 1,
                            color: const Color(0xFFFFEFDF),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Title and Price
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pooja['title'] ?? '',
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Color(0xFF575959),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        pooja['price'] ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Color(0xFF1E535B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  /// Description
                                  Text(
                                    pooja['description'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF757575),
                                    ),
                                  ),

                                  /// Heading and Details
                                  if ((pooja['details_heading'] ?? '').isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        pooja['details_heading']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF575959),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),

                                  if ((pooja['details'] ?? '').isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        pooja['details']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF575959), // Updated as requested
                                        ),
                                      ),
                                    ),

                                  const SizedBox(height: 8),

                                  /// Duration
                                  Text(
                                    "Duration - ${pooja['duration'] ?? 'N/A'}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 12),

                                  /// Address and Rating
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pooja['address'] ?? '',
                                          style: const TextStyle(fontSize: 12),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, color: Colors.orange, size: 18),
                                          const SizedBox(width: 4),
                                          Text(
                                            pooja['rating'] ?? '0',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is PanditLoadedError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox.shrink();
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
