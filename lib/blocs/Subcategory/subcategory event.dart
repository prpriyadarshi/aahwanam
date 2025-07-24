abstract class SubcategoryEvent {}

class LoadSubcategoryData extends SubcategoryEvent {}

class SelectCategory extends SubcategoryEvent {
  final int selectedIndex;
  SelectCategory(this.selectedIndex);
}

class LoadEventDetails extends SubcategoryEvent {}

/// 🔥 New event to track service count
class UpdateServiceCount extends SubcategoryEvent {
  final String serviceTitle; // Usually service name or ID
  final int newCount;        // Value after + or - tap

  UpdateServiceCount(this.serviceTitle, this.newCount);
}
