import 'package:flutter/material.dart';

import 'events_screen.dart';

class EventDetailsPopup extends StatelessWidget {
  final Map<String, String>? eventData;

  const EventDetailsPopup({Key? key, this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Enter Event Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Event Name Field
              TextField(
                decoration: InputDecoration(
                  labelText: "Event Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Date Field
              TextField(
                decoration: InputDecoration(
                  labelText: "Event Date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Time Field
              TextField(
                decoration: InputDecoration(
                  labelText: "Event Time",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Address Field
              TextField(
                decoration: InputDecoration(
                  labelText: "Event Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Close button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (_) => const EventScreen(showPopupOnLoad: true),
                  ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
