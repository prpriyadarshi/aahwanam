import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FullImagePage extends StatelessWidget {
  final String imagePath;

  const FullImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1E535B)),
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
        ),

        title: const Text('Trend'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.share,
                color: Color.fromRGBO(30, 83, 91, 1),
              ),
            onPressed: ()  {

                shareAssetImage(imagePath);


            },),
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
              fit: BoxFit.cover, // Use BoxFit.cover to crop and fill screen
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> shareAssetImage(String assetPath) async {
  try {
    // Load asset as byte data
    final byteData = await rootBundle.load(assetPath);

    // Get temporary directory
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/shared_image.png');

    // Write asset data into the file
    await file.writeAsBytes(byteData.buffer.asUint8List());

    // Share the file
    await Share.shareXFiles([XFile(file.path)], text: 'Check this out!');
  } catch (e) {
    print('Error while sharing: $e');
  }
}