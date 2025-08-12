import 'package:flutter/material.dart';


import 'package:aahwanam/widgets/custom_text_field.dart';
class Bookdecoratorscreen extends StatefulWidget {
  const Bookdecoratorscreen({super.key});

  @override
  State<Bookdecoratorscreen> createState() => _BookdecoratorscreenState();
}

class _BookdecoratorscreenState extends State<Bookdecoratorscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Decor',),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
            // Example content
            Text(
              'Book your decorator with ease!',
              style: TextFontStyle.textFontStyle(
                18,
                const Color(0xFF575959),
                FontWeight.w600,
              ),

            ),
            SizedBox(height: 20),
            // Add your form fields or widgets here
          ],
        ),
      ),
    );
  }
}
