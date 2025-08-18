import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';


import '../services/proceedpay.dart';
import 'custom_ChangeAddressSheet.dart';
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

  int get total => basePackagePrice  + platformFee + transportFee;

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
class PanditServiceScreen extends StatelessWidget {
  final Map<String, dynamic> package;

  const PanditServiceScreen({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(
        basePrice: int.parse(package["price"].replaceAll('₹', '').replaceAll(',', '').trim()),

        barTablePrice: 3000,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false, // ✅ To avoid default back arrow
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.only(left: 8),
            splashRadius: 20,
            constraints: const BoxConstraints(),
          ),
          title: Text(
            'Book Service',
            style: TextFontStyle.textFontStyle(18, Colors.black, FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.black),
              onPressed: () {},
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
                    Image.asset(
                      (package["gallery"] != null && (package["gallery"] as List).isNotEmpty)
                          ? (package["gallery"] as List)[0]
                          : 'assets/images/placeholder.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          " ${package["price"]}",
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
                            Text("${package["rating"]}", style: TextFontStyle.textFontStyle( 14, Colors.black87,FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),


                  ],

                ),
              ),

              const SizedBox(height: 20),
              package['title'] == 'Mixologist package'
                  ? buildPortableBarTableItem()
                  : SizedBox.shrink(), // Empty widget if condition is false



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
                width: 100,
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
                        backgroundColor: const Color(0xFF184A45), // ✅ Dark Green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // ✅ Perfect pill shape
                        ),
                        minimumSize: const Size(120, 42), // ✅ Control width & height
                        padding: const EdgeInsets.symmetric(horizontal: 54), // ✅ Extra spacing inside button
                        elevation: 0, // ✅ Flat look
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