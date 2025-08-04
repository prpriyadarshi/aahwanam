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
      appBar: AppBar(title: Text('Choose Template')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TemplateEditorScreen(template: template),
              ),
            ),
            child: Card(

                child: SvgPicture.asset(
                  template.svgAssetPath,
                  fit: BoxFit.cover,

                ),

            ),
          );
        },
      ),
    );
  }
}
