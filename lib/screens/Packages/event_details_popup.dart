import 'package:aahwanam/widgets/custom_event_date_time%20_picker.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart'; // Make sure this path is correct

class EventDetailsPopup extends StatelessWidget {
  const EventDetailsPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                style: TextFontStyle.textFontStyle(
                    18, const Color(0xFF575959), FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Event Name*",
              style: TextFontStyle.textFontStyle(
                  14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                hintText: "Birthday party",
                hintStyle: TextStyle(color: Color(0xFF8E8E8E)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            EventDateTimePicker(),
            const SizedBox(height: 16),
            Text(
              "Number Of Guests*",
              style: TextFontStyle.textFontStyle(
                  14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                hintText: "250",
                hintStyle: TextStyle(color: Color(0xFF8E8E8E)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Event Address*",
              style: TextFontStyle.textFontStyle(
                  14, const Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Financial District",
                          style: TextFontStyle.textFontStyle(
                              16, const Color(0xFF575959), FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextFontStyle.textFontStyle(
                              12, const Color(0xFF8E8E8E), FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement change address logic
                    },
                    child: Text(
                      "Change",
                      style: TextFontStyle.textFontStyle(
                          14, const Color(0xFF98858C), FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
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
                style: TextFontStyle.textFontStyle(
                    16, Colors.white, FontWeight.w600),
              ),
            ),
            // This adds bottom padding for the keyboard
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
