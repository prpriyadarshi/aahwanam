import 'package:flutter/material.dart';

import '../../widgets/custom_text_field.dart';

class ChefDetailsScreen extends StatelessWidget {
  const ChefDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chef Image Card

            const SizedBox(height: 10),

            // About Chef Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text("About Chef",
                  style: TextFontStyle.textFontStyle(
                      14,
                      const Color(0xFF575959),
                      FontWeight.w600,
                    ),
                ),
                Text(
                  "5 Yrs of Experience",

                  style: TextFontStyle.textFontStyle(
                    12,
                    const Color(0xFF1E535B),
                    FontWeight.bold,
                  ),

                ),
              ],
            ),
            const SizedBox(height: 8),
             Text(
              "Lorem ipsum dolor sit amet, dolor consectetur dolor adipiscing elit, "
                  "those who simply would like a trained bartender to pour beer and wine.",

              style: TextFontStyle.textFontStyle(
                14,
                const Color(0xFF575959),
                FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

             Text("Chef Speciality :",
              style: TextFontStyle.textFontStyle(
                14,
                const Color(0xFF575959),
                FontWeight.bold,
              ),),
            const SizedBox(height: 4),
             Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Indian",      style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Chinese", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Italian", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Fine Dinning", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Meal Preprations", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 16),

             Text("Included in this Package are:",
              style: TextFontStyle.textFontStyle(
                14,
                const Color(0xFF575959),
                FontWeight.bold,
              ),),
            const SizedBox(height: 4),
             Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Professional Chef who can create number of any kind of food.", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Responsibility for preparing food from the item given by customer.", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Maintaining a clean and order environment.", style: TextFontStyle.textFontStyle(
                    14,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                  Text("• Introduce and serve the dishes.", style: TextFontStyle.textFontStyle(
                    12,
                    const Color(0xFF575959),
                    FontWeight.w500,
                  ),),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200, // Decreased button width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle next action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B),
                    foregroundColor: Colors.white, // ✅ Text color set to white
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:  Text(
                    "Next", style: TextFontStyle.textFontStyle(
                    14,
                     Colors.white,
                    FontWeight.w500,
                  ),

                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
