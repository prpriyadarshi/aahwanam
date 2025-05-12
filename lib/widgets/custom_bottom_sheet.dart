import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  final VoidCallback onAddToCart;
  final void Function(BuildContext context) onBookService; // Accept BuildContext

  const BottomActionBar({
    Key? key,
    required this.onAddToCart,
    required this.onBookService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onAddToCart,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E535B)),
                  foregroundColor: const Color(0xFF1E535B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Add to cart'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => onBookService(context), // Pass context here
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E535B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Book Service'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
