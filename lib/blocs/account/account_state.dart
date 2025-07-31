import 'package:equatable/equatable.dart';
import 'package:aahwanam/models/service_details.dart';

import '../../models/book_service_details.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String profileUrl;
  final List<Map<String, dynamic>> bookings; // <-- ADD THIS
  final List<Map<String, dynamic>> inProgressBookings;
  final List<Map<String, dynamic>> addToCart;
  final List<Map<String, dynamic>> wishlist;
  final List<Map<String, dynamic>> conceptsTabImages;
  final List<Map<String, dynamic>> packages;
  final List<Map<String, dynamic>> cartdata;
  final ServiceDetails serviceDetails;
  final BookServiceDetails bookServiceDetails;

  const AccountLoaded({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.profileUrl,
    required this.bookings, // <-- ADD THIS
    required this.inProgressBookings,
    required this.addToCart,
    required this.wishlist,
    required this.conceptsTabImages,
    required this.packages,
    required this.cartdata,
    required this.serviceDetails,
    required this.bookServiceDetails
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        phone,
        email,
        profileUrl,
        bookings,
        inProgressBookings,
        addToCart,
        wishlist,
        conceptsTabImages,
        packages,
        cartdata,
        serviceDetails,
    bookServiceDetails
      ];
}

class AccountError extends AccountState {
  final String message;

  const AccountError(this.message);

  @override
  List<Object> get props => [message];
}
