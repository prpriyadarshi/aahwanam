import 'gallery_section.dart';

class ServiceDetails {
  final String name;
  final String imagePath;
  final double price;
  final double rating;
  final String heading;
  final String packagePrice;
  final String description;
  final String subHeading;
  final String subHeadingDetails;
  final String eventTitle;
  final String address;
  final String addressDescription;
  final List<GallerySection> mediaSections;
  final List<String> reviewPhotoUrls;
  final int totalRatings;
  final int totalReviews;
  final double averageRating;
  final String? label1;
  final String? label2;
  final String? initialValue1;
  final String? initialValue2;

  ServiceDetails({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.heading,
    required this.packagePrice,
    required this.description,
    required this.subHeading,
    required this.subHeadingDetails,
    required this.eventTitle,
    required this.address,
    required this.addressDescription,
    required this.mediaSections,
    required this.reviewPhotoUrls,
    required this.totalRatings,
    required this.totalReviews,
    required this.averageRating,
    this.label1,
    this.label2,
    this.initialValue1,
    this.initialValue2,
  });
}
