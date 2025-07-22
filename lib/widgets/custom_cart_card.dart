import 'package:flutter/material.dart';

class CustomCartCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const CustomCartCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Image + Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  height: 80,
                  width: 73,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Texts and Quantity Row
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF575959),)
                    ),
                    const SizedBox(height: 4),
                    Text(description, style: const TextStyle( fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xFF757575),)),
                    const SizedBox(height: 4),
                    Text('₹$price',
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFF1E535B),)),
                  ],
                ),
              ),

              // Quantity controls (aligned vertically center)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.remove, size: 16),
                    SizedBox(width: 4),
                    Text('1', style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF575959),fontSize: 12,),),
                    SizedBox(width: 4),
                    Icon(Icons.add, size: 16),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Bottom: Full-width Event Details button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                side: const BorderSide(color: Colors.black12),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Event Details'),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
