import 'package:flutter/material.dart';

class CustomAddCounterButton extends StatefulWidget {
  const CustomAddCounterButton({super.key});

  @override
  State<CustomAddCounterButton> createState() => _CustomAddCounterButtonState();
}

class _CustomAddCounterButtonState extends State<CustomAddCounterButton> {
  int count = 0;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent, // Removes dark backdrop
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Add to Cart Button
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1E535B),
                  side: const BorderSide(color: Color(0xFF1E535B)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Add to Cart'),
              ),

              // Book Decorator Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E535B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Book Decorator'),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return count == 0
        ? ElevatedButton(
      onPressed: () {
        setState(() {
          count = 1;
        });
        _showBottomSheet(); // Show bottom sheet immediately on first "Add"
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF575959),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color(0xFF1E535B)),
        ),
        textStyle: const TextStyle(fontSize: 10),
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text('Add'),
    )
        : Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF1E535B),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (count > 0) count--;
              });
            },
            child: const Icon(Icons.remove, color: Colors.white, size: 12),
          ),
          const SizedBox(width: 6),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
              _showBottomSheet(); // Show bottom sheet on increment
            },
            child: const Icon(Icons.add, color: Colors.white, size: 12),
          ),
        ],
      ),
    );
  }
}
