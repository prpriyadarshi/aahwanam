import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceBottomButtons extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onBookService;

  const ServiceBottomButtons({
    Key? key,
    required this.onAddToCart,
    required this.onBookService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onAddToCart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF1E535B),
                side: BorderSide(color: Color(0xFF1E535B)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text("Add to cart"),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: onBookService,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E535B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text("Book Service", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
