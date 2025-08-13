import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/favorite/favorite_bloc.dart';
import '../blocs/favorite/favorite_event.dart';
import '../blocs/favorite/favorite_state.dart';
import '../services/pandit/pandit_theme.dart';
import 'custom_text_field.dart';

class CustomPanditCardWidgets {
  static Widget buildSection(
      BuildContext context, {
        required String title,
        required List<Map<String, dynamic>> data,
        required VoidCallback onViewAll,
        required bool showViewAll,
        bool showTitle = true, // ✅ New parameter to control title visibility
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) // ✅ Conditionally render title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textFontStyle(16, const Color(0xFF1E535B), FontWeight.bold),
                ),
                if (showViewAll)
                  GestureDetector(
                    onTap: onViewAll,
                    child: Text(
                      'View All',
                      style: TextFontStyle.textFontStyle(14, Colors.blue, FontWeight.w500),
                    ),
                  ),
              ],
            ),
          ),

        const SizedBox(height: 14),
        if (showTitle) const SizedBox(height: 12), // ✅ Add space only if title is shown
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
            childAspectRatio: 0.8,
          ),
          itemCount: data.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final item = data[index];
            return buildCarditem(context, item);
          },
        ),
      ],
    );
  }


  static Widget buildCarditem(BuildContext context, Map<String, dynamic> item) {
    return BlocProvider(
      create: (_) => FavoriteBloc(),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PanditTheme()),
              );
            },
            child: Card(
              elevation: 0,
              color: const Color(0xFFFFEFDF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(6.0)),
                        child: item['image'] != null && item['image']!.startsWith('assets/')
                            ? Image.asset(
                          item['image']!,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                            : Image.network(
                          item['image'] ?? '',
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // 🔁 BLoC Favorite Icon
                      Positioned(
                        top: 6,
                        right: 6,
                        child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () => context.read<FavoriteBloc>().add(ToggleFavorite()),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 8,
                                child: Icon(
                                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  size: 12,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  // 🔤 Info Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['name'] ?? '',
                                style: TextFontStyle.textFontStyle(
                                    12, const Color(0xFF575959), FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Color(0xFFEFAA37), size: 14),
                                const SizedBox(width: 2),
                                Text(
                                  item['rating'] ?? "0.0",
                                  style: TextFontStyle.textFontStyle(12, const Color(0xFF575959)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['price'] ?? '',
                          style: TextFontStyle.textFontStyle(
                              12, const Color(0xFF1E535B), FontWeight.w600),
                        ),
                      ],
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