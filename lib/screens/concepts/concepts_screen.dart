import 'package:aahwanam/screens/concepts/full_image_screen.dart';
import 'package:aahwanam/widgets/custom_blog_card.dart';
import 'package:aahwanam/widgets/custom_vertic_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/concepts/concepts_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../widgets/custom_horiz_blog_card.dart';

class ConceptsScreen extends StatefulWidget {
  const ConceptsScreen({Key? key}) : super(key: key);

  @override
  State<ConceptsScreen> createState() => _ConceptsScreenState();
}

class _ConceptsScreenState extends State<ConceptsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    context.read<ConceptsBloc>().add(LoadConceptBlogs());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.arrow_back, color: Colors.black),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => print("Cart icon pressed"),
                      child: Image.asset('assets/images/cart.png',
                          width: 24, height: 24),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () => print("Favorite pressed"),
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: const Color.fromRGBO(87, 89, 89, 1),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(117, 117, 117, 1)),
              tabs: const [
                Tab(text: 'Trends'),
                Tab(text: 'Blogs'),
                Tab(text: 'Real Stories'),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<ConceptsBloc, ConceptsState>(
            builder: (context, state) {
              if (state is ConceptsBlogLoaded) {
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  itemCount: state.trendImages.length,
                    itemBuilder: (context, index) {
                      final imagePath = state.trendImages[index];
                      return GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FullImagePage(imagePath: imagePath),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 3 / 4, // Adjust as needed (e.g. 4:5, 3:4)
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.favorite, size: 16, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      );
                    }
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          BlocBuilder<ConceptsBloc, ConceptsState>(
            builder: (context, state) {
              if (state is ConceptsBlogLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Horizontally scrollable blog cards in a row
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.horizontal_blogs.length,
                          itemBuilder: (context, index) {
                            final blog = state.horizontal_blogs[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BlogDetailsScreen(
                                      description: blog['description'] ?? '',
                                      imageUrl: blog['imageUrl'] ?? '',
                                      date: blog['date'] ?? '',
                                      relatedBlogs: state.horizontal_blogs,
                                    ),
                                  ),
                                );
                              },
                              child: HorizBlogCard(
                                imageUrl: blog['imageUrl'] ?? '',
                                title: blog['title'] ?? '',
                                description: blog['description'] ?? '',
                                date: blog['date'] ?? '',
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Recently Added Text in its own row
                      const Text('Recently Added',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(87, 89, 89, 1))),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.vertical_blogs.length,
                        itemBuilder: (context, index) {
                          final blog = state.vertical_blogs[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: VerticBlogCard(
                              imageUrl: blog['imageUrl'] ?? '',
                              title: blog['title'] ?? '',
                              description: blog['description'] ?? '',
                              date: blog['date'] ?? '',
                            ),
                          );
                        },
                      ),

                      const Text('Trendy Blogs',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(87, 89, 89, 1))),
                      const SizedBox(height: 10),

                      // Trendy Added List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) {
                          final blog = state.blogs[index];
                          return HorizBlogCard(
                            imageUrl: blog['imageUrl'] ?? '',
                            title: blog['title'] ?? '',
                            description: blog['description'] ?? '',
                            date: blog['date'] ?? '',
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is ConceptsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('No blogs found.'));
              }
            },
          ),
          BlocBuilder<ConceptsBloc, ConceptsState>(
            builder: (context, state) {
              if (state is ConceptsBlogLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Horizontally scrollable blog cards in a row
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.blogs.length,
                          itemBuilder: (context, index) {
                            final blog = state.blogs[index];
                            // return Padding(
                            // padding: const EdgeInsets.only(right: 10,left: 10),
                            return HorizBlogCard(
                              imageUrl: blog['imageUrl'] ?? '',
                              title: blog['title'] ?? '',
                              description: blog['description'] ?? '',
                              date: blog['date'] ?? '',
                            );
                            // );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Recently Added Text in its own row
                      const Text('Recently Added',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(87, 89, 89, 1))),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) {
                          final blog = state.blogs[index];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: VerticBlogCard(
                              imageUrl: blog['imageUrl'] ?? '',
                              title: blog['title'] ?? '',
                              description: blog['description'] ?? '',
                              date: blog['date'] ?? '',
                            ),
                          );
                        },
                      ),

                      const Text('Trendy Blogs',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(87, 89, 89, 1))),
                      const SizedBox(height: 10),

                      // Trendy Added List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) {
                          final blog = state.blogs[index];
                          return HorizBlogCard(
                            imageUrl: blog['imageUrl'] ?? '',
                            title: blog['title'] ?? '',
                            description: blog['description'] ?? '',
                            date: blog['date'] ?? '',
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is ConceptsInitial) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('No blogs found.'));
              }
            },
          ),
        ],
      ),
    );
  }
}
