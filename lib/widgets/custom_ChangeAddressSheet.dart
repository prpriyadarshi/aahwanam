import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_text_field.dart';

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

        color: const Color(0xFFFAFAFA),
        border: Border.all(width: 1, color: const Color(0xFFF4F4F4)),
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '16-6-679, Sangeet Nagar, Phase 2, Madhapur, Hyderabad, Telangana',
                  style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w400),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pincode : 500081',
                  style: TextFontStyle.textFontStyle(12, const Color(0xFF757575), FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () => _showChangeAddress(context),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(45, 30),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              side: const BorderSide(color: Color(0xFF1E535B)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: Text(
              'Change Address',
              style: TextFontStyle.textFontStyle(12, const Color(0xFF1E535B), FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

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
                Text(
                  'Change Address',
                  style: TextFontStyle.textFontStyle(18, const Color(0xFF575959), FontWeight.w600),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showAddNewAddress(context),
                    icon: const Icon(Icons.add, color: Color(0xFF1E535B)),
                    label: Text(
                      'Add New Address',
                      style: TextFontStyle.textFontStyle(14, const Color(0xFF1E535B), FontWeight.w400),
                    ),
                    style: OutlinedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      side: const BorderSide(color: Color(0xFF1E535B)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your saved address',
                  style: TextFontStyle.textFontStyle(15, const Color(0xFF575959), FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _addressTile(title: 'Financial District', subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,'),
                const SizedBox(height: 12),
                _addressTile(title: 'Madhapur', subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,'),
                const SizedBox(height: 12),
                _addressTile(title: 'Hitech City', subtitle: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,'),
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
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Address',
                    style: TextFontStyle.textFontStyle(18, const Color(0xFF575959), FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(label: 'Flat / House no / Building name *', hintText: 'Enter your Flat / House no / Building name'),
                  const SizedBox(height: 12),
                  _buildTextField(label: 'Floor', hintText: 'Floor (Optional)'),
                  const SizedBox(height: 12),
                  _buildTextField(label: 'Area / Sector / Locality *', hintText: 'Enter your area / sector / locality'),
                  const SizedBox(height: 12),
                  _buildTextField(label: 'Landmark', hintText: 'Enter landmark'),
                  const SizedBox(height: 24),
                  Text(
                    'Enter your details for seamless experience',
                    style: TextFontStyle.textFontStyle(14, const Color(0xFF757575), FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(label: 'Name *', hintText: 'Enter your name'),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Phone Number',
                    hintText: 'Enter your mobile number',
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        'Save Address',
                        style: TextFontStyle.textFontStyle(16, Colors.white, FontWeight.w500),
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
                  style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextFontStyle.textFontStyle(13, const Color(0xFF757575), FontWeight.w400),
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: Text(
              'Edit',
              style: TextFontStyle.textFontStyle(13, const Color(0xFF1E535B), FontWeight.w400),
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
          style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w400),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: keyboardType,
          inputFormatters: isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextFontStyle.textFontStyle(14, Colors.grey.shade600, FontWeight.w300),
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
