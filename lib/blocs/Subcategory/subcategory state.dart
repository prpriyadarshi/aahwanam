import '../../models/subcategory_model.dart'; // Make sure this path is correct

// Define the enum for different Subcategory states
enum SubcategoryStatus { initial, loading, success, failure }

class SubcategoryState {
  // Add the status property
  final SubcategoryStatus status;

  final List<CategoryModel> categories;
  final int selectedIndex;
  final List<EventDetails> eventDetails;

  // Added for managing counts of individual services/packages
  final Map<String, int> serviceCounts;
  final String? errorMessage; // Optional: for holding error messages

  SubcategoryState({
    this.status = SubcategoryStatus.initial, // Initialize with default status
    required this.categories,
    required this.selectedIndex,
    required this.eventDetails,
    this.serviceCounts = const {}, // default empty map
    this.errorMessage,
  });

  SubcategoryState copyWith({
    SubcategoryStatus? status, // Add status to copyWith
    List<CategoryModel>? categories,
    int? selectedIndex,
    List<EventDetails>? eventDetails,
    Map<String, int>? serviceCounts,
    String? errorMessage,
  }) {
    return SubcategoryState(
      status: status ?? this.status, // Copy status
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      eventDetails: eventDetails ?? this.eventDetails,
      serviceCounts: serviceCounts ?? this.serviceCounts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

// If you are using Equatable (though not in the snippet you provided for SubcategoryState),
// you would also need to override props to include these new fields.
// For example:
// @override
// List<Object?> get props => [status, categories, selectedIndex, eventDetails, serviceCounts, errorMessage];
}