import 'package:flutter/material.dart';

class Template1 extends StatelessWidget {
  final String name;
  final String date;
  final String venue;

  Template1({required this.name, required this.date, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(top: 20, left: 20, child: Text('🎉 Happy Birthday 🎉', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          Positioned(top: 100, left: 20, child: Text(name, style: TextStyle(fontSize: 22))),
          Positioned(bottom: 60, left: 20, child: Text('Date: $date', style: TextStyle(fontSize: 18))),
          Positioned(bottom: 20, left: 20, child: Text('Venue: $venue', style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
