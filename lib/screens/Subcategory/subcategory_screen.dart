import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import '../../blocs/Subcategory/subcategory bloc.dart';
import '../../blocs/Subcategory/subcategory event.dart';
import '../../blocs/Subcategory/subcategory state.dart';
import '../../models/subcategory_model.dart';
import '../../widgets/Subcategory/add_to_cart_bottom_bar.dart';
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

              final selectedCategory = filteredCategories.isNotEmpty
                  ? filteredCategories.firstWhere(
                    (cat) => cat.name == allCategories[state.selectedIndex].name,
                orElse: () => filteredCategories[0],
              )
                  : null;

              final bool useListLayout = selectedCategory?.name == 'Entertainment' ||
                  selectedCategory?.name == 'Valet Parking' ||
                  selectedCategory?.name == 'Pandit' ||
                  selectedCategory?.name == 'Bartender' ||
                  selectedCategory?.name == 'Photography' ||
                  selectedCategory?.name == 'Chef';

              // Calculate total items and total price from the serviceCounts map.
              final int totalItems = state.serviceCounts.values.fold(0, (sum, count) => sum + count);

              // Find a service to display in the bottom bar, preferably the last one added.
              // To get the last added item, you'd need a timestamp or a different state model.
              // For simplicity, we can get the first one with a count > 0.
              final String? selectedServiceId = state.serviceCounts.keys.firstWhereOrNull(
                    (id) => (state.serviceCounts[id] ?? 0) > 0,
              );
              final ServiceItem? firstAddedService = allCategories.expand((category) => category.services).firstWhereOrNull(
                    (service) => service.id == selectedServiceId,
              );

              return Stack(
                children: [
                  Row(
                    children: [
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
                                count: state.serviceCounts[item.id] ?? 0,
                                onCountChanged: (newCount) {
                                  context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, newCount));
                                },
                                onAddTap: (uniqueKey) {
                                  if ((state.serviceCounts[item.id] ?? 0) == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventDetailsScreen(
                                          serviceId: item.id,
                                          showIncludedPackages: useListLayout,
                                        ),
                                      ),
                                    );
                                    context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, 1));
                                  } else {
                                    context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, (state.serviceCounts[item.id] ?? 0) + 1));
                                  }
                                },
                                uniqueKey: item.id,
                              );
                            },
                          )
                              : GridView.builder(
                            itemCount: selectedCategory?.services.length ?? 0,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 14,
                              childAspectRatio: 0.72,
                            ),
                            itemBuilder: (_, index) {
                              final item = selectedCategory!.services[index];
                              return EventServiceCard(
                                title: item.title,
                                imageUrl: item.imageUrl,
                                price: item.price,
                                description: item.description,
                                isListLayout: useListLayout,
                                count: state.serviceCounts[item.id] ?? 0,
                                onCountChanged: (newCount) {
                                  context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, newCount));
                                },
                                onAddTap: (uniqueKey) {
                                  if ((state.serviceCounts[item.id] ?? 0) == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventDetailsScreen(
                                          serviceId: item.id,
                                          showIncludedPackages: useListLayout,
                                        ),
                                      ),
                                    );
                                    context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, 1));
                                  } else {
                                    context.read<SubcategoryBloc>().add(UpdateServiceCount(item.id, (state.serviceCounts[item.id] ?? 0) + 1));
                                  }
                                },
                                uniqueKey: item.id,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (totalItems > 0 && firstAddedService != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AddToCartBottomBar(
                        imageUrl: firstAddedService.imageUrl, // Use the image of the first added item
                        price: firstAddedService.price, // The text from your screenshot
                        itemCount: state.serviceCounts[selectedServiceId!] ?? 0,
                        onGoToCartTap: () {},
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