// lib/screens/template_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/template_model.dart';
import 'invitation_editor.dart';

class TemplateListScreen extends StatelessWidget {
  final List<TemplateModel> templates = [
    TemplateModel(
      name: 'Floral 1',
      svgAssetPath: 'assets/images/brown_floral_invitation.svg',
    ),
    TemplateModel(
      name: 'Floral 2',
      svgAssetPath: 'assets/images/brown_floral2.svg',
    ),
    TemplateModel(
      name: 'Floral 3',
      svgAssetPath: 'assets/images/brown_floral3.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Template'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3 / 4,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TemplateEditorScreen(template: template),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SvgPicture.asset(
                    template.svgAssetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      template.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
