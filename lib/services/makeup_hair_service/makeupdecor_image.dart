import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/makeup/makeup_bloc.dart';
import '../../blocs/makeup/makeup_state.dart';
import '../../widgets/custom_text_field.dart';




class MakeupHairImageList extends StatelessWidget {
  const MakeupHairImageList({super.key});

  Widget _buildImageRow(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            title,
            style: TextFontStyle.textFontStyle(14, const Color(0xFF1E535B), FontWeight.w600),

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
    return BlocBuilder<MakeupBloc, MakeupState>(
      builder: (context, state) {
        List<String> galleryImages = [];

        if (state is makeupGalleryLoaded) {
          galleryImages = state.galleryImages;
        }

        // Split images into 3 groups
        final birthdayImages = galleryImages.take(4).toList();       // 0-3
        final anniversaryImages = galleryImages.skip(4).take(4).toList(); // 4-6
        final poojaImages = galleryImages.skip(7).take(4).toList();       // 7-10

        return SingleChildScrollView(
          child: Column(
            children: [
              _buildImageRow('Bridal Makeup ', birthdayImages),
              _buildImageRow('Hair Style', anniversaryImages),
              _buildImageRow('Natural Makeup', poojaImages),
            ],
          ),
        );
      },
    );
  }
}
