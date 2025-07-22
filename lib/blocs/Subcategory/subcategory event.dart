abstract class SubcategoryEvent {}

class LoadSubcategoryData extends SubcategoryEvent {}

class SelectCategory extends SubcategoryEvent {
  final int selectedIndex;

  SelectCategory(this.selectedIndex);
}
