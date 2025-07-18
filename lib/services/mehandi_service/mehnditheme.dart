import 'dart:io';


import 'package:aahwanam/services/mehandi_service/thememehndi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../blocs/mehndi/mehndi_bloc.dart';
import '../../blocs/mehndi/mehndi_event.dart';
import '../../blocs/mehndi/mehndi_state.dart';

import '../../services/getquotesscreen.dart';

import '../../services/reviewsscreen.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import 'mehndiimagelist.dart';



class MehndiTheme extends StatefulWidget {
  final Map<String, String> mehndi;

  const MehndiTheme({super.key, required this.mehndi});

  @override
  State<MehndiTheme> createState() => _MehndiThemeState();
}

class _MehndiThemeState extends State<MehndiTheme> with SingleTickerProviderStateMixin {
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
      create: (_) => MehndiBloc()..add(LoadMehndiTabScreen(0)),
      child: Builder(
        builder: (context) {
          _tabController.addListener(() {
            if (!_tabController.indexIsChanging) {
              context.read<MehndiBloc>().add(LoadMehndiTabScreen(_tabController.index));
            }
          });

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
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
                      child: SizedBox(
                        height: 40,
                        child: _buildSearchBar(),
                      ),
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
            body: BlocBuilder<MehndiBloc, MehndiState>(
              builder: (context, state) {
                List<Map<String, String>> themes = [];
                List<String> photos = [];
                Map<int, int> ratingData = {};
                List<String> galleryImages = [];

                if (state is MehndiGalleryLoaded) {
                  galleryImages = state.galleryImages;
                }

                if (state is ThemesMehndiLoaded) {
                  themes = state.themes;
                }

                if (state is MehndiReviewLoaded) {
                  photos = state.photos;
                  ratingData = state.ratingData;
                }

                return Column(
                  children: [
                    // Top Card
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
                          if (widget.mehndi['image'] != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: widget.mehndi['image']!.startsWith('assets/')
                                  ? Image.asset(
                                widget.mehndi['image']!,
                                height: 96,
                                width: 350,
                                fit: BoxFit.cover,
                              )
                                  : Image.network(
                                widget.mehndi['image']!,
                                height: 96,
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
                                  widget.mehndi['name'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF575959),
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
                                    widget.mehndi['rating'] ?? '0.0',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF575959),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.mehndi['price'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1E535B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tabs
                    TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      dividerColor: Colors.transparent,
                      labelColor: const Color(0xFF1E535B),
                      unselectedLabelColor: Colors.black54,
                      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
                          ThemesMehndiScreen(mehndiItems: themes, mehndi: widget.mehndi ),
                          const Getquotescreen(),
                           MehndiImageList(),
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
