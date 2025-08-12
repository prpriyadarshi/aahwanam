import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RateServiceScreen extends StatefulWidget {
  const RateServiceScreen({super.key});

  @override
  State<RateServiceScreen> createState() => _RateServiceScreenState();
}

class _RateServiceScreenState extends State<RateServiceScreen> {
  // File? selectedImage;
  List<File> selectedImages = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImages.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Service'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            const Text(
              'Rating',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF575959),
                height: 1.0,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Write Review',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF575959),
                height: 1.0,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Very good service',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF575959),
                  height: 1.0,
                  letterSpacing: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF575959),
                  height: 1.0,
                  letterSpacing: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Add photos",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF575959),
                height: 1.0,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...selectedImages.map((imgFile) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: _buildImageBox(null, file: imgFile),
                      )),
                  GestureDetector(
                    onTap: _pickImage,
                    child: _buildImageBox(null),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 280),
            Center(
              child: SizedBox(
                width: 158,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Submit review
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(width: 1),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageBox(String? assetPath, {File? file}) {
    return Container(
      width: 96,
      height: 52,
      decoration: BoxDecoration(
        color: (assetPath == null && file == null)
            ? const Color(0xFFF8F8F8)
            : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: file != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(file, fit: BoxFit.cover),
            )
          : assetPath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(assetPath, fit: BoxFit.cover),
                )
              : const Center(child: Icon(Icons.add, color: Colors.black)),
    );
  }
}
