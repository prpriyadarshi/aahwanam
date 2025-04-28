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
        topLeft: Radius.circular(9), // Set top-left radius
        topRight: Radius.circular(9), // Set top-right radius
      ),
      child: BottomAppBar(
        color: const Color(0xFF1E535B),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 57, // Ensure height is sufficient
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
      onTap: () => onItemTapped(index), // Call parent's onItemTapped
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22, // Decrease icon size
              color: isSelected ? Colors.white : const Color(0xFFA3B9BD),
            ),
            const SizedBox(height: 2), // Adjust spacing between icon and text
            Text(
              label,
              style: TextStyle(
                fontSize: 12, // Decrease font size
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
    final isSelected = selectedIndex == -1; // Use -1 to identify the FAB
    return GestureDetector(
      onTap: () => onItemTapped(-1), // Update selectedIndex in parent
      child: Container(
        height: 50, // Decrease FAB size
        width: 50, // Decrease FAB size
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : const Color(0xFF3E5C61), // Dynamic color
          border: Border.all(
            color: const Color(0xFF1E535B),
            width: 3, // Adjust border width
          ),
        ),
        child: Icon(
          Icons.add,
          size: 28, // Decrease icon size inside FAB
          color: isSelected ? const Color(0xFF3E5C61) : Colors.white, // Dynamic color
        ),
      ),
    );
  }
}
