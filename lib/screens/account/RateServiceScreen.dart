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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scale values dynamically (adjustable ratios for responsive design)
    double fontSize(double size) => size * (screenWidth / 380);
    double boxWidth(double size) => size * (screenWidth / 400);
    double boxHeight(double size) => size * (screenHeight / 950);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Rate Service",
          style: TextFontStyle.textFontStyle(
            fontSize(16),
            const Color(0xFF575959),
            FontWeight.w500,
          ),
        ),
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
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: boxWidth(16),
          vertical: boxHeight(16),
        ),
        child: ListView(
          children: [
            Text(
              'Rating',
              style: TextFontStyle.textFontStyle(
                  fontSize(14), const Color(0xFF575959), FontWeight.w500),
            ),
            SizedBox(height: boxHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: boxWidth(14)),
                  child: Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: boxWidth(40),
                  ),
                ),
              ),
            ),
            SizedBox(height: boxHeight(24)),
            Text(
              'Write Review',
              style: TextFontStyle.textFontStyle(
                  fontSize(14), const Color(0xFF575959), FontWeight.w500),
            ),
            SizedBox(height: boxHeight(12)),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Very good service',
                hintStyle: TextFontStyle.textFontStyle(
                    fontSize(12), const Color(0xFF575959), FontWeight.w500),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: boxWidth(12), vertical: boxHeight(8)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: boxHeight(12)),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                hintStyle: TextFontStyle.textFontStyle(
                    fontSize(12), const Color(0xFF575959), FontWeight.w500),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: boxWidth(12), vertical: boxHeight(12)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: boxHeight(16)),
            Text(
              "Add photos",
              style: TextFontStyle.textFontStyle(
                  fontSize(14), const Color(0xFF575959), FontWeight.w500),
            ),
            SizedBox(height: boxHeight(8)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...selectedImages.map(
                        (imgFile) => Padding(
                      padding: EdgeInsets.only(right: boxWidth(10)),
                      child: _buildImageBox(null,
                          file: imgFile,
                          width: boxWidth(96),
                          height: boxHeight(52)),
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: _buildImageBox(null,
                        width: boxWidth(96), height: boxHeight(52)),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.25), // dynamic spacing
            Center(
              child: SizedBox(
                width: boxWidth(158),
                height: boxHeight(40),
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
                    style: TextFontStyle.textFontStyle(
                        fontSize(14), Colors.white, FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageBox(String? assetPath,
      {File? file, required double width, required double height}) {
    return Container(
      width: width,
      height: height,
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
