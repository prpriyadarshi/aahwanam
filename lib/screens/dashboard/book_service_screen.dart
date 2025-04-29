import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/screens/dashboard/view_all_packages.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Photographer/photographer_bloc.dart';
import '../../blocs/Photographer/photographer_event.dart';
import '../../blocs/Photographer/photographer_state.dart';
import '../../widgets/custom_circle_widget.dart';
import '../../widgets/package_card.dart';

class BookServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotographerBloc()..add(FetchPhotographers()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book Service"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // or .center if you prefer
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.bookService);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E535B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14), // controls content padding
                ),
                child: Text(
                  "Proceed to pay",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        backgroundColor: Colors.white,
        body: BlocBuilder<PhotographerBloc, PhotographerState>(
          builder: (context, state) {
            if (state is PhotographerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotographerLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF2E4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/bookservice.png',
                              height: 80,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Silver Package by Photo Studio',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF575959),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF757575),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '₹8,000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E535B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// 👉 Add spacing below the container here
                    SizedBox(height: 12),
                    // Event Details Section with Centered Text and Lines
                    Row(
                      children: [
                        // Left Line
                        Expanded(
                          child: Divider(
                            color: Color(0xFFF1F1F1),
                            thickness: 1,
                          ),
                        ),
                        // Text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Event Details",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF575959),
                            ),
                          ),
                        ),
                        // Right Line
                        Expanded(
                          child: Divider(
                            color: Color(0xFFF1F1F1),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16), // Add some spacing after the heading
                    EventDateTimePicker(),
                    SizedBox(height: 16), // Add some spacing after the heading

                    Text(
                      'Event Address*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575959),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE4E4E4)),
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Distribute space between title and button
                            children: [
                              Text(
                                "Financial District", // Your title here
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF575959)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _showChangeAddress(context);
                                },
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Color(0xFF1E535B), // Text color
                                  backgroundColor:
                                      Colors.white, // Button background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Rounded corners
                                    side: BorderSide(
                                        color: Color(0xFF1E535B),
                                        width: 1), // Border color and width
                                  ),
                                  padding: EdgeInsets.all(
                                      6.00), // No extra space inside the button
                                  minimumSize: Size(0,
                                      0), // Ensures the button size matches the content
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                              height:
                                  8.0), // Add spacing between Row and paragraph
                          Text(
                            "This is the paragraph text that appears below the title and button \n This is the paragraph text that appears below the title and button.",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Event Details Section with Centered Text and Lines
                    Row(
                      children: [
                        // Left Line
                        Expanded(
                          child: Divider(
                            color: Color(0xFFF1F1F1),
                            thickness: 1,
                          ),
                        ),
                        // Text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Bill Details",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF575959),
                            ),
                          ),
                        ),
                        // Right Line
                        Expanded(
                          child: Divider(
                            color: Color(0xFFF1F1F1),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),


                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChargeRow('Service Charges', '₹ 8,000'),
                        SizedBox(height: 8),
                        _buildChargeRow('Platform Fee', '100'),
                        SizedBox(height: 8),
                        _buildChargeRow(
                          'Transport Fee',
                          'FREE',
                          valueColor: Color(0xFF1E535B), // Teal color for "FREE"
                        ),
                        SizedBox(height: 8),

                        _buildChargeRow(
                          'Total',
                          '₹ 8,100',
                          isBold: true,
                        ),
                      ],
                    ),



                  ],
                ),
              );
            } else if (state is PhotographerError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Select a photographer"));
          },
        ),
      ),
    );
  }
}


void _showChangeAddress(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // important for full control
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5, // 👈 fixed height (60% of screen)
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SingleChildScrollView(  // 👈 scrolling inside content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF575959),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    _showAddNewAddress(context);
                  },
                  icon: Icon(Icons.add, color: Color(0xFF1E535B)),
                  label: Text(
                    'Add New Address',
                    style: TextStyle(color: Color(0xFF1E535B)),
                  ),
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    side: BorderSide(color: Color(0xFF1E535B)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Your saved address',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF575959),

                ),
              ),
              SizedBox(height: 16),

              /// Address Tiles
              _addressTile(
                title: 'Financial District',
                subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
              ),
              SizedBox(height: 12),
              _addressTile(
                title: 'Madhapur',
                subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
              ),
              SizedBox(height: 12),
              _addressTile(
                title: 'Hitech City',
                subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
              ),
              // SizedBox(height: 12),
              // _addressTile(
              //   title: 'Gachibowli',
              //   subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
              // ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}

Widget _addressTile({required String title, required String subtitle}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xFFFFF7F1), // light background
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF575959),

                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: Size(45, 30),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            side: BorderSide(color: Color(0xFF1E535B)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            'Edit',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF1E535B),
            ),
          ),
        ),
      ],
    ),
  );
}


void _showAddNewAddress(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF575959),
                  ),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hintText: 'Enter your Flat / House no / Building name ',
                  label: 'Flat / House no / Building name *',
                ),
                SizedBox(height: 12),
                _buildTextField(
                  hintText: 'Floor (Optional)',
                  label: 'Floor',
                ),
                SizedBox(height: 12),
                _buildTextField(
                  hintText: 'Enter your area / sector / locality',
                  label: 'Area / Sector / Locality *',
                ),
                SizedBox(height: 12),
                _buildTextField(
                  hintText: 'Enter landmark',
                  label: 'Landmark',
                ),
                SizedBox(height: 24),
                Text(
                  'Enter your details for seamless experience',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF757575),
                  ),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hintText: 'Enter your name',
                  label: 'Name *',
                ),
                SizedBox(height: 12),
                _buildTextField(
                  hintText: 'Enter your mobile number',
                  label: 'Phone Number',
                  keyboardType: TextInputType.number,
                  isNumberField: true, // 👈 NEW for phone field
                ),
                SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close Add New Address
                      Future.delayed(Duration(milliseconds: 20), () {
                        Navigator.pop(context); // Close Change Address
                      });

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1E535B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14), // 👈 Padding
                      minimumSize: Size(0, 0), // 👈 Not forcing full width
                    ),
                    child: Text(
                      'Save Address',
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Common textfield builder
Widget _buildTextField({
  required String hintText,
  required String label,
  TextInputType keyboardType = TextInputType.text,
  bool isNumberField = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF575959),
        ),
      ),
      SizedBox(height: 6),
      TextField(
        keyboardType: keyboardType,
        inputFormatters: isNumberField
            ? [FilteringTextInputFormatter.digitsOnly] // 👈 Allow only numbers
            : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF757575), // 👈 Set hint text color
            fontSize: 14,fontWeight: FontWeight.w300,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    ],
  );
}


Widget _buildChargeRow(String label, String value, {bool isBold = false, Color? valueColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: Color(0xFF575959),
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          color: valueColor ?? Color(0xFF757575),
        ),
      ),
    ],
  );
}