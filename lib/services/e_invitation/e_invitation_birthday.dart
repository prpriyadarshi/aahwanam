import 'package:flutter/material.dart';

class EInvitationBirthday extends StatelessWidget {
  const EInvitationBirthday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Banner Top
              Positioned(
                top: 10,
                child: Image.asset(
                  'assets/images/banner.jpg',
                  width: 300,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "YOU ARE INVITED TO",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with NetworkImage for dynamic
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Juliana Silva",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GreatVibes', // Optional for stylish text
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "18th Birthday Party",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Date & Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "JANUARY",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "15",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Text(
                            "MONDAY",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time", style: TextStyle(fontSize: 14)),
                          Text("10:00 AM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "123 Anywhere St., Any City, ST 12345",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Gifts Image
                  Image.asset(
                    'assets/images/gifts.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              // Balloons (Optional)
              Positioned(
                left: 0,
                top: 80,
                child: Image.asset('assets/images/balloon.png', height: 60),
              ),
              Positioned(
                right: 0,
                top: 80,
                child: Image.asset('assets/images/balloon.png', height: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
