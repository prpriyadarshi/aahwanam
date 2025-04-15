import 'package:equatable/equatable.dart';

abstract class PhotographerState extends Equatable {
  const PhotographerState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class PhotographerInitial extends PhotographerState {}

// State when loading photographer data
class PhotographerLoading extends PhotographerState {}

// State when photographer data is loaded
class PhotographerLoaded extends PhotographerState {
  final List<Map<String, String>> photographers;
  final List<Map<String, dynamic>> packages;

  const PhotographerLoaded(this.photographers,this.packages);

  @override
  List<Object?> get props => [photographers,packages];
}

// State for errors
class PhotographerError extends PhotographerState {
  final String message;

  const PhotographerError(this.message);

  @override
  List<Object?> get props => [message];
}
