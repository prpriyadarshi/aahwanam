import 'package:flutter/material.dart';
import '../screens/dashboard/photograph_book_service_screen.dart';
import 'custom_addcounter_button.dart';
import 'custom_text_field.dart';

class CustomBuildDecorHorizontalList {
  final birthdayItems = [
    {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5000'},
    {'image': 'assets/images/Birthdaydecoration2.jpg', 'price': '₹5200'},
    {'image': 'assets/images/Birthdaydecoration3.jpg', 'price': '₹5400'},
    {'image': 'assets/images/Birthdaydecoration4.jpg', 'price': '₹5600'},
  ];
  final makeupHair = [
    {'name': 'Glam ', 'image': 'assets/images/Dewy.png'},
    {'name': 'Bridal', 'image': 'assets/images/Bridal.png'},
    {'name': 'Subtle Look', 'image': 'assets/images/Subtle Look.png'},
    {'name': 'HD ', 'image': 'assets/images/HD.png'},
    {'name': 'Matte', 'image': 'assets/images/Matte.png'},
    {'name': 'Natural', 'image': 'assets/images/Natural.png'},
    {'name': ' Dewy', 'image': 'assets/images/Dewy.png'},
    {'name': 'Glitter', 'image': 'assets/images/Glitter.png'},
  ];
  final chefs = [
    {'image': 'assets/images/Ambika Caters.png', 'name': 'Ambika Cooking', 'price': '₹8,000 ', 'rating': '4.7'},
    {'image': 'assets/images/Food Zone.png', 'name': 'Food Zone', 'price': '₹3,000 ', 'rating': '4.7'},
    {'image': 'assets/images/Food Hut.png', 'name': 'Food Hut', 'price': '₹15,000 ', 'rating': '4.7'},
    {'image': 'assets/images/Food Hut1.png', 'name': 'Food Hut', 'price': '₹15,000 ', 'rating': '4.7'},
    {'image': 'assets/images/Taza Kitchen.png', 'name': 'Taza Kitchen', 'price': '₹4,000 ', 'rating': '4.7'},
    {'image': 'assets/images/Taza Kitchen1.png', 'name': 'Taza Kitchen', 'price': '₹4,000 ', 'rating': '4.7'},
  ];
  final mehndiArtist = [
    {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 Onwards', 'rating': '4.5'},
    {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 Onwards', 'rating': '4.3'},
    {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 Onwards', 'rating': '4.5'},
    {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 Onwards', 'rating': '4.3'},
    {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 Onwards', 'rating': '4.5'},
    {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 Onwards', 'rating': '4.3'},
    {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 Onwards', 'rating': '4.5'},
    {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 Onwards', 'rating': '4.3'},
  ];



  static Widget build({
    required String title,
    required List<Map<String, String>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Show title only if it's not empty
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 6), // Minimal bottom space
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextFontStyle.textFontStyle(16, const Color(0xFF575959), FontWeight.w500),
              ),
            ),
          ),

        // Horizontal List
        SizedBox(
          height: 142,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final image = item['image'] ?? '';
              final price = item['price'] ?? '';

              return Container(
                width: 98,
                margin: const EdgeInsets.only(left: 8), // Removed extra top margin
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            image,
                            width: 98,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              size: 10.5,
                              color: Color(0xFFB10000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: TextFontStyle.textFontStyle(12, const Color(0xFF575959), FontWeight.w500),
                        ),
                        CustomAddCounterButton(
                          imagePath: image,
                          price: price,
                          onAdd: (count) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotographBookServiceScreen(
                                  imagePath: image,
                                  price: price,
                                  count: count,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}