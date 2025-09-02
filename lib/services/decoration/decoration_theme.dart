import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:aahwanam/widgets/custom_text_field.dart';
import '../../blocs/decor/decor_bloc.dart';
import '../../blocs/decor/decor_event.dart';
import '../../blocs/decor/decor_state.dart';
import '../../services/decoration/DecorThemesScreen.dart';
import '../../services/getquotesscreen.dart';
import '../../services/decoration/decorimagelist.dart';
import '../../services/reviewsscreen.dart';

import '../../widgets/custom_date_time_bottom_sheet.dart';

class DecorationTheme extends StatefulWidget {
  final Map<String, String> decorator;

  const DecorationTheme({super.key, required this.decorator});

  @override
  State<DecorationTheme> createState() => _DecorationThemeState();
}

class _DecorationThemeState extends State<DecorationTheme>
    with SingleTickerProviderStateMixin {
  final List<File> _selectedImages = [];
  late TabController _tabController;

  Future<void> _pickImageFromGallery() async {
    var permission = Permission.photos;
    if (await permission.request().isGranted) {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          _selectedImages.add(File(picked.path));
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DecorBloc()..add(LoadTabScreen(0)),
      child: Builder(
        builder: (context) {
          _tabController.addListener(() {
            if (!_tabController.indexIsChanging) {
              context.read<DecorBloc>().add(LoadTabScreen(_tabController.index));
            }
          });

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
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



                   SizedBox(width: 10),
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
                  Image.asset('assets/images/cart.png', width: 20, height: 20),
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
            body: BlocBuilder<DecorBloc, DecorState>(
              builder: (context, state) {
                List<Map<String, String>> themes = [];

                List<String> photos = [];
                Map<int, int> ratingData = {};
                List<String> galleryImages = [];

                if (state is GalleryLoaded) {
                  galleryImages = state.galleryImages;
                }

                if (state is ThemesLoaded) {
                  themes = state.themes;
                }
                if (state is DecorationReviewLoaded) {
                  photos = state.photos;
                  ratingData = state.ratingData;
                }
                if (state is DecorationReviewLoaded) {
                  photos = state.photos;
                  ratingData = state.ratingData;
                }

                return Column(
                    children: [
                      // Decorator top card
                      Container(
                        width: 378,
                        height: 162,
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFF4F4F4), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.decorator['image'] != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: widget.decorator['image']!.startsWith('assets/')
                                    ? Image.asset(
                                  widget.decorator['image']!,
                                  height: 90,
                                  width: 320,
                                  fit: BoxFit.cover,
                                )
                                    : Image.network(
                                  widget.decorator['image']!,
                                  height: 90,
                                  width: 308,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.decorator['name'] ?? '',
                                    style: TextFontStyle.textFontStyle(
                                      12,
                                      const Color(0xFF575959),
                                      FontWeight.w500,
                                    ),

                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Color(0xFFEFAA37), size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.decorator['rating'] ?? '0.0',
                                      style: TextFontStyle.textFontStyle(
                                        10,

                                        const Color(0xFF575959),
                                        FontWeight.w400,
                                      ),

                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.decorator['price'] ?? '',
                              style: TextFontStyle.textFontStyle(
                                12,
                                const Color(0xFF1E535B),
                                FontWeight.w600,
                              ),

                            ),
                          ],
                        ),
                      ),

                      // Tab Bar
                      TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                        dividerColor: Colors.transparent,

                        // Selected tab color & style
                        labelColor: const Color(0xFF1E535B),
                        labelStyle: TextFontStyle.textFontStyle(
                          14,
                          const Color(0xFF1E535B),
                          FontWeight.w500,
                        ),

                        // Unselected tab color & style
                        unselectedLabelColor: const Color(0xFF575959),
                        unselectedLabelStyle: TextFontStyle.textFontStyle(
                          14,
                          const Color(0xFF575959),
                          FontWeight.w400,
                        ),

                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(width: 2, color: Color(0xFF1E535B)),
                          insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                        ),

                        tabs: const [
                          Tab(text: 'Themes'),
                          Tab(text: 'Get Quotes'),
                          Tab(text: 'Gallery'),
                          Tab(text: 'Reviews'),
                        ],
                      ),


                      // Tab Views
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ThemesScreen(birthdayItems: themes),
                            const Getquotescreen(),
                             DecorImageList(), // <- pass from bloc state

                            ReviewScreen(photos: photos, ratingData: ratingData),
                          ],
                        ),
                      ),
                    ],
                  );

              },
            ),
          );
        },
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
