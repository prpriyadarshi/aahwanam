import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF1E535B), // Dark Teal
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 57, // Set a smaller height for the BottomAppBar
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildNavItem(Icons.home_outlined, 'Home', 0),
            _buildNavItem(Icons.widgets_outlined, 'Services', 1),
            _buildCenterFab(), // Add FAB in the middle of the nav bar
            _buildNavItem(Icons.auto_awesome_outlined, 'Concepts', 2),
            _buildNavItem(Icons.account_circle_outlined, 'Account', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selectedIndex
        });
        widget.onItemTapped(index);
      },
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
      onTap: () {
        setState(() {
          selectedIndex = -1; // Set selectedIndex to -1 for FAB
        });
      },
      child: Container(
        height: 50, // Decrease FAB size
        width: 50,  // Decrease FAB size
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
