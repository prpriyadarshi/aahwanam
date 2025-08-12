// widgets/entertainment_package_card.dart

import 'package:aahwanam/models/book_service_details.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomBookService extends StatelessWidget {
  final BookServiceDetails data;
  final VoidCallback onChangeAddress;

  const CustomBookService({
    Key? key,
    required this.data,
    required this.onChangeAddress,
  }) : super(key: key);

  Widget _buildDividerWithLabel(String label) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFF1F1F1), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            label,
            style: TextFontStyle.textFontStyle(
              14,
              const Color(0xFF575959),
              FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFFF1F1F1), thickness: 1)),
      ],
    );
  }

  Widget _buildChargeRow(String label, String value,
      {Color? valueColor, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextFontStyle.textFontStyle(
            13,
            const Color(0xFF575959),
            FontWeight.w400,
          ),
        ),
        Text(
          "₹ $value",
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: valueColor ?? Color(0xFF575959),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          /// Package Card
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
                  borderRadius:
                      BorderRadius.circular(8), // Subtle rounded corners
                  child: Image.asset(
                    data.imagePath ?? 'assets/images/Choreographers.png',
                    height: 90,
                    width: 90, // Make it square-ish or slightly rectangular
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextFontStyle.textFontStyle(
                          13,
                          Color(0xFF575959),
                          FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        data.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextFontStyle.textFontStyle(
                          12,
                          Color(0xFF757575),
                          FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '₹ ${data.price}${data.isPerSession ? ' / Session' : ''}',
                        style: TextFontStyle.textFontStyle(
                          14,
                          Color(0xFF1E535B),
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12),
          _buildDividerWithLabel("Event Details"),
          SizedBox(height: 16),
          EventDateTimePicker(), // your reusable custom date picker
          SizedBox(height: 16),

          if (data.label1 != null && data.label2 != null) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.label1!,
                          style: TextFontStyle.textFontStyle(
                            12,
                            Color(0xFF575959),
                            FontWeight.w500,
                          )),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: data.initialValue1 ?? '',
                        cursorColor:
                            Color(0xFF1E535B), // Set your desired cursor color
                        decoration: InputDecoration(
                          hintText: 'Enter ${data.label1}',
                          hintStyle: TextFontStyle.textFontStyle(
                            12,
                            Color(0xFF757575),
                            FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFE4E4E4)), // Border color when NOT focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1.5), // Custom focus color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.label2!,
                        style: TextFontStyle.textFontStyle(
                          12,
                          Color(0xFF575959),
                          FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: data.initialValue2 ?? '',
                        cursorColor:
                            Color(0xFF1E535B), // Set your desired cursor color
                        decoration: InputDecoration(
                          hintText: 'Enter ${data.label2}',
                          hintStyle: TextFontStyle.textFontStyle(
                            12,
                            Color(0xFF757575),
                            FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color(
                                    0xFFE4E4E4)), // Border color when NOT focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF1E535B),
                                width: 1.5), // Custom focus color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],

          SizedBox(height: 16),

          /// Event Address Section
          // Address Section
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Event Address*',
                style: TextFontStyle.textFontStyle(
                  14,
                  const Color(0xFF575959),
                  FontWeight.w500,
                ),
              )),
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
                      child: Text(data.locationTitle,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF575959))),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: onChangeAddress,
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
                      child: Text(
                        "Change",
                        style: TextFontStyle.textFontStyle(
                          10,
                          Color(0xFF575959),
                          FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(data.locationDescription,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF757575))),
              ],
            ),
          ),

          SizedBox(height: 16),
          _buildDividerWithLabel("Bill Details"),
          SizedBox(height: 16),
          _buildChargeRow('Service Charges', data.serviceCharge),
          SizedBox(height: 8),
          _buildChargeRow('Platform Fee', data.platformFee),
          SizedBox(height: 8),
          _buildChargeRow('Transport Fee', data.transportFee,
              valueColor: Color(0xFF1E535B)),
          SizedBox(height: 8),
          _buildChargeRow('Total', data.totalAmount, isBold: true),
        ],
      ),
    );
  }
}
