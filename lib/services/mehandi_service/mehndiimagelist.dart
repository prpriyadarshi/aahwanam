import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/mehndi/mehndi_bloc.dart';
import '../../blocs/mehndi/mehndi_state.dart';




class MehndiImageList extends StatelessWidget {
  const MehndiImageList({super.key});

  Widget _buildImageRow(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF575959),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            padding: const EdgeInsets.only(left: 16),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                width: 108,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MehndiBloc, MehndiState>(
      builder: (context, state) {
        List<String> galleryImages = [];

        if (state is MehndiGalleryLoaded) {
          galleryImages = state.galleryImages;
        }

        // Split images into 3 groups
        final mehndiImages = galleryImages.take(4).toList();       // 0-3

        final trendyImages = galleryImages.skip(7).take(4).toList();       // 7-10

        return SingleChildScrollView(
          child: Column(
            children: [
              _buildImageRow('Bridal Mehndi ', mehndiImages),
              _buildImageRow( '',mehndiImages),
              _buildImageRow('Trendy Mehndi', trendyImages),
            ],
          ),
        );
      },
    );
  }
}
