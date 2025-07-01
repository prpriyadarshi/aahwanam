import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/custom_buildDecor_horizontalList.dart';

class DecorationTheme extends StatefulWidget {
  final Map<String, String> decorator;


  const  DecorationTheme({super.key, required this.decorator});

  @override
  State<DecorationTheme> createState() => _DecorationThemeState();
}


final List<Map<String, String>> birthdayItems = [
  {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5000'},
  {'image': 'assets/images/Anniversary1.png', 'price': '₹5200'},
  {'image': 'assets/images/birthday_decor.png', 'price': '₹5400'},
  {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5600'},
  {'image': 'assets/images/baby.png', 'price': '₹5000'},
  {'image': 'assets/images/birthdayGallery3.png', 'price': '₹5200'},
  {'image': 'assets/images/dream decor1.jpg', 'price': '₹5400'},
  {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5600'}
];

// Split birthdayItems into chunks of 4
List<List<Map<String, String>>> splitList(
    List<Map<String, String>> list, int chunkSize) {
  List<List<Map<String, String>>> chunks = [];
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(
      list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize),
    );
  }
  return chunks;
}



class _DecorationThemeState extends State<DecorationTheme> {
  final List<File> _selectedImages = [];


  Future<void> _pickImageFromGallery() async {
    try {
      final permission = await Permission.photos.request(); // or Permission.storage on Android

      if (permission.isGranted) {
        final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (picked != null) {
          setState(() {
            _selectedImages.add(File(picked.path));
          });
        }
      } else {
        print('Permission denied');
        await openAppSettings(); // optional: guide user to app settings
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }





  @override
  Widget build(BuildContext context) {
    RangeValues currentRange = const RangeValues(3000, 25000);
    final safeImages = _selectedImages;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.decorator['name'] ?? 'Decorator'),

          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Column(
          children: [
            // Decorator card
            Container(
              width: 378,
              height: 162,
              margin: const EdgeInsets.only(left: 10, top: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFF4F4F4), width: 1),
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
                              height: 96,
                              width: 348,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                        widget.decorator['image']!,
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
                          widget.decorator['name'] ?? '',
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
                          const Icon(Icons.star,
                              color: Color(0xFFEFAA37), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            widget.decorator['rating'] ?? '0.0',
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
                    widget.decorator['price'] ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1E535B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              // Background of the tab bar
              child: Theme(
                data: Theme.of(context).copyWith(
                  tabBarTheme: const TabBarTheme(
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ), // For selected tab
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ), // For unselected tab
                  ),
                ),
                child: const TabBar(
                  labelColor: Color(0xFF1E535B),
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Color(0xFF1E535B),
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: 'Themes'),
                    Tab(text: 'Get Quotes'),
                    Tab(text: 'Gallery'),
                    Tab(text: 'Quotes'),
                  ],
                ),
              ),
            ),

            // Tab views
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1: Horizontal image list with heart icon

                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Birthday Decoration",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF575959),
                              ),
                            ),
                          ),
                        ),
                        ...splitList(birthdayItems, 4)
                            .map(
                                (chunk) => CustomBuildDecorHorizontalList.build(
                                      title: "", // hide title for second row
                                      items: chunk,
                                    ))
                            .toList(),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Birthday Decoration for Kids",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF575959),
                              ),
                            ),
                          ),
                        ),
                        ...splitList(birthdayItems, 4)
                            .map(
                                (chunk) => CustomBuildDecorHorizontalList.build(
                                      title: "", // hide title for second row
                                      items: chunk,
                                    ))
                            .toList(),
                      ],
                    ),
                  ),

                  // Tab 2
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Text(
                "Add Your Decoration Inspirations",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                ),
              ),
            ),

            // Image List + Picker
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20.0),
                  itemCount: safeImages.length + 1,
                  itemBuilder: (context, index) {
                    if (index < safeImages.length) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            safeImages[index],
                            width: 106,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: _pickImageFromGallery,
                          child: Container(
                            width: 106,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF1E535B),
                                    width: 1.5,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Color(0xFF1E535B),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Thoughts Input Display
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Add your thoughts",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                width: 350,
                height: 52,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Want a vibrant birthday theme filled with colors and flowers, as shown in picture.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF575959),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Budget Range Title
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Choose budget range",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),
                ),
              ),
            ),

            // Budget Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RangeSlider(
                    values: currentRange,
                    min: 1000,
                    max: 50000,
                    divisions: 49,
                    activeColor: const Color(0xFF1E535B),
                    inactiveColor: const Color(0xFFE0E0E0),
                    labels: RangeLabels(
                      '₹${currentRange.start.toInt()}',
                      '₹${currentRange.end.toInt()}',
                    ),
                    onChanged: (values) {
                      setState(() {
                        currentRange = values;
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('₹1000', style: TextStyle(fontSize: 12)),
                      Text('₹50000', style: TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Hire Button
            Center(
              child: SizedBox(
                width: 300,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // hire decorator logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text(
                    'Hire Decorator',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),


                  // Tab 3
                  const Center(child: Text("Gallery Screen")),

                  // Tab 4
                  const Center(child: Text("Quotes Screen")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
