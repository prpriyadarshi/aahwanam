import 'package:equatable/equatable.dart';
import '../../models/book_service_details.dart';

abstract class DecorState extends Equatable {
  const DecorState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class DecorInitial extends DecorState {}

/// Loading state
class DecorLoading extends DecorState {}

/// Main data loaded state
class DecorLoaded extends DecorState {
  final List<Map<String, String>> eventsAndThemes;
  final List<Map<String, String>> decorators;
  final List<Map<String, String>> trendingDecorations;
  final BookServiceDetails bookServiceDetails;

  const DecorLoaded({
    required this.eventsAndThemes,
    required this.decorators,
    required this.trendingDecorations,
    required this.bookServiceDetails,
  });

  @override
  List<Object?> get props => [
    eventsAndThemes,
    decorators,
    trendingDecorations,
    bookServiceDetails,
  ];
}

/// Error state
class DecorLoadedError extends DecorState {
  final String message;

  const DecorLoadedError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Themes tab loaded
class ThemesLoaded extends DecorState {
  final List<Map<String, String>> themes;

  const ThemesLoaded(this.themes);

  @override
  List<Object?> get props => [themes];
}

/// Get Quotes tab loaded
class GetQuotesLoaded extends DecorState {
  const GetQuotesLoaded();
}

/// Gallery tab loaded
class GalleryLoaded extends DecorState {
  final List<String> galleryImages;

  const GalleryLoaded({this.galleryImages = const []});

  @override
  List<Object?> get props => [galleryImages];
}

/// Reviews tab loaded
class DecorationReviewLoaded extends DecorState {
  final List<String> photos;
  final Map<int, int> ratingData;

  const DecorationReviewLoaded({
    required this.photos,
    required this.ratingData,
  });

  @override
  List<Object?> get props => [photos, ratingData];
}
