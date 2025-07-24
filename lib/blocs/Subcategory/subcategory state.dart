import '../../models/subcategory_model.dart';

class SubcategoryState {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final List<EventDetails> eventDetails;

  // 🔹 Add this line
  final Map<String, int> serviceCounts;

  SubcategoryState({
    required this.categories,
    required this.selectedIndex,
    required this.eventDetails,
    this.serviceCounts = const {}, // 🔹 default empty map
  });

  SubcategoryState copyWith({
    List<CategoryModel>? categories,
    int? selectedIndex,
    List<EventDetails>? eventDetails,
    Map<String, int>? serviceCounts, // 🔹 add to copyWith
  }) {
    return SubcategoryState(
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      eventDetails: eventDetails ?? this.eventDetails,
      serviceCounts: serviceCounts ?? this.serviceCounts, // 🔹
    );
  }
}
