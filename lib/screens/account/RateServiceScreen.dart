import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_text_field.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Rate Service",
          style: TextFontStyle.textFontStyle(
            16,                         // Font size
            Color(0xFF575959),          // Text color
            FontWeight.w500,            // Font weight
          ),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 2, left: 12),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF575959),
          ),
          onPressed: () {
            Navigator.pop(context); // ✅ Go back to previous screen
            // Or use push to go to a specific screen:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
             Text(
              'Rating',
              style:TextFontStyle.textFontStyle(14,Color(0xFF575959), FontWeight.w500),
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
             Text(
              'Write Review',
              style:TextFontStyle.textFontStyle(14,Color(0xFF575959), FontWeight.w500),
            ),
            const SizedBox(height: 12),
             TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Very good service',
                hintStyle:TextFontStyle.textFontStyle(12,Color(0xFF575959), FontWeight.w500),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                hintStyle:TextFontStyle.textFontStyle(12,Color(0xFF575959), FontWeight.w500),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
             Text(
              "Add photos",
              style:TextFontStyle.textFontStyle(14,Color(0xFF575959), FontWeight.w500),
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
                  child: Text(
                    "Submit",
                    style:TextFontStyle.textFontStyle(14,Colors.white, FontWeight.w500),
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
