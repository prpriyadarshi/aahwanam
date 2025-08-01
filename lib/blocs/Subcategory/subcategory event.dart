// blocs/Subcategory/subcategory event.dart - Updated events

abstract class SubcategoryEvent {}

class LoadSubcategoryData extends SubcategoryEvent {}

class SelectCategory extends SubcategoryEvent {
  final int selectedIndex;
  SelectCategory(this.selectedIndex);
}

class LoadEventDetails extends SubcategoryEvent {
  final String serviceId; // Add serviceId parameter
  LoadEventDetails(this.serviceId);
}

class UpdateServiceCount extends SubcategoryEvent {
  final String serviceId; // Use unique service ID instead of title
  final int newCount;     // Value after + or - tap

  UpdateServiceCount(this.serviceId, this.newCount);
}