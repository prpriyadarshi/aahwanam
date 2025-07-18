import 'package:flutter/material.dart';

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
        title: const Text('Book Decor'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            // Example content
            Text(
              'Book your decorator with ease!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            // Add your form fields or widgets here
          ],
        ),
      ),
    );
  }
}
