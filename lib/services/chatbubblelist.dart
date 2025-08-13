import 'package:flutter/material.dart';

class Chatbubblelist extends StatefulWidget {
  const Chatbubblelist({super.key});

  @override
  State<Chatbubblelist> createState() => _ChatbubblelistState();
}

class _ChatbubblelistState extends State<Chatbubblelist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: ChatBubble(
            text: "Hello, how can we assist you?",
            isMe: false,
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: ChatBubble(
            text: "I want to know about decoration themes.",


            isMe: true,
          ),
        ),
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isMe ? 50 : 0,
        right: isMe ? 0 : 50,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFF1E535B) : const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isMe ? Colors.white : const Color(0xFF1E535B),
          fontSize: 12,
        ),
      ),
    );
  }
}
