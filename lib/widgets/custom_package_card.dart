import 'package:flutter/material.dart';

class CustomPackageCard extends StatelessWidget {
  final String title;
  final int servicesIncluded;
  final String price;
  final String status;

  const CustomPackageCard({
    super.key,
    required this.title,
    required this.servicesIncluded,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isDelivered = status.toLowerCase() == "delivered";
    final statusColor = isDelivered ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.chevron_right, size: 20, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Including $servicesIncluded Services",
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹$price", style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(status, style: TextStyle(color: statusColor, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

}

