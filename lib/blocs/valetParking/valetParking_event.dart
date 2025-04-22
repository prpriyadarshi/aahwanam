import 'package:equatable/equatable.dart';

abstract class ValetParkingEvent extends Equatable {
  const ValetParkingEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch valetParking data
class FetchValetParking extends ValetParkingEvent {}

// Event to select a specific valetParking
class SelectValetParking extends ValetParkingEvent {
  final String valetId;

  const SelectValetParking(this.valetId);

  @override
  List<Object?> get props => [valetId];
}
