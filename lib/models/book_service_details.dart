// models/entertainment_package_model.dart

class BookServiceDetails {
  final String title;
  final String? imagePath;
  final String description;
  final String price;
  final String locationTitle;
  final String locationDescription;
  final String eventDate;
  final String eventTime;
  final String serviceCharge;
  final String platformFee;
  final String transportFee;
  final String totalAmount;
  final String? label1;
  final String? label2;
  final String? initialValue1;
  final String? initialValue2;
  final bool isPerSession; // 👈 Add this


  BookServiceDetails({
    required this.title,
    this.imagePath,
    required this.description,
    required this.price,
    required this.locationTitle,
    required this.locationDescription,
    required this.eventDate,
    required this.eventTime,
    required this.serviceCharge,
    required this.platformFee,
    required this.transportFee,
    required this.totalAmount,
    this.label1,
    this.label2,
    this.initialValue1,
    this.initialValue2,
    this.isPerSession = false, // 👈 Add default

  });
}
