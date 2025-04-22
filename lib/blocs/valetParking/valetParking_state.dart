import 'package:equatable/equatable.dart';

abstract class ValetParkingState extends Equatable {
  const ValetParkingState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class ValetParkingInitial extends ValetParkingState {}

// State when loading  valetParking data
class  ValetParkingLoading extends ValetParkingState {}

// State when  valetParking data is loaded
class ValetParkingLoaded extends ValetParkingState {
  final List<Map<String, dynamic>> Packages;

  const ValetParkingLoaded(this.Packages);

  @override
  List<Object?> get props => [Packages];
}

// State for errors
class ValetParkingError extends ValetParkingState {
  final String message;

  const ValetParkingError(this.message);

  @override
  List<Object?> get props => [message];
}
