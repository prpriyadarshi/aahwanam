import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditableInviteTemplate extends StatefulWidget {
  const EditableInviteTemplate({Key? key}) : super(key: key);

  @override
  State<EditableInviteTemplate> createState() => _EditableInviteTemplateState();
}

class _EditableInviteTemplateState extends State<EditableInviteTemplate> {
  final TextEditingController nameController = TextEditingController(text: "OLIVIA’S");
  final TextEditingController dateController = TextEditingController(text: "SATURDAY MAY 4TH");
  final TextEditingController timeController = TextEditingController(text: "At 9 pm o clock | Numbers night club\n300 westheimer rd Houston, tx");

  double fontSize = 18;
  FontWeight fontWeight = FontWeight.w400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Edit Invitation")),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/b1.jpg',
             height: 1000,
            ),
          ),

          // Text Overlays
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
               "Happy Birthday",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),

              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),

          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: Center(
              child: TextField(
                controller: dateController,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: fontSize - 2,
                  fontWeight: fontWeight,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),

          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: Center(
              child: TextField(
                controller: timeController,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.lato(
                  fontSize: fontSize - 4,
                  fontWeight: fontWeight,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),

      // Bottom Controls
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Font size"),
            DropdownButton<double>(

              items: [
                DropdownMenuItem<double>(value: 1.0, child: Text("One")),
                DropdownMenuItem<double>(value: 2.0, child: Text("Two")),
              ],
              onChanged: (value) {
                setState(() {

                });
              },
            ),

            const Text("Weight"),
            DropdownButton<FontWeight>(
              value: fontWeight,
              items: [
                FontWeight.w300,
                FontWeight.w400,
                FontWeight.w500,
                FontWeight.w700
              ]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
                  .toList(),
              onChanged: (val) => setState(() => fontWeight = val ?? FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
