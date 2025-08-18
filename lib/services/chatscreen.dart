import 'package:aahwanam/services/chatbubblelist.dart';
import 'package:aahwanam/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0, // removes default horizontal padding
        leadingWidth: 0, // disables space reserved for leading widget
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 24, color: Color(0xFF1E535B)),
              onPressed: () {
                Navigator.pop(context);
              },
              padding: const EdgeInsets.only(left: 5),
              splashRadius: 20,
              constraints: const BoxConstraints(), // removes extra padding
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              radius: 18,
            ),
            const SizedBox(width: 8),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextFontStyle.textFontStyle(
                    12,
                    Color(0xFF575959),
                    FontWeight.w500,
                  ),

                ),
                SizedBox(height: 5),
                Text(
                  'Support team',
                  style: TextFontStyle.textFontStyle(
                    10,
                    Color(0xFF575959),
                    FontWeight.w300,
                  ),

                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1E535B),
                ),
                child: const Icon(Icons.call, size: 14, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1E535B),
                ),
                child: const Icon(Icons.videocam, size: 14, color: Colors.white),
              ),
              const SizedBox(width: 20), // tighter right margin
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Chatbubblelist(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  TextField(
                      style: TextFontStyle.textFontStyle(
                        12,
                        Color(0xFF575959),
                        FontWeight.w500,
                      ),
                      decoration: InputDecoration(

                        hintText: 'Type a message...',


                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10), // <-- add this
                      ),
                    ),

                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.send, color: Color(0xFF1E535B)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
