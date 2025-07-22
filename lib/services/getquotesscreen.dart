import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


import '../blocs/decor/decor_bloc.dart';
import '../blocs/decor/decor_event.dart';
import '../blocs/decor/decor_state.dart';
import 'chatscreen.dart';
import 'connectingscreen.dart';

class Getquotescreen extends StatefulWidget {
  const Getquotescreen({super.key});

  @override
  State<Getquotescreen> createState() => _GetquotescreenState();
}

class _GetquotescreenState extends State<Getquotescreen> {
  final List<File> _selectedImages = [];
  RangeValues currentRange = const RangeValues(3000, 25000);

  Future<void> _pickImageFromGallery() async {
    var permission = Permission.photos;
    if (await permission.request().isGranted) {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          _selectedImages.add(File(picked.path));
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DecorBloc()..add(LoadTabScreen(1)),
      child: BlocBuilder<DecorBloc, DecorState>(
        builder: (context, state) {
          if (state is DecorLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Add Your Decoration Inspirations",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575959),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 5.0),
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 15.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index < _selectedImages.length) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  _selectedImages[index],
                                  width: 106,
                                  height: 56,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: _pickImageFromGallery,
                                child: Container(
                                  width: 106,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: const Color(0xFFE0E0E0)),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.add,
                                        color: Color(0xFF1E535B)),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Add your thoughts",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575959),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: SizedBox(
                      width: 350,
                      height: 52,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Want a vibrant birthday theme filled with colors and flowers, as shown in picture.",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF575959)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Choose budget range",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575959),
                      ),
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return RangeSlider(
                        values: currentRange,
                        min: 1000,
                        max: 50000,
                        divisions: 49,
                        activeColor: const Color(0xFF1E535B),
                        inactiveColor: const Color(0xFFE0E0E0),
                        labels: RangeLabels(
                          '₹${currentRange.start.toInt()}',
                          '₹${currentRange.end.toInt()}',
                        ),
                        onChanged: (values) {
                          setState(() => currentRange = values);
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹3000',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF575959))),
                        Text('₹50000',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF575959))),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Connect with us",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF575959),
                      ),
                    ),
                  ),
                  Container(
                    width: 348,
                    height: 49,
                    margin: const EdgeInsets.only(top: 16, left: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1E535B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const ConnectingScreen())),
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: Color(0xFF1E535B),
                                child: Icon(Icons.call,
                                    size: 14, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Chatscreen())),
                              child: const CircleAvatar(
                                radius: 14,
                                backgroundColor: Color(0xFF1E535B),
                                child: Icon(Icons.chat,
                                    size: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: SizedBox(
                        width: 300,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Hire action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E535B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Hire Decorator',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
