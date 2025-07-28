// Updated SubcategoryScreen with dynamic navigation

import 'package:aahwanam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/Subcategory/subcategory bloc.dart';
import '../../blocs/Subcategory/subcategory event.dart';
import '../../blocs/Subcategory/subcategory state.dart';
import '../../models/subcategory_model.dart';
import '../../widgets/Subcategory/service_cards.dart';
import '../../widgets/custom_category_menu.dart';
import '../../widgets/custom_top_bar.dart';
import '../Packages/event_details_screen.dart';

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

              final List<CategoryModel> allCategories = state.categories;
              final List<CategoryModel> filteredCategories = _getCategoriesForEvent(eventName, allCategories);

              print("check allCategories list length------------${allCategories.length}");
              print("check filtered list length------------${filteredCategories.length}");

              final selectedCategory = filteredCategories.isNotEmpty
                  ? filteredCategories.firstWhere(
                    (cat) => cat.name == allCategories[state.selectedIndex].name,
                orElse: () => filteredCategories[0],
              )
                  : null;

              print("check selectedCategory -----------${selectedCategory?.name}");

              // Determine if the current category should use list layout
              final bool useListLayout = selectedCategory?.name == 'Entertainment' ||
                  selectedCategory?.name == 'Valet Parking' ||
                  selectedCategory?.name == 'Pandit' ||
                  selectedCategory?.name == 'Bartender' ||
                  selectedCategory?.name == 'Photography' ||
                  selectedCategory?.name == 'Chef';

              return Row(
                children: [
                  // Vertical category list
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

                  // Dynamic Service Display
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: useListLayout
                          ? ListView.builder(
                        itemCount: selectedCategory?.services.length ?? 0,
                        itemBuilder: (_, index) {
                          final item = selectedCategory!.services[index];
                          return EventServiceCard(
                            title: item.title,
                            imageUrl: item.imageUrl,
                            price: item.price,
                            description: item.description,
                            isListLayout: useListLayout,
                            count: state.serviceCounts[item.id] ?? 0, // Use item.id
                            onCountChanged: (newCount) {
                              print("Count changed for ${item.title} (ID: ${item.id}): $newCount");
                              context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, newCount));
                            },
                            onAddTap: () {
                              // Navigate to EventDetailsScreen with specific service data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailsScreen(
                                    serviceId: item.id, // Pass the service ID
                                    showIncludedPackages: true,
                                  ),
                                ),
                              );
                            }, uniqueKey: '',
                          );
                        },
                      )
                          : GridView.builder(
                        itemCount: selectedCategory?.services.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 19,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (_, index) {
                          final item = selectedCategory!.services[index];
                          return EventServiceCard(
                            title: item.title,
                            imageUrl: item.imageUrl,
                            price: item.price,
                            description: item.description,
                            isListLayout: useListLayout,
                            count: state.serviceCounts[item.id] ?? 0, // Use item.id
                            onCountChanged: (newCount) {
                              print("Count changed for ${item.title} (ID: ${item.id}): $newCount");
                              context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, newCount));
                            },
                            onAddTap: () {
                              // Navigate to EventDetailsScreen with specific service data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDetailsScreen(
                                    serviceId: item.id, // Pass the service ID
                                    showIncludedPackages: false, // For grid layout, don't show packages by default
                                  ),
                                ),
                              );
                            }, uniqueKey: '',
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

  /// Helper function to filter categories per event
  List<CategoryModel> _getCategoriesForEvent(String event, List<CategoryModel> all) {
    switch (event) {
      case 'Birthday':
        return all.where((c) => c.name != 'Valet Parking').toList();
      case 'Anniversary':
        return all.where((c) => c.name != 'Entertainment').toList();
      default:
        return all;
    }
  }
}