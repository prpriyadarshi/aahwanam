import 'package:aahwanam/services/e_invitation/svg_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/svg_element.dart';
import '../../models/template_model.dart';


class TemplateEditorScreen extends StatefulWidget {
  final TemplateModel template;

  const TemplateEditorScreen({Key? key, required this.template})
      : super(key: key);

  @override
  State<TemplateEditorScreen> createState() => _TemplateEditorScreenState();
}

class _TemplateEditorScreenState extends State<TemplateEditorScreen> {
  String svgContent = '';
  List<SvgTextElement> svgTextElements = [];

  @override
  void initState() {
    super.initState();
    loadSvg();
  }

  Future<void> loadSvg() async {
    final content = await loadSvgString(widget.template.svgAssetPath);
    final elements = extractTextElements(content);

    setState(() {
      svgContent = content;
      svgTextElements = elements;
    });
  }

  void updateSvgAndRefresh() {
    final updated = updateSvgText(svgContent, svgTextElements);
    setState(() {
      svgContent = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Invitation')),
      body: svgContent.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.string(svgContent, fit: BoxFit.contain),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: svgTextElements.map((e) {
                return TextField(
                  decoration: InputDecoration(labelText: e.id),
                  onChanged: (value) {
                    e.text = value;
                    updateSvgAndRefresh();
                  },
                  controller: TextEditingController(text: e.text),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
