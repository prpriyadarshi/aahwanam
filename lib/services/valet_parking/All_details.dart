import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

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
            children: [
              Text(
                "Basic Service",
                style: TextFontStyle.textFontStyle(
                  18,
                  Color(0xFF575959),
                  FontWeight.bold,
                ),
              ),
              Text(
                "₹ 2,000",
                style: TextFontStyle.textFontStyle(
                  16,
                  Colors.teal,
                  FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            "Basic Package Bartending Service offers a fantastic choice for those who need a budget friendly valet associates for your event, so that you just relax and enjoy the event.",
            style: TextFontStyle.textFontStyle(
              14,
              Color(0xFF575959),
              FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),
          Text("Included in this Package are:",
              style: TextFontStyle.textFontStyle(
                14,
                Color(0xFF575959),
                FontWeight.w500,
              )),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                "• Professional driver can handle any type of car whether automatic or manual.",
                style: TextFontStyle.textFontStyle(
                14,
                 Color(0xFF575959),
                 FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "• Maintaining a clean and orderly environment.",
                style: TextFontStyle.textFontStyle(
                14,
                  Color(0xFF575959),
                 FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "• Answering questions about the parking.",
                style: TextFontStyle.textFontStyle(
                  14,
                  Color(0xFF575959),
                  FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
           Text(
            "Get quotes for your event",
            style: TextFontStyle.textFontStyle(
              16,
              Color(0xFF575959),
              FontWeight.bold,
            ),

          ),
          const SizedBox(height: 16),

          // Event Date and Time
          Row(
            children: [
              Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Event Date *"),
                  child:  Text("22, Feb 2025",          style: TextFontStyle.textFontStyle(
                    10,
                    const Color(0xFF575959),
                    FontWeight.w400,
                  ),),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Event Time *"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text("11:15 PM",          style: TextFontStyle.textFontStyle(
                        10,
                        const Color(0xFF575959),
                        FontWeight.w400,
                      ),),
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
                  style: TextFontStyle.textFontStyle(
                    14,
                    Color(0xFF575959),
                    FontWeight.bold,
                  ),
                  initialValue: "145",
                  decoration:
                      const InputDecoration(labelText: "No. Of Vehicle *"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  initialValue: "2",
                  decoration:
                      const InputDecoration(labelText: "No. Of Associates"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Event Address
           Text("Event Address *",
            style: TextFontStyle.textFontStyle(
              14,
              Color(0xFF575959),
              FontWeight.bold,
            ),),
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
                     Expanded(
                      child: Text(
                        "Financial District",
                        style: TextFontStyle.textFontStyle(
                          12,
                          Color(0xFF575959),
                          FontWeight.w500,
                        ),

                      ),
                    ),
                    InkWell(
                      onTap: onChangeAddress,
                      child:  Text(
                        "Change",
                        style: TextFontStyle.textFontStyle(
                          12,
                          Color(0xFF1E535B),
                          FontWeight.w500,
                        ),
                      ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                 Text(
                  "Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit.",


                    style: TextFontStyle.textFontStyle(
                    12,
                    Color(0xFF575959),
                    FontWeight.w500,
                  ),),

              ],
            ),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child:  Text(
                    "Add to cart",
                    style: TextFontStyle.textFontStyle(
                      12,
                      Color(0xFF575959),
                      FontWeight.w500,
                    ),

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
        const Text("•",
            style: TextStyle(fontSize: 20, color: Color(0xFF575959))),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextFontStyle.textFontStyle(
              12,
              Color(0xFF575959),
              FontWeight.w500,
            ),

          ),
        ),
      ],
    );
  }
}
