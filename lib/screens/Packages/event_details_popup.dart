import 'package:aahwanam/widgets/custom_ChangeAddressSheet.dart';

import 'package:flutter/material.dart';
import '../../widgets/custom_event_date_time_picker.dart';
import '../../widgets/custom_text_field.dart';

class EventDetailsPopup extends StatelessWidget {
  const EventDetailsPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textFontStyle(double size, Color color, FontWeight weight) {
      try {
        return TextFontStyle.textFontStyle(size, color, weight);
      } catch (e) {
        return TextStyle(fontSize: size, color: color, fontWeight: weight);
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Event Details",
                style: textFontStyle(18, const Color(0xFF575959), FontWeight.w500),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Event Name*",
              style: textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            // Event Name TextField wrapped in a Container for border
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Container provides the background color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE4E4E4), width: 0.8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  // Removed filled: true and fillColor: Colors.white
                  hintText: "Birthday party",
                  hintStyle: const TextStyle(color: Color(0xFF757575)),
                  border: InputBorder.none, // No internal border for TextField
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding remains here for height
                ),
              ),
            ),
            const SizedBox(height: 16),
            EventDateTimePicker(),
            const SizedBox(height: 16),
            Text(
              "Number Of Guests*",
              style: textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            // Number Of Guests TextField wrapped in a Container for border
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Container provides the background color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE4E4E4), width: 0.8),
              ),
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // Removed filled: true and fillColor: Colors.white
                  hintText: "250",
                  hintStyle: TextStyle(color: Color(0xFF8E8E8E)),
                  border: InputBorder.none, // No internal border for TextField
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding remains here for height
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Event Address*",
              style: textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CustomChangeAddressSheet(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save logic
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF01555B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Save Details",
                style: textFontStyle(16, Colors.white, FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
