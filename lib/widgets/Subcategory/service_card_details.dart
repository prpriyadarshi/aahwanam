import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/subcategory_model.dart';
import '../custom_ChangeAddressSheet.dart';
import '../custom_event_date_time _picker.dart';
import '../custom_text_field.dart';

class PackageDetails extends StatelessWidget {
  final EventDetails eventpackagedetails;
  final bool showIncludedPackages;
  final int quantity;
  final ValueChanged<int>? onQuantityChanged;

  // New parameter for quantity counter alignment
  final Alignment quantityCounterAlignment;


  const PackageDetails({
    Key? key,
    required this.eventpackagedetails,
    required this.showIncludedPackages,
    this.quantity = 1,
    this.onQuantityChanged,
    this.quantityCounterAlignment = Alignment.centerRight, // default to right center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                height: MediaQuery.of(context).size.height * 180 / 812,
                width: MediaQuery.of(context).size.width * 340 / 375,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            eventpackagedetails.eventImage ?? '',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 120 / 812,
                            width: MediaQuery.of(context).size.width * 320 / 375,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 6 / 812),
                        Text(
                          eventpackagedetails.title ?? 'Service Package',
                          style: TextFontStyle.textFontStyle(
                              14, const Color(0xFF575959), FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          eventpackagedetails.eventPrice ?? "",
                          style: TextFontStyle.textFontStyle(
                              14, const Color(0xFF1E535B), FontWeight.w600),
                        ),
                      ],
                    ),

                    // Positioned quantity counter
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: _buildQuantityCounter(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ... rest of your widget tree unchanged ...

            Text(
              'Description',
              style: TextFontStyle.textFontStyle(
                  16, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              eventpackagedetails.description ?? "",
              style: TextFontStyle.textFontStyle(
                  14, const Color(0xFF575959), FontWeight.w400),
            ),
            const SizedBox(height: 16),
            if (showIncludedPackages) ...[
              Text(
                'Included in this Package are',
                style: TextFontStyle.textFontStyle(
                    16, const Color(0xFF575959), FontWeight.w700),
              ),
              const SizedBox(height: 8),
              ...(eventpackagedetails.packagesIncluded ?? []).map((point) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• ",
                        style: TextFontStyle.textFontStyle(
                            14, const Color(0xFF757575), FontWeight.w400),
                      ),
                      Expanded(
                        child: Text(
                          point,
                          style: TextFontStyle.textFontStyle(
                              14, const Color(0xFF757575), FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
            Text(
              'Event Details',
              style: TextFontStyle.textFontStyle(
                  16, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 12),
            const EventDateTimePicker(),
            const SizedBox(height: 16),
            Text(
              'Event Address',
              style: TextFontStyle.textFontStyle(
                  16, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const CustomChangeAddressSheet(),
            const SizedBox(height: 16),
            Text(
              'Previous Work',
              style: TextFontStyle.textFontStyle(
                  16, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              eventpackagedetails.title ?? 'Our Work',
              style: TextFontStyle.textFontStyle(
                  14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            _buildPreviousWorkList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityCounter() {
    return Container(
      padding: const EdgeInsets.only( // ✅ FIXED: assigned to `padding`
        top: 2,
        bottom: 2,
        left: 0,
        right: 0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1E535B),
        border: Border.all(color: Color(0xFF1E535B),width: 1.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Decrement button
          SizedBox(
            width: 18,
            height: 20,
            child: IconButton(
              icon: const Icon(Icons.remove, size: 16, color: Colors.white),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                if (quantity > 0) {
                  onQuantityChanged?.call(quantity - 1);
                }
              },
              splashRadius: 20,
            ),
          ),

          // Quantity display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '$quantity',
              style: TextFontStyle.textFontStyle(
                12,
                Colors.white,
                FontWeight.w500,
              ),
            ),
          ),

          // Increment button
          SizedBox(
            width: 18,
            height: 20,
            child: IconButton(
              icon: const Icon(Icons.add, size: 16, color: Colors.white),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                onQuantityChanged?.call(quantity + 1);
              },
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviousWorkList() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventpackagedetails.perviousWorkImages?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                eventpackagedetails.perviousWorkImages?[index] ?? "",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
