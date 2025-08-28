import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/account/account_event.dart';
import 'package:aahwanam/blocs/account/account_state.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../services/proceedpay.dart';

class CartProceedToPayScreen extends StatelessWidget {

  final Map<String, dynamic>? booking;
  final DateTime selectedDateTime;
  final String? imagePath;
  final String? price;
  final int? count;

  const CartProceedToPayScreen({
    super.key,
    this.imagePath,
    this.price,
    this.count,
    this.booking,
    required this.selectedDateTime,
  });
  @override
  Widget build(BuildContext context) {
    double parseFee(dynamic fee) {
      if (fee == null) return 0.0;
      if (fee is num) return fee.toDouble();
      if (fee is String) {
        if (fee.toLowerCase() == 'free' || fee.trim().isEmpty) return 0.0;
        return double.tryParse(fee.replaceAll(',', '').trim()) ?? 0.0;
      }
      return 0.0;
    }

    return BlocProvider(
      create: (context) => AccountBloc()..add(LoadAccountInfo()),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title:  Text("Book Service",
            style: TextFontStyle.textFontStyle(
              16,                         // Font size
              Color(0xFF575959),          // Text color
              FontWeight.w500,            // Font weight
            ),
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(top: 2, left: 12),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Color(0xFF575959),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // or .center if you prefer
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.bookPhotographService);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E535B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50,), // controls content padding
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentOptionsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5), // 👈 decreased height
                  ),
                  child:  Text(
                    "Proceed to pay",
                    style: TextFontStyle.textFontStyle(
                      12,                         // Font size
                      Color(0xFFFFFDFC),          // Text color
                      FontWeight.w500,            // Font weight
                    ),
                  ),
                ),


              ),
            ],
          ),
        ),

        backgroundColor: Colors.white,
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountLoaded) {
              final serviceChargeNum = parseFee(booking?['price']);
              final platformFeeNum = parseFee(state.bookServiceDetails.platformFee);
              final transportFeeNum = parseFee(state.bookServiceDetails.transportFee);

              final totalAmountNum = serviceChargeNum + platformFeeNum + transportFeeNum;
              final totalAmountStr = '₹${totalAmountNum.toStringAsFixed(2)}';

              return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Package card (image + title + price)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF2E4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  booking?['imagePath'] ?? 'assets/images/Choreographers.png',
                                  height: 110,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      booking?['title'] ?? 'No Title',
                                      style:TextFontStyle.textFontStyle(13,const Color(0xFF575959), FontWeight.w500),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      booking?['description'] ?? 'No Description',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:TextFontStyle.textFontStyle(12,const Color(0xFF757575), FontWeight.w300),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '₹ ${booking?['price'] ?? '0'}${(booking?['isPerSession'] ?? false) ? ' / Session' : ''}',
                                      style:TextFontStyle.textFontStyle(14,const Color(0xFF1E535B), FontWeight.w600),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${DateFormat('dd, MMM yyyy').format(selectedDateTime)} (${DateFormat.jm().format(selectedDateTime)})',
                                      style:TextFontStyle.textFontStyle(13,const Color(0xFF575959), FontWeight.w500),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 16),

                        /// Event Address Section
                        Text('Event Address*',
                          style:TextFontStyle.textFontStyle(14,const Color(0xFF575959), FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE4E4E4)),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(state.bookServiceDetails.locationTitle,
                                      style: TextFontStyle.textFontStyle(
                                        14,                         // Font size
                                        Color(0xFF575959),          // Text color
                                        FontWeight.w500,            // Font weight
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () => _showChangeAddress(context),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: const Color(0xFF1E535B),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            color: Color(0xFF1E535B), width: 1),
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      minimumSize: const Size(0, 0),
                                    ),
                                    child:  Text("Change",
                                      style: TextFontStyle.textFontStyle(
                                        10,                         // Font size
                                        Color(0xFF1E535B),          // Text color
                                        FontWeight.w500,            // Font weight
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(state.bookServiceDetails.locationDescription,
                                style:TextFontStyle.textFontStyle(12,const Color(0xFF757575), FontWeight.w400),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Billing section
                        Row(
                          children:  [
                            Expanded(child: Divider(color: Color(0xFFF1F1F1), thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Bill Details",
                                style:TextFontStyle.textFontStyle(14,const Color(0xFF575959), FontWeight.w600),
                              ),
                            ),
                            Expanded(child: Divider(color: Color(0xFFF1F1F1), thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildChargeRow('Service Charges', booking?['price']),
                        const SizedBox(height: 8),
                        _buildChargeRow('Platform Fee', state.bookServiceDetails.platformFee),
                        const SizedBox(height: 8),
                        _buildChargeRow('Transport Fee', state.bookServiceDetails.transportFee, valueColor: Color(0xFF1E535B)),
                        const SizedBox(height: 8),
                        _buildChargeRow('Total', totalAmountStr, isBold: true),

                      ],
                    ),
                  )

              );

            } else if (state is AccountError) {
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
                style:TextFontStyle.textFontStyle(18,const Color(0xFF575959), FontWeight.w600),
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
                style:TextFontStyle.textFontStyle(15,const Color(0xFF575959), FontWeight.w500),
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
                style:TextFontStyle.textFontStyle(14,const Color(0xFF575959), FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style:TextFontStyle.textFontStyle(13,const Color(0xFF757575), FontWeight.w400),
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
            style:TextFontStyle.textFontStyle(13,const Color(0xFF1E535B), FontWeight.w400),
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
                  style:TextFontStyle.textFontStyle(18,const Color(0xFF575959), FontWeight.w500),
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
                  style:TextFontStyle.textFontStyle(14,const Color(0xFF757575), FontWeight.w400),
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
                      style:TextFontStyle.textFontStyle(16,Colors.white, FontWeight.w500),
                      // style: TextStyle(fontSize: 16,color: Colors.white),
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
        style:TextFontStyle.textFontStyle(14,Color(0xFF575959), FontWeight.w400),
      ),
      SizedBox(height: 6),
      TextField(
        keyboardType: keyboardType,
        inputFormatters: isNumberField
            ? [FilteringTextInputFormatter.digitsOnly] // 👈 Allow only numbers
            : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:TextFontStyle.textFontStyle(14,Color(0xFF757575), FontWeight.w300),
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
          fontFamily: 'Poppins',
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          color: valueColor ?? Color(0xFF757575),
          fontFamily: 'Poppins',
        ),
      ),
    ],
  );
}