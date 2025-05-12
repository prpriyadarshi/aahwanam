import 'package:flutter/material.dart';

class FullImagePage extends StatelessWidget {
  final String imagePath;

  const FullImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trend'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.share,
                color: Color.fromRGBO(30, 83, 91, 1),
              ),
              onPressed: () {}),
          // IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: InteractiveViewer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // Use BoxFit.cover to crop and fill screen
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
