// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../models/Event_model.dart';
//
//
//
// /// Main reusable ChangeAddressSheet
// class ChangeAddressSheet extends StatelessWidget {
//   final List<AddressModel> addresses;
//   final void Function(AddressModel) onEdit;
//   final void Function(AddressModel) onAdd;
//
//   const ChangeAddressSheet({
//     super.key,
//     required this.addresses,
//     required this.onEdit,
//     required this.onAdd,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.5,
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Change Address',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF575959),
//               ),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton.icon(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//                     ),
//                     builder: (context) => AddNewAddressSheet(onAdd: onAdd),
//                   );
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xFF1E535B)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 icon: const Icon(Icons.add, color: Color(0xFF1E535B)),
//                 label: const Text(
//                   'Add New Address',
//                   style: TextStyle(color: Color(0xFF1E535B)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (addresses.isNotEmpty)
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: addresses.length,
//                 itemBuilder: (context, index) {
//                   final address = addresses[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         onEdit(address);
//                         Navigator.of(context).pop();
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFFDF4EE),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     address.title,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF2B2B2B),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     address.subtitle,
//                                     style: const TextStyle(
//                                       fontSize: 13,
//                                       color: Color(0xFF6C6C6C),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Icon(Icons.edit, color: Color(0xFF1E535B)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )
//             else
//               const Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   'No addresses available. Add a new one!',
//                   style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// For adding new addresses
// class AddNewAddressSheet extends StatefulWidget {
//   final void Function(AddressModel) onAdd;
//
//   const AddNewAddressSheet({
//     super.key,
//     required this.onAdd,
//   });
//
//   @override
//   State<AddNewAddressSheet> createState() => _AddNewAddressSheetState();
// }
//
// class _AddNewAddressSheetState extends State<AddNewAddressSheet> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressLine1Controller = TextEditingController();
//   final TextEditingController _addressLine2Controller = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _zipCodeController = TextEditingController();
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressLine1Controller.dispose();
//     _addressLine2Controller.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     _zipCodeController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.7,
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Add New Address',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF575959),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               label: 'Full Name*',
//               hintText: 'Enter your name',
//               controller: _nameController,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'Phone Number*',
//               hintText: 'Enter your phone number',
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               isNumberField: true,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'Address Line 1*',
//               hintText: 'House number, Building name',
//               controller: _addressLine1Controller,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'Address Line 2 (Optional)',
//               hintText: 'Area, Colony, Street, Sector',
//               controller: _addressLine2Controller,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'City*',
//               hintText: 'Enter your city',
//               controller: _cityController,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'State*',
//               hintText: 'Enter your state',
//               controller: _stateController,
//             ),
//             const SizedBox(height: 12),
//             _buildTextField(
//               label: 'Zip Code*',
//               hintText: 'Enter your zip code',
//               controller: _zipCodeController,
//               keyboardType: TextInputType.number,
//               isNumberField: true,
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 245 / 375,
//                 height: MediaQuery.of(context).size.height * 40 / 812,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_nameController.text.isNotEmpty &&
//                         _phoneController.text.isNotEmpty &&
//                         _addressLine1Controller.text.isNotEmpty &&
//                         _cityController.text.isNotEmpty &&
//                         _stateController.text.isNotEmpty &&
//                         _zipCodeController.text.isNotEmpty) {
//                       final newAddress = AddressModel(
//                         title: _addressLine1Controller.text,
//                         subtitle:
//                         '${_addressLine2Controller.text.isNotEmpty ? '${_addressLine2Controller.text}, ' : ''}'
//                             '${_cityController.text}, ${_stateController.text} - ${_zipCodeController.text}',
//                       );
//                       widget.onAdd(newAddress);
//                       Navigator.of(context).pop(); // Pop AddNewAddressSheet
//                       Navigator.of(context).pop(); // Pop ChangeAddressSheet
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                             content: Text('Please fill in all required fields.')),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1E535B),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                   ),
//                   child: const Text(
//                     'Add Address',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFFFFFFFF),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required String hintText,
//     required TextEditingController controller,
//     TextInputType keyboardType = TextInputType.text,
//     bool isNumberField = false,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: Color(0xFF575959),
//           ),
//         ),
//         const SizedBox(height: 6),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           inputFormatters: isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null,
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(
//               color: Color(0xFF757575),
//               fontSize: 14,
//               fontWeight: FontWeight.w300,
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }




// custom_change_address_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomChangeAddressSheet extends StatelessWidget {
  const CustomChangeAddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFFE4E4E4), // This is your border color
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '16-6-679, Sangeet Nagar, Phase 2, Madhapur, Hyderabad, Telangana',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xFF575959),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pincode : 500081',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            // This button now directly calls the private method within this class/file
            onPressed: () => _showChangeAddress(context),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(45, 30),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              side: const BorderSide(color: Color(0xFF1E535B)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'Change Address',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF1E535B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Private Pop-up and helper methods for CustomChangeAddressSheet ---

  void _showChangeAddress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Change Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575959),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showAddNewAddress(context),
                    icon: const Icon(Icons.add, color: Color(0xFF1E535B)),
                    label: const Text(
                      'Add New Address',
                      style: TextStyle(color: Color(0xFF1E535B)),
                    ),
                    style: OutlinedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      side: const BorderSide(color: Color(0xFF1E535B)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Your saved address',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF575959),
                  ),
                ),
                const SizedBox(height: 16),
                _addressTile(
                  title: 'Financial District',
                  subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
                ),
                const SizedBox(height: 12),
                _addressTile(
                  title: 'Madhapur',
                  subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
                ),
                const SizedBox(height: 12),
                _addressTile(
                  title: 'Hitech City',
                  subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddNewAddress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
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
                  const Text(
                    'Add New Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF575959),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hintText: 'Enter your Flat / House no / Building name ',
                    label: 'Flat / House no / Building name *',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    hintText: 'Floor (Optional)',
                    label: 'Floor',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    hintText: 'Enter your area / sector / locality',
                    label: 'Area / Sector / Locality *',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    hintText: 'Enter landmark',
                    label: 'Landmark',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Enter your details for seamless experience',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hintText: 'Enter your name',
                    label: 'Name *',
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    hintText: 'Enter your mobile number',
                    label: 'Phone Number',
                    keyboardType: TextInputType.number,
                    isNumberField: true,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 20), () {
                          Navigator.pop(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E535B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        minimumSize: Size.zero,
                      ),
                      child: const Text(
                        'Save Address',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _addressTile({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F1),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF575959),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
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
              minimumSize: const Size(45, 30),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              side: const BorderSide(color: Color(0xFF1E535B)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
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
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF575959),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: keyboardType,
          inputFormatters: isNumberField
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
}