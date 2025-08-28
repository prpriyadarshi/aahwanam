import 'package:aahwanam/models/subcategory_model.dart';
import 'package:flutter/material.dart';
import '../custom_ChangeAddressSheet.dart';
import '../custom_event_date_time _picker.dart';
import '../custom_text_field.dart';
import 'customAddbutton.dart';

class PackageDetails extends StatelessWidget {
  final EventDetails eventpackagedetails;
  final bool showIncludedPackages;
  final int quantity;
  final ValueChanged<int>? onQuantityChanged;

  const PackageDetails({
    Key? key,
    required this.eventpackagedetails,
    required this.showIncludedPackages,
    this.quantity = 1,
    this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 200 / 812,
                width: MediaQuery.of(context).size.width * 328 / 375,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFF4F4F4),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        eventpackagedetails.eventImage ?? '',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 118 / 812,
                        width: MediaQuery.of(context).size.width * 308 / 375,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 8 / 812),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventpackagedetails.title ?? 'Service Package',
                                style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                eventpackagedetails.eventPrice ?? "",
                                style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        // Use the new reusable button
                        CustomAddButton(
                          count: quantity,
                          onAddPressed: () {
                            // This part is for the "Add" button, which we'll handle by calling onQuantityChanged with 1
                            onQuantityChanged?.call(1);
                          },
                          onCountChanged: (newCount) {
                            onQuantityChanged?.call(newCount);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // ... rest of the code
            const SizedBox(height: 16),
            Text(
              'Description',
              style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              eventpackagedetails.description ?? "",
              style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w400),
            ),
            const SizedBox(height: 16),
            if (showIncludedPackages) ...[
              Text(
                'Included in this Package are',
                style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w700),
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
                        style: TextFontStyle.textFontStyle(14, const Color(0xFF757575), FontWeight.w400),
                      ),
                      Expanded(
                        child: Text(
                          point,
                          style: TextFontStyle.textFontStyle(14, const Color(0xFF757575), FontWeight.w400),
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
              style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const EventDateTimePicker(),
            const SizedBox(height: 16),
            Text(
              'Event Address',
              style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const CustomChangeAddressSheet(),
            const SizedBox(height: 16),
            Text(
              'Previous Work',
              style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              eventpackagedetails.title ?? 'Our Work',
              style: TextFontStyle.textFontStyle(14, const Color(0xFF575959), FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildPreviousWorkList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // The _buildQuantityCounter() method is no longer needed and can be deleted.

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