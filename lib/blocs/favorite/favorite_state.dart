// favorite_state.dart
abstract class FavoriteState {
  bool get isFavorite;
}

class FavoriteInitial extends FavoriteState {
  @override
  bool get isFavorite => false;
}

class FavoriteToggled extends FavoriteState {
  final bool isFavorite;
  FavoriteToggled({required this.isFavorite});
}
