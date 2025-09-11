import 'package:aahwanam/widgets/custom_ChangeAddressSheet.dart';
import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_field.dart';

class EventDetailsPopup extends StatelessWidget {
  const EventDetailsPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ✅ Common fixed height for all input boxes & button
    const double boxHeight = 45.0;

    textFontStyle(double size, Color color, FontWeight weight) {
      try {
        return TextFontStyle.textFontStyle(size, color, weight);
      } catch (e) {
        return TextStyle(fontSize: size, color: color, fontWeight: weight);
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Event Details",
                style:
                textFontStyle(18, const Color(0xFF575959), FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),

            // Event Name
            Text(
              "Event Name*",
              style:
              textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: boxHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border:
                  Border.all(color: const Color(0xFFE4E4E4), width: 0.8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Birthday party",
                    hintStyle: TextStyle(color: Color(0xFF757575)),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Date Time Picker (you can also wrap it in SizedBox if needed)
            EventDateTimePicker(),
            const SizedBox(height: 12),

            // Number of Guests
            Text(
              "Number Of Guests*",
              style:
              textFontStyle(14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: boxHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border:
                  Border.all(color: const Color(0xFFE4E4E4), width: 0.8),
                ),
                child: const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "250",
                    hintStyle: TextStyle(color: Color(0xFF8E8E8E)),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Address (if it has textfield inside, also use SizedBox there)
            CustomChangeAddressSheet(),
            const SizedBox(height: 18),

            // Save Button
            SizedBox(
              height: boxHeight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF01555B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Save Details",
                  style: textFontStyle(15, Colors.white, FontWeight.w600),
                ),
              ),
            ),

            // Bottom padding for keyboard overlap
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
