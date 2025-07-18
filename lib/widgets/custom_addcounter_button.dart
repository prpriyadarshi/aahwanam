import 'package:flutter/material.dart';

import '../screens/dashboard/photograph_book_service_screen.dart';

class CustomAddCounterButton extends StatefulWidget {

  final String imagePath;
  final String price;
  final Function(int count) onAdd; // callback for when user taps +


  const CustomAddCounterButton({
    super.key,
    required this.imagePath,
    required this.price,
    required this.onAdd,
  });

  @override
  State<CustomAddCounterButton> createState() => _CustomAddCounterButtonState();
}

class _CustomAddCounterButtonState extends State<CustomAddCounterButton> {
  int count = 0;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Add to Cart'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E535B), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotographBookServiceScreen(
                          imagePath: widget.imagePath,
                          price: widget.price,
                          count: count,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Book Decorator",
                    style: TextStyle(
                      color: Colors.white, // ✅ Text color white
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            ),
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
              _showBottomSheet(context); // Show bottom sheet immediately on first "Add"
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
                  child:
                      const Icon(Icons.remove, color: Colors.white, size: 12),
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
                    _showBottomSheet(context); // Show bottom sheet on increment
                  },
                  child: const Icon(Icons.add, color: Colors.white, size: 12),
                ),
              ],
            ),
          );
  }
}
