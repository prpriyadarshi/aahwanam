// import 'package:flutter/material.dart';
//
// import 'add_card_payment.dart';
//
// class PaymentOptionsPage extends StatelessWidget {
//   final double totalAmount;
//
//   const PaymentOptionsPage({Key? key, required this.totalAmount}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Payment Options",
//           style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ✅ Pay by UPI
//             const Text("Pay by UPI", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 8),
//             _buildUPISection(),
//
//             const SizedBox(height: 20),
//
//             // ✅ Cards
//             const Text("Cards", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 8),
//             _buildOptionTile(context,"assets/images/Debit Card.png", "Debit / Credit Cards",destinationPage: AddCardPage(totalAmount: totalAmount),),
//
//             const SizedBox(height: 20),
//
//             // ✅ Pay on Delivery
//             const Text("Pay On Delivery", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             const SizedBox(height: 8),
//             _buildOptionTile(context,"assets/images/cash-on-delivery.png", "Cash On Delivery"),
//           ],
//         ),
//       ),
//
//       // ✅ Bottom Button
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           width: double.infinity,
//           height: 50,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF184A45),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//             ),
//             onPressed: () {
//               // Handle Proceed to Pay action
//             },
//             child: Text(
//               "Proceed to Pay ₹${totalAmount.toStringAsFixed(0)}",
//               style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildUPISection() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             leading: Image.asset(
//               'assets/images/upi.png', // Path to your image
//               width: 40,
//               height: 40,
//               fit: BoxFit.contain,
//             ),
//             title: const Text("Pay by any UPI app"),
//             subtitle: const Text("Use any UPI app on your phone to pay"),
//             trailing: const Icon(
//               Icons.check_circle,
//               color: Color(0xFF1E535B), // Custom color
//              // ✅ Only this icon gets smaller
//             ),
//
//           ),
//           const Divider(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _buildUPIAppIcon("Paytm", "assets/images/paytm.png"),
//                 const SizedBox(width: 16),
//                 _buildUPIAppIcon("PhonePe", "assets/images/phonepe.png"),
//               ],
//             ),
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.add, color: Colors.black54),
//             title: const Text("Add new UPI ID"),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildUPIAppIcon(String label, String assetPath) {
//     return Column(
//       children: [
//         Container(
//           height: 40,
//           width: 40,
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Image.asset(assetPath, fit: BoxFit.contain),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(label, style: const TextStyle(fontSize: 12)),
//       ],
//     );
//   }
//
//
//   Widget _buildOptionTile(BuildContext context, String imagePath, String title, {Widget? destinationPage}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: ListTile(
//         leading: Image.asset(
//           imagePath,
//           width: 32,
//           height: 32,
//           fit: BoxFit.contain,
//         ),
//         title: Text(title),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: destinationPage != null
//             ? () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => destinationPage),
//           );
//         }
//             : null, // ✅ No navigation if destinationPage is null
//       ),
//     );
//   }
//
//
// }
