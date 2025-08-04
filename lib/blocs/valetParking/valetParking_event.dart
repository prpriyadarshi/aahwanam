import 'package:equatable/equatable.dart';

abstract class ValetParkingEvent extends Equatable {
  const ValetParkingEvent();

  @override
  List<Object?> get props => [];
}

// Fetches initial valet packages
class FetchValetParking extends ValetParkingEvent {}

// User selects a valet package
class SelectValetParking extends ValetParkingEvent {
  final String valetId;

  const SelectValetParking(this.valetId);

  @override
  List<Object?> get props => [valetId];
}

// Handles tab screen changes (All Details, Gallery, Reviews)
class LoadValetParkingTabScreen extends ValetParkingEvent {
  final int index;

  const LoadValetParkingTabScreen(this.index);

  @override
  List<Object?> get props => [index];
}
