import 'package:equatable/equatable.dart';

/// Base abstract state for Makeup
abstract class MakeupState extends Equatable {
  const MakeupState();

  @override
  List<Object?> get props => [];
}

/// Initial state before anything loads
class MakeupInitial extends MakeupState {}

/// State when data is being loaded
class MakeupLoading extends MakeupState {}

/// State when makeup-related data is loaded successfully
class MakeupLoaded extends MakeupState {
  final List<Map<String, String>> makeUpLook;
  final List<Map<String, String>> hairStyleLook;
  final List<Map<String, String>> makeupAndHairArtists;
  final List<Map<String, String>> trendingLooks;

  const MakeupLoaded(
      this.makeUpLook,
      this.hairStyleLook,
      this.makeupAndHairArtists,
      this.trendingLooks,
      );

  @override
  List<Object?> get props => [
    makeUpLook,
    hairStyleLook,
    makeupAndHairArtists,
    trendingLooks,
  ];
}

/// State when themes tab is loaded
class MakeupThemesLoaded extends MakeupState {
  final List<Map<String, String>> themes;

  const MakeupThemesLoaded(this.themes);

  @override
  List<Object?> get props => [themes];
}

/// State when get quotes tab is loaded
class GetQuotesLoaded extends MakeupState {
  const GetQuotesLoaded();
}

/// State when gallery tab is loaded
class makeupGalleryLoaded extends MakeupState {
  final List<String> galleryImages;

  const makeupGalleryLoaded({this.galleryImages = const []});

  @override
  List<Object?> get props => [galleryImages];
}

/// State when reviews tab is loaded
class MakeupReviewLoaded extends MakeupState {
  final List<String> photos;
  final Map<int, int> ratingData;

  const MakeupReviewLoaded({
    required this.photos,
    required this.ratingData,
  });

  @override
  List<Object?> get props => [photos, ratingData];
}

/// State when there's an error
class MakeupError extends MakeupState {
  final String message;

  const MakeupError(this.message);

  @override
  List<Object?> get props => [message];
}
