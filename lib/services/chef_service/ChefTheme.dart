import 'package:flutter/material.dart';

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
              children: const [
                Text("About Chef", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "5 Yrs of Experience",
                  style: TextStyle( color:  Color(0xFF1E535B),fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet, dolor consectetur dolor adipiscing elit, "
                  "those who simply would like a trained bartender to pour beer and wine.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            const Text("Chef Speciality :", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Indian"),
                  Text("• Chinese"),
                  Text("• Italian"),
                  Text("• Fine Dinning"),
                  Text("• Meal Preprations"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Text("Included in this Package are:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Professional Chef who can create number of any kind of food."),
                  Text("• Responsibility for preparing food from the item given by customer."),
                  Text("• Maintaining a clean and order environment."),
                  Text("• Introduce and serve the dishes."),
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
                  child: const Text(
                    "Next",

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
