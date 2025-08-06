import 'package:aahwanam/screens/dashboard/photo_gallery.dart';
import 'package:aahwanam/screens/dashboard/reviewList.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_ChangeAddressSheet.dart';
import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_date_time_bottom_sheet.dart';
import '../../widgets/custom_event_date_time _picker.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/pandit_service_screen.dart';
import 'media_gallery.dart';

class PoojaDetailPage extends StatefulWidget {
  final Map<String, dynamic> pooja;

  const PoojaDetailPage({Key? key, required this.pooja}) : super(key: key);

  @override
  State<PoojaDetailPage> createState() => _PoojaDetailPageState();
}

class _PoojaDetailPageState extends State<PoojaDetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = const TimeOfDay(hour: 11, minute: 15);
  }

  // Future<void> _pickDate() async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );
  //   if (pickedDate != null) {
  //     setState(() => selectedDate = pickedDate);
  //   }
  // }

  // Future<void> _pickTime() async {
  //   TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime ?? TimeOfDay.now(),
  //   );
  //   if (pickedTime != null) {
  //     setState(() => selectedTime = pickedTime);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("Parr and mani ${widget.pooja["media"]}");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,

                scrolledUnderElevation: 0,
                toolbarHeight: 56,
                titleSpacing: 0,
                leadingWidth: 0,
                iconTheme: const IconThemeData(color: Colors.black),
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
                pinned: true,
                floating: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(180),
                  // height for container + tabs
                  child: Column(
                    children: [

                      /// Your Container ABOVE Tabs
                  Transform.translate(
                  offset: const Offset(0, -10), // Negative Y value moves upward
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pooja["title"],
                                style: TextFontStyle.textFontStyle(
                                  16,
                                  Colors.black87,
                                  FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                widget.pooja["description"],
                                style: TextFontStyle.textFontStyle(
                                  14,
                                  Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              " ${widget.pooja["price"]}",
                              style: TextFontStyle.textFontStyle(
                                16,
                                const Color(0xFF184A45),
                                FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 26),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                const SizedBox(width: 4),
                                Text("${widget.pooja["rating"]}", style: TextFontStyle.textFontStyle( 14, Colors.black87,FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                /// TabBar BELOW container
                      TabBar(
                        indicatorColor: Colors.teal,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextFontStyle.textFontStyle(
                            18, const Color(0xFF575959), FontWeight.w500),
                        tabs: const [
                          Tab(text: "All Details"),
                          Tab(text: "Gallery"),
                          Tab(text: "Review"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },

          body: TabBarView(
            children: [
               _buildDetailsTab(widget.pooja), // ✅ Your details tab
              MediaGallery(media: List<Map<String, dynamic>>.from(widget.pooja["media"] ?? [])),

              ReviewList(
                  reviews: widget.pooja["reviews"] ?? [],
                  galleryImages: widget.pooja["gallery"] ?? [],
                ),
            ],
          ),
        ),

        /// Bottom Buttons
        bottomNavigationBar: BottomActionBar(
          onAddToCart: () {
            // Handle add to cart
          },
          onBookService: (BuildContext context) {
            print('dfghjkml,${widget.pooja}');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PanditServiceScreen(package: widget.pooja)),
            );
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
  Widget _buildDetailsTab(Map<String, dynamic> pooja) {
    print('parr and mani ${widget.pooja['category'] }');
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// About Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "About",
                    style: TextFontStyle.textFontStyle(
                        16, const Color(0xFF575959), FontWeight.w500),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 8),
            Text(
              "${pooja['About'] ?? ''} ${pooja['description'] ?? ''}",
              style: TextFontStyle.textFontStyle(
                16,
                const Color(0xFF575959),
                FontWeight.w400,
              ),
            ),

            const SizedBox(height: 16),

            /// Included Items
            if (pooja["details"] != null && pooja["details"].toString().isNotEmpty) ...[
              Text(
                "${pooja['details_heading']}-",
                style: TextFontStyle.textFontStyle(
                    16, const Color(0xFF575959), FontWeight.w500),
              ),
              const SizedBox(height: 6),

              /// Split the string by comma and trim spaces
             Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "${pooja['details']},",
                  style: TextFontStyle.textFontStyle(
                      16, const Color(0xFF575959), FontWeight.w400),
                ),
              ),
           ],
              const SizedBox(height: 20),



            /// Divider + Section Heading
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFDDDDDD),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Details & Requirements",
                  style: TextFontStyle.textFontStyle(
                      18, const Color(0xFF575959), FontWeight.w500),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFDDDDDD),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Event Date and Time Picker
            EventDateTimePicker(),

            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    "Don't know the date? Find perfect Muhurat",
                    style:
                      TextFontStyle.textFontStyle( 16, Color(0xFF757575))
                  ),
                ),

                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity, // Full width
                  child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MuhuratPopup(label:widget.pooja['category']);
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),

                    child: Text(
                      "Find My Muhurat",
                      style:
                        TextFontStyle.textFontStyle( 16, Color(0xFF184A45),FontWeight.w500)
                    ),
                  ),

                ),
              ],
            ),

            /// Guests & Bartenders

            const SizedBox(height: 40),

            /// Address Section
            CustomChangeAddressSheet(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
class MuhuratPopup extends StatelessWidget {
  final String? label;

  const MuhuratPopup({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // ✅ More balanced padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ✅ Title
             Text(
              "Assistance for Muhurat",
              style:
                TextFontStyle.textFontStyle( 18, Color(0xFF575959),FontWeight.w600)
            ),
            const SizedBox(height: 20), // ✅ Space after title

            /// ✅ Date & Time Picker
            EventDateTimePicker(label: label), // (Assuming your custom widget)
            const SizedBox(height: 20), // ✅ Space after date picker

            /// ✅ Place & Nakshatra Row
            Row(
              children: [
                Expanded(
                  child: _buildInput("Birth Place *", "City"),
                ),
                const SizedBox(width: 16), // ✅ More breathing space between inputs
                Expanded(
                  child: _buildInput("Nakshatra Name", "Xyz (Optional)"),
                ),
              ],
            ),
            const SizedBox(height: 28), // ✅ Space before button

            /// ✅ Submit Button
            Align(
              alignment: Alignment.center, // You can use Alignment.centerLeft or centerRight
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF184A45), // ✅ Dark Green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ✅ Perfect pill shape
                  ),
                  minimumSize: const Size(120, 42), // ✅ Control width & height
                  padding: const EdgeInsets.symmetric(horizontal: 54), // ✅ Extra spacing inside button
                  elevation: 0, // ✅ Flat look
                ),
                child: Text(
                  "Get Muhurat",
                  style:
                    TextFontStyle.textFontStyle( 14, Colors.white,FontWeight.w500)
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  /// ✅ Custom Input Field
  static Widget _buildInput(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
            TextFontStyle.textFontStyle( 13, Color(0xFF575959),FontWeight.w500)
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              placeholder,
              style:
                TextFontStyle.textFontStyle( 14, Color(0xFFB4B4B4)),
            ),
          ),
        ),
      ],
    );
  }
}

