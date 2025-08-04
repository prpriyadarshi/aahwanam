import 'package:flutter/material.dart';

class AllDetailsTab extends StatelessWidget {
  final VoidCallback? onChangeAddress;

  const AllDetailsTab({super.key, this.onChangeAddress});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Basic Service",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF575959),
                ),
              ),
              Text(
                "₹ 2,000",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Text(
            "Basic Package Bartending Service offers a fantastic choice for those who need a budget friendly valet associates for your event, so that you just relax and enjoy the event.",
            style: TextStyle(color: Color(0xFF575959)),
          ),
          const SizedBox(height: 16),
          const Text(
            "Included in this Package are:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF575959)),
          ),
          const SizedBox(height: 8),
          const BulletPoint(text: "Professional driver can handle any type of car whether automatic or manual."),
          const BulletPoint(text: "Maintaining a clean and order environment."),
          const BulletPoint(text: "Answering questions about the parking."),
          const SizedBox(height: 24),
          const Text(
            "Get quotes for your event",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF575959)),
          ),
          const SizedBox(height: 16),

          // Event Date and Time
          Row(
            children: [
              Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Event Date *"),
                  child: const Text("22, Feb 2025"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Event Time *"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("11:15 PM"),
                      Icon(Icons.access_time),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // No. of Vehicles and Associates
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: "145",
                  decoration: const InputDecoration(labelText: "No. Of Vehicle *"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  initialValue: "2",
                  decoration: const InputDecoration(labelText: "No. Of Associates"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Event Address
          const Text("Event Address *", style: TextStyle(color: Color(0xFF575959))),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Financial District",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575959),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onChangeAddress,
                      child: const Text(
                        "Change",
                        style: TextStyle(color: Color(0xFF1E535B)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit.",
                  style: TextStyle(color: Color(0xFF575959)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(color: Color(0xFF575959)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B),
                  ),
                  child: const Text("Book Service"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("•", style: TextStyle(fontSize: 20, color: Color(0xFF575959))),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF575959)),
          ),
        ),
      ],
    );
  }
}
