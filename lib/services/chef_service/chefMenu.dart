import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/chef/chef_bloc.dart';
import '../../blocs/chef/chef_state.dart';
import '../../widgets/custom_addcounter_button.dart';
import '../../widgets/custom_text_field.dart';

class ChefMenuScreen extends StatelessWidget {
  const ChefMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefBloc, ChefState>(
      builder: (context, state) {
        if (state is ChefLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ChefMenuLoaded) {
          final menuItems = state.menuItems;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Appetizers (${menuItems.length.toString().padLeft(2, '0')})",
                      style:  TextFontStyle.textFontStyle(
                        12,
                        Color(0xFF575959),
                        FontWeight.w500,
                      ),


                    ),
                    const Icon(Icons.keyboard_arrow_up_rounded),
                  ],
                ),
                const SizedBox(height: 10),

                // Menu Items
                ...menuItems.map((item) {
                  final image = item['image'] ?? '';
                  final price = item['price'] ?? '';
                  final name = item['name'] ?? '';
                  final description = item['description'] ?? '';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Image with Heart Icon
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Right Info
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row with Dish name and Veg icon
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          name,
                                          textAlign: TextAlign.start,
                                          style:  TextFontStyle.textFontStyle(
                                            12,
                                            Color(0xFF575959),
                                            FontWeight.w500,
                                          ),


                                        ),
                                      ),
                                      Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.green),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        child: const Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),

                                  // Description
                                  Text(
                                    description,
                                    style:  TextFontStyle.textFontStyle(
                                      12,
                                      Color(0xFF575959),
                                      FontWeight.w500,
                                    ),


                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),

                                  // Add Button with price
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        price,
                                        style:  TextFontStyle.textFontStyle(
                                          14,
                                          Color(0xFF575959),
                                          FontWeight.w500,
                                        ),


                                      ),
                                      CustomAddCounterButton(
                                        imagePath: image,
                                        price: price,
                                        onAdd: (count) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        }

        return const Center(child: Text("No menu data available"));
      },
    );
  }
}