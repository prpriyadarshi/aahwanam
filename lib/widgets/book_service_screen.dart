import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';



import '../services/proceedpay.dart';
import 'custom_ChangeAddressSheet.dart';
import 'custom_event_date_time_picker.dart';
import 'custom_inputfield.dart';
import 'custom_text_field.dart';

/// ----------------------------
/// ✅ BLoC: BookingCubit & State
/// ----------------------------
class BookingState {
  final int quantity;
  final int basePackagePrice;
  final int barTablePrice;
  final int platformFee;
  final int transportFee;

  BookingState({
    required this.quantity,
    required this.basePackagePrice,
    required this.barTablePrice,
    this.platformFee = 100,
    this.transportFee = 0,
  });

  int get total => basePackagePrice + (barTablePrice * quantity) + platformFee + transportFee;

  BookingState copyWith({int? quantity}) {
    return BookingState(
      quantity: quantity ?? this.quantity,
      basePackagePrice: basePackagePrice,
      barTablePrice: barTablePrice,
      platformFee: platformFee,
      transportFee: transportFee,
    );
  }
}

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({required int basePrice, required int barTablePrice})
      : super(BookingState(
    quantity: 1,
    basePackagePrice: basePrice,
    barTablePrice: barTablePrice,
  ));

  void incrementQuantity() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrementQuantity() {
    if (state.quantity > 1) emit(state.copyWith(quantity: state.quantity - 1));
  }
}

/// ----------------------------
/// ✅ Screen
/// ----------------------------
class BookServiceScreen extends StatelessWidget {
  final Map<String, dynamic> package;

  const BookServiceScreen({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(
        basePrice: int.parse(package["price"].replaceAll(',', '')),
        barTablePrice: 3000,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text('Book Service',
              style:  TextFontStyle.textFontStyle(  18,Colors.black,FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.black),
              onPressed: _shareBookingDetailsPdf,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ✅ Package Info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(package["imagePath"], width: 60, height: 60),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(package["title"],
                              style:  TextFontStyle.textFontStyle( 16, Colors.black87,FontWeight.bold) ),
                          const SizedBox(height: 4),
                          Text(package["description"],
                              style:  TextFontStyle.textFontStyle( 14, Colors.grey.shade700)),
                        ],
                      ),
                    ),
                    Text(
                      "₹ ${package["price"]}",
                      style: TextFontStyle.textFontStyle( 16, Color(0xFF184A45),FontWeight.bold),
                    )

                  ],
                ),
              ),

              const SizedBox(height: 20),
              package['title'] == 'Mixologist package'
                  ? buildPortableBarTableItem()
                  : SizedBox.shrink(), // Empty widget if condition is false


              /// ✅ Event & Service Details
              // const Text("Event & Service Details",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              // const Divider(color: Color(0xFFE0E0E0)),
              // const SizedBox(height: 12),
              Column(
                children: [
                  const SizedBox(height: 10), // Push it down

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDDDDDD), // Light grey color
                        ),
                      ),
                      const SizedBox(width: 10),

                      Text(
                        "Event & Service Details",
                        style:
                          TextFontStyle.textFontStyle( 18, Color(0xFF575959),FontWeight.w500)
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
                ],
              ),
              const SizedBox(height: 12),

              EventDateTimePicker(),


              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      labelText: 'No. Of Guests *',
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomInputField(
                      labelText: 'No. Of Bartenders *',

                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomChangeAddressSheet(),

              const SizedBox(height: 12),
              Column(
                children: [
                  const SizedBox(height: 10), // Push it down

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDDDDDD), // Light grey color
                        ),
                      ),
                      const SizedBox(width: 10),

                       Text(
                        "Bill Details",
                        style:
                          TextFontStyle.textFontStyle( 18, Color(0xFF575959),FontWeight.w500)
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
                ],
              ),
        BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            // ✅ Debug values

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBillRow("Package service charges", "₹ ${state.basePackagePrice}"),
                _buildBillRow("Portable bar table", "₹ ${state.barTablePrice * state.quantity}"),
                _buildBillRow("Platform Fee", "₹ ${state.platformFee}"),
                _buildBillRow("Transport Fee", "FREE", highlight: true),
                _buildBillRow("Total", "₹ ${state.total}", bold: true),
              ],
            );
          },
        ),

        ],
          ),
        ),

        /// ✅ Bottom Button
        bottomNavigationBar: Builder(
          builder: (innerContext) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
    width: double.infinity,
    child:BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            final total = state.total.toDouble(); // ✅ Direct from state
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentOptionsScreen(total: total),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E535B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          ),
          child:  Text(
            "Proceed to pay",
            style:
              TextFontStyle.textFontStyle( 14, Colors.white,FontWeight.w500),
          ),
        );
      },
    ),




    ),
    );

    },
    ),

    ),
    );
  }

  /// ✅ Portable Bar Table Item with Bloc
  Widget buildPortableBarTableItem() {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7F2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text("Portable Bar Table", style: TextFontStyle.textFontStyle( 14, Colors.black87,FontWeight.w500)),
              Row(
                children: [
                  Text(
                    "₹ ${state.barTablePrice * state.quantity}",
                    style: TextFontStyle.textFontStyle( 14, Colors.black87,FontWeight.w600),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF184A45),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => context.read<BookingCubit>().decrementQuantity(),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.remove, color: Colors.white, size: 16),
                          ),
                        ),
                        Text("${state.quantity}", style: TextFontStyle.textFontStyle( 14, Colors.white)),
                        GestureDetector(
                          onTap: () => context.read<BookingCubit>().incrementQuantity(),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.add, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// ✅ Reusable Widgets
  Widget _buildInput(String label, String value, [IconData? icon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextFontStyle.textFontStyle( 12, Colors.black87,FontWeight.w500)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: TextFontStyle.textFontStyle( 14, Colors.black87,FontWeight.w500)),
              if (icon != null) Icon(icon, size: 18, color: Colors.grey.shade600),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _shareBookingDetailsPdf() async {
    try {
      // 1. Create a new PDF document
      final pdf = pw.Document();

      // Load Unicode fonts (Roboto supports ₹)

      // 2. Add booking details to the PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  "Book Service",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                pw.SizedBox(height: 10),

                pw.Text(
                  "Event & Service Details",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                pw.SizedBox(height: 5),

                pw.Text("Event Date: 12 Sept 2025", style: pw.TextStyle(fontWeight: pw.FontWeight.normal)),
                pw.Text("Event Time: 07:30 PM", style: pw.TextStyle(fontWeight: pw.FontWeight.normal)),
                pw.Text("No. of Guests: 50", style: pw.TextStyle(fontWeight: pw.FontWeight.normal)),
                pw.Text("No. of Bartenders: 2", style: pw.TextStyle(fontWeight: pw.FontWeight.normal)),
                pw.SizedBox(height: 10),

                pw.Text(
                  "Event Address:",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text("Financial District, Hyderabad",
                    style: pw.TextStyle(       fontWeight: pw.FontWeight.normal,
                    )),
                pw.SizedBox(height: 20),

                pw.Text(
                  "Bill Details",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                pw.Divider(),

                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Package service charges", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Rs.2000", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Portable bar table", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Rs.3000", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Platform Fee", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Rs.100", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Transport Fee", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("FREE", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Divider(),

                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Total",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "Rs.5100",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

      // 3. Save PDF to temporary storage
      final dir = await getTemporaryDirectory();
      final file = File("${dir.path}/booking_details.pdf");
      await file.writeAsBytes(await pdf.save());

      // 4. Share the PDF
      await Share.shareXFiles(
        [XFile(file.path)],
        text: "Here are your booking details!",
      );
    } catch (e) {
      print("Error creating PDF: $e");
    }
  }


  Widget _buildBillRow(String label, String amount, {bool highlight = false, bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextFontStyle.textFontStyle( 14, Colors.black87, bold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style:TextFontStyle.textFontStyle( 14,highlight ?  Color(0xFF184A45) : Colors.black, bold ? FontWeight.bold : FontWeight.normal)
          ),
        ],
      ),
    );
  }
}
