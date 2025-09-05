import 'package:flutter/material.dart';

class HorizBlogCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  const HorizBlogCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  State<HorizBlogCard> createState() => _HorizBlogCardState();
}

class _HorizBlogCardState extends State<HorizBlogCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: 230,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(87, 89, 89, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color.fromRGBO(117, 117, 117, 1), fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(widget.date,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
