import 'package:flutter/material.dart';
import '../../widgets/custom_buildDecor_horizontalList.dart';

class MakeUpThemesScreen extends StatelessWidget {
  final Map<String, String> makeupHair;
  final List<Map<String, String>> makeupItems;

  const MakeUpThemesScreen({
    super.key,
    required this.makeupHair,
    required this.makeupItems,
  });

  List<List<Map<String, String>>> splitList(List<Map<String, String>> list, int chunkSize) {
    List<List<Map<String, String>>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(
        list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize),
      );
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Bridal Makeup",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF575959),
                  ),
                ),
              ),
              // First Row
              CustomBuildDecorHorizontalList.build(
                title: "",
                items: splitList(makeupItems, 4).isNotEmpty ? splitList(makeupItems, 4)[0] : [],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Natural Makeup",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF575959),
                  ),
                ),
              ),
              // Second Row (if exists)
              if (splitList(makeupItems, 4).length > 1)
                CustomBuildDecorHorizontalList.build(
                  title: "",
                  items: splitList(makeupItems, 4)[1],
                ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "HD Makeup",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF575959)),
            ),
          ),
          ...splitList(makeupItems, 4)
              .map((chunk) => CustomBuildDecorHorizontalList.build(title: "", items: chunk))
              .toList(),
        ],
      ),
    );
  }
}
