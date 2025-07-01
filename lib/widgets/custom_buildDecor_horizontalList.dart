import 'package:flutter/material.dart';
import 'custom_addcounter_button.dart';

class CustomBuildDecorHorizontalList {
  final birthdayItems = [
    {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5000'},
    {'image': 'assets/images/Birthdaydecoration2.jpg', 'price': '₹5200'},
    {'image': 'assets/images/Birthdaydecoration3.jpg', 'price': '₹5400'},
    {'image': 'assets/images/Birthdaydecoration4.jpg', 'price': '₹5600'},
  ];

  static Widget build({
    required String title,
    required List<Map<String, String>> items,

  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF575959),
              ),
            ),
          ),
        ),



          SizedBox(
              height: 142,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    width: 98,
                    margin: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item['image']!,
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
                              item['price'] ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF575959),
                              ),
                            ),
                            const CustomAddCounterButton(),
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