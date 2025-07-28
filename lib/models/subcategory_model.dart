import 'dart:developer';

import 'package:intl/intl.dart';

class CategoryModel {
  final String name;
  final String image;
  final List<ServiceItem> services;


  CategoryModel({
    required this.name,
    required this.image,
    required this.services,
  });
}




class AddressModel {
  final String title;
  final String subtitle;

  AddressModel({
    required this.title,
    required this.subtitle,
  });

  // Factory constructor to create an AddressModel from a map
  factory AddressModel.fromMap(Map<String, String> map) {
    return AddressModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  // Method to convert an AddressModel to a map
  Map<String, String> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  // Optional: Useful for equality checks
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AddressModel &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              subtitle == other.subtitle;

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode;

  @override
  String toString() => 'AddressModel(title: $title, subtitle: $subtitle)';
}
// models/subcategory_model.dart - Updated ServiceItem class

class ServiceItem {
  final String id; // Add unique identifier
  final String title;
  final String imageUrl;
  final String price;
  final String? description;

  ServiceItem({
    required this.id, // Make id required
    required this.title,
    required this.imageUrl,
    required this.price,
    this.description,
  });
}

// Updated EventDetails to include service-specific data
class EventDetails {
  final String? serviceId; // Add serviceId to link with specific service
  final String? eventImage;
  final String? eventPrice;
  final String? title; // Add title field
  final String? description;
  final List<String>? perviousWorkImages;
  final List<String>? packagesIncluded;

  EventDetails({
    this.serviceId,
    this.eventImage,
    this.eventPrice,
    this.title,
    this.description,
    this.perviousWorkImages,
    this.packagesIncluded,
  });
}




