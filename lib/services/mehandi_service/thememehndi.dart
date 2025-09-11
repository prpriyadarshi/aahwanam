import 'package:flutter/material.dart';
import '../../widgets/custom_buildDecor_horizontalList.dart';

class ThemesMehndiScreen extends StatelessWidget {
  final Map<String, String> mehndi;
  final List<Map<String, String>> mehndiItems;

  const ThemesMehndiScreen({
    super.key,
    required this.mehndi,
    required this.mehndiItems,
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
                padding: EdgeInsets.only(left: 25, top: 0, bottom: 10),
                child: Text(
                  "Bridal Mehndi",
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
                items: splitList(mehndiItems, 4).isNotEmpty ? splitList(mehndiItems, 4)[0] : [],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25, top: 0, bottom: 10),
                child: Text(
                  "Natural Mehndi",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575959),
                  ),
                ),
              ),
              // Second Row (if exists)
              if (splitList(mehndiItems, 4).length > 1)
                CustomBuildDecorHorizontalList.build(
                  title: "",
                  items: splitList(mehndiItems, 4).isNotEmpty ? splitList(mehndiItems, 4)[0] : [],
                ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25, top: 0, bottom: 10),
            child: Text(
              "HD Mehndi",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF575959)),
            ),
          ),
          if (splitList(mehndiItems, 4).length > 1)
            CustomBuildDecorHorizontalList.build(
              title: "",
              items: splitList(mehndiItems, 4).isNotEmpty ? splitList(mehndiItems, 4)[0] : [],
            ),
        ],
      ),
    );
  }
}
