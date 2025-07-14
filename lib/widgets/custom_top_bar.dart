import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onCalendarTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onFavoriteTap;

  const CustomTopBar({
    super.key,
    this.onBack,
    this.onSearchChanged,
    this.onCalendarTap,
    this.onCartTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: onBack ?? () => Navigator.pop(context),
            ),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 20, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: onSearchChanged,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here....",
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.calendar_today_outlined),
              onPressed: onCalendarTap,
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart_sharp),
              onPressed: onCartTap,
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: onFavoriteTap,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
