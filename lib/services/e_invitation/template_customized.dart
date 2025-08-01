import 'package:flutter/material.dart';

class TemplateCustomizerScreen extends StatelessWidget {
  final String imagePath;

  const TemplateCustomizerScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customize Template"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _actionButton(Icons.save_alt, "Save"),
              _actionButton(Icons.share, "Share"),
              _actionButton(Icons.download, "Download"),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
