import '../../models/service_details.dart';

abstract class ValetParkingState {}

class ValetParkingInitial extends ValetParkingState {}

class ValetParkingLoading extends ValetParkingState {}

class ValetParkingLoaded extends ValetParkingState {
  final List<Map<String, dynamic>> Packages;
  final ServiceDetails serviceDetails;
  ValetParkingLoaded(this.Packages, this.serviceDetails);

  @override
  List<Object?> get props => [serviceDetails];
}

class ValetParkingGalleryLoaded extends ValetParkingState {
  final List<String> galleryImages;

  ValetParkingGalleryLoaded(this.galleryImages);
}

class ValetParkingReviewLoaded extends ValetParkingState {
  final List<String> photos;
  final Map<int, int> ratingData;

  ValetParkingReviewLoaded({required this.photos, required this.ratingData});
}

class ValetParkingError extends ValetParkingState {
  final String message;

  ValetParkingError(this.message);
}
