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

class ServiceItem {
  final String title;
  final String imageUrl;
  final String price;
  final String? description;

  ServiceItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.description,
  });
}

