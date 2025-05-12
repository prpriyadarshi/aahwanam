import 'package:aahwanam/models/service_details.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';

class ServiceOverviewTab extends StatelessWidget {
  final String heading;
  final String packagePrice;
  final String description;
  final String subHeading;
  final String subHeadingDetails;
  final String eventTitle;
  final String address;
  final String addressDescription;
  final VoidCallback onChangeAddress;
  final String? label1;
  final String? label2;
  final String? initialValue1;
  final String? initialValue2;

  const ServiceOverviewTab({
    Key? key,
    required this.heading,
    required this.packagePrice,
    required this.description,
    required this.subHeading,
    required this.subHeadingDetails,
    required this.eventTitle,
    required this.address,
    required this.addressDescription,
    required this.onChangeAddress,
    this.label1,
    this.label2,
    this.initialValue1,
    this.initialValue2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(heading, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF575959))),
              Text(packagePrice, style: const TextStyle(fontSize: 14, color: Color(0xFF1E535B), fontWeight: FontWeight.w600)),
            ],
          ),

          const SizedBox(height: 10),
          Text(description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF757575))),

          const SizedBox(height: 10),
          Text(subHeading, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF575959))),
          const SizedBox(height: 8),
          Text(subHeadingDetails, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF757575))),


          const SizedBox(height: 16),

          // Event Details Centered Title
          Row(
            children: [
              const Expanded(child: Divider(color: Color(0xFFE4E4E4), thickness: 0.5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(eventTitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF575959))),
              ),
              const Expanded(child: Divider(color: Color(0xFFE4E4E4), thickness: 0.5)),
            ],
          ),

          const SizedBox(height: 16),
          const EventDateTimePicker(),
          const SizedBox(height: 16),
          // Dynamic Input Fields

            if (label1 != null && label2 != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label1!,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF575959)),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          initialValue: initialValue1 ?? '',
                          cursorColor: Color(0xFF1E535B), // Set your desired cursor color
                          decoration: InputDecoration(
                            hintText: 'Enter $label1',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF757575),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFFE4E4E4)), // Border color when NOT focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1E535B), width: 1.5), // Custom focus color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                          label2!,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF575959)),
                        ),
                        const SizedBox(height: 8),

                        TextFormField(
                          initialValue: initialValue2 ?? '',
                          cursorColor: Color(0xFF1E535B), // Set your desired cursor color
                          decoration: InputDecoration(
                            hintText: 'Enter $label2',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF757575),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFFE4E4E4)), // Border color when NOT focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1E535B), width: 1.5), // Custom focus color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            const SizedBox(height: 16),

          // Address Section
          const Text('Event Address*', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF575959))),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8.0),
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
                      child: Text(address, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF575959))),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: onChangeAddress,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF1E535B),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(color: Color(0xFF1E535B), width: 1),
                        ),
                        padding: const EdgeInsets.all(6),
                        minimumSize: const Size(0, 0),
                      ),
                      child: const Text("Change", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(addressDescription, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF757575))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
