import 'package:aahwanam/widgets/custom_vertic_blog.dart';
import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String date;
  final List<Map<String, dynamic>> relatedBlogs;

  const BlogDetailsScreen({
    Key? key,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.relatedBlogs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Blog'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          // IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400,color: Color.fromRGBO(87, 89, 89, 1))),

              const SizedBox(height: 10),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: handle favorite logic
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
               const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(117, 117, 117, 1),
                ),
              ),

              const SizedBox(height: 30),
              const Text('Similar Blogs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              // Add a horizontal scroll view of similar blogs if
              ListView.builder(
                itemCount: relatedBlogs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final blog = relatedBlogs[index];
                  return Padding(
                    padding: const EdgeInsets.only(),
                    child: VerticBlogCard(
                      description: blog['description'] ?? '',
                      title: blog['title']??'',
                      imageUrl: blog['imageUrl']??'',
                      date: blog['date']??'',
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
