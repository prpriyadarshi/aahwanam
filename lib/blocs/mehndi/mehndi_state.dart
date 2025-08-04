import 'package:equatable/equatable.dart';

abstract class MehndiState extends Equatable {
  const MehndiState();

  @override
  List<Object?> get props => [];
}

class MehndiInitial extends MehndiState {}

class MehndiLoading extends MehndiState {}

class MehndiLoaded extends MehndiState {
  final List<Map<String, String>> mehndiTheme;
  final List<Map<String, String>> mehndiArtists;
  final List<Map<String, String>> trendingMehndiDesigns;

  const MehndiLoaded(this.mehndiTheme, this.mehndiArtists, this.trendingMehndiDesigns);

  @override
  List<Object?> get props => [mehndiTheme, mehndiArtists, trendingMehndiDesigns];
}

class MehndiLoadedError extends MehndiState {
  final String message;

  const MehndiLoadedError(this.message);

  @override
  List<Object?> get props => [message];
}

// Tab Specific States
class ThemesMehndiLoaded extends MehndiState {
  final List<Map<String, String>> themes;

  const ThemesMehndiLoaded(this.themes);

  @override
  List<Object?> get props => [themes];
}

class GetQuotesMehndiLoaded extends MehndiState {}

class MehndiGalleryLoaded extends MehndiState {
  final List<String> galleryImages;

  const MehndiGalleryLoaded({this.galleryImages = const []});

  @override
  List<Object?> get props => [galleryImages];
}

class MehndiReviewLoaded extends MehndiState {
  final List<String> photos;
  final Map<int, int> ratingData;

  const MehndiReviewLoaded({
    required this.photos,
    required this.ratingData,
  });

  @override
  List<Object?> get props => [photos, ratingData];
}

/// State when reviews tab is loaded