import 'package:equatable/equatable.dart';

abstract class EntertainmentState extends Equatable {
  const EntertainmentState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class EntertainmentInitial extends EntertainmentState {}

// State when loading EntertainmentState data
class EntertainmentLoading extends EntertainmentState {}

// State when EntertainmentState data is loaded
class EntertainmentLoaded extends EntertainmentState {
  final List<Map<String, String>> Services;

  const EntertainmentLoaded(this.Services);

  @override
  List<Object?> get props => [Services];

}

// State for errors
class EntertainmentError extends EntertainmentState {
  final String message;

  const EntertainmentError(this.message);

  @override
  List<Object?> get props => [message];
}
