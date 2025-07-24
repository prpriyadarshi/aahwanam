import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(9),
        topRight: Radius.circular(9),
      ),
      child: BottomAppBar(
        color: const Color(0xFF1E535B),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 57,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(Icons.home_outlined, 'Home', 0),
              _buildNavItem(Icons.widgets_outlined, 'Services', 1),
              _buildCenterFab(),
              _buildNavItem(Icons.auto_awesome_outlined, 'Concepts', 2),
              _buildNavItem(Icons.account_circle_outlined, 'Account', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : const Color(0xFFA3B9BD),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? Colors.white : const Color(0xFFA3B9BD),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterFab() {
    final isSelected = selectedIndex == 4;
    return GestureDetector(
      onTap: () => onItemTapped(4),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : const Color(0xFF3E5C61),
          border: Border.all(
            color: const Color(0xFF1E535B),
            width: 3,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 28,
          color: isSelected ? const Color(0xFF3E5C61) : Colors.white,
        ),
      ),
    );
  }
}