import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/Subcategory/subcategory bloc.dart';
import '../../blocs/Subcategory/subcategory event.dart';
import '../../blocs/Subcategory/subcategory state.dart';
import '../../models/subcategory_model.dart';
import '../../widgets/custom_category_menu.dart';
import '../../widgets/custom_top_bar.dart';
import '../../widgets/subcategory/service_card.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String eventName = args?['eventName'] ?? '';

    return BlocProvider(
      create: (_) => SubcategoryBloc()..add(LoadSubcategoryData()),
      child: Scaffold(
        appBar: CustomTopBar(
          onBack: () => Navigator.pop(context),
          onSearchChanged: (value) {},
          onCalendarTap: () {},
          onCartTap: () {},
          onFavoriteTap: () {},
        ),
        body: SafeArea(
          child: BlocBuilder<SubcategoryBloc, SubcategoryState>(
            builder: (context, state) {
              final bloc = context.read<SubcategoryBloc>();

              // 🔹 Full list from state
              final List<CategoryModel> allCategories = state.categories;

              // 🔹 Filtered list based on event
              final List<CategoryModel> filteredCategories = _getCategoriesForEvent(eventName, allCategories);

              // 🔹 Find selected category in filtered list
              final selectedCategory = filteredCategories.isNotEmpty
                  ? filteredCategories.firstWhere(
                    (cat) => cat.name == allCategories[state.selectedIndex].name,
                orElse: () => filteredCategories[0],
              )
                  : null;

              return Row(
                children: [
                  // 🔸 Vertical category list
                  VerticalCategoryMenu(
                    categories: filteredCategories,
                    selectedIndex: filteredCategories.indexWhere(
                          (cat) => cat.name == selectedCategory?.name,
                    ),
                    onCategorySelected: (filteredIndex) {
                      final selected = filteredCategories[filteredIndex];
                      final originalIndex = allCategories.indexWhere((c) => c.name == selected.name);
                      bloc.add(SelectCategory(originalIndex));
                    },
                  ),

                  // 🔸 Service grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount: selectedCategory?.services.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 19,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (_, index) {
                          final item = selectedCategory!.services[index];
                          return ServiceCard(
                            title: item.title,
                            imageUrl: item.imageUrl,
                            price: item.price,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// ✅ Helper function to filter categories per event
  List<CategoryModel> _getCategoriesForEvent(String event, List<CategoryModel> all) {
    switch (event) {
      case 'Birthday':
        return all.where((c) =>  c.name != 'Valet Parking').toList();
      case 'Anniversary':
        return all.where((c) => c.name != 'Entertainment').toList();
      default:
        return all;
    }
  }
}
