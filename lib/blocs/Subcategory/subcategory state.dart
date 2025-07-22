import '../../models/subcategory_model.dart';

class SubcategoryState {
  final List<CategoryModel> categories;
  final int selectedIndex;

  SubcategoryState({
    required this.categories,
    required this.selectedIndex,
  });

  SubcategoryState copyWith({
    List<CategoryModel>? categories,
    int? selectedIndex,
  }) {
    return SubcategoryState(
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
