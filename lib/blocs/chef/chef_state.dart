import 'package:equatable/equatable.dart';

abstract class ChefState extends Equatable {
  const ChefState();

  @override
  List<Object?> get props => [];
}

class ChefInitial extends ChefState {}

class ChefLoading extends ChefState {}

class ChefLoaded extends ChefState {
  final List<Map<String, String>> categories;
  final List<Map<String, String>> chefs;

  const ChefLoaded(this.categories, this.chefs);

  @override
  List<Object?> get props => [categories, chefs];
}

class ChefThemesLoaded extends ChefState {
  final List<Map<String, String>> themes;

  const ChefThemesLoaded(this.themes);

  @override
  List<Object?> get props => [themes];
}

class ChefGalleryLoaded extends ChefState {
  final List<String> galleryImages;

  const ChefGalleryLoaded({this.galleryImages = const []});

  @override
  List<Object?> get props => [galleryImages];
}

class ChefReviewLoaded extends ChefState {
  final List<String> photos;
  final Map<int, int> ratingData;

  const ChefReviewLoaded({
    required this.photos,
    required this.ratingData,
  });

  @override
  List<Object?> get props => [photos, ratingData];
}

class GetQuotesChefLoaded extends ChefState {}

class ChefError extends ChefState {
  final String message;

  const ChefError(this.message);

  @override
  List<Object?> get props => [message];
}
class ChefMenuLoaded extends ChefState {
  final List<Map<String, dynamic>> menuItems;

  const ChefMenuLoaded(this.menuItems);
}
