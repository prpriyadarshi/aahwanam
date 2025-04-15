import 'package:equatable/equatable.dart';

abstract class ChefState extends Equatable {
  const ChefState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class ChefInitial extends ChefState {}

// State when loading Chef data
class ChefLoading extends ChefState {}

// State when Chef data is loaded
class ChefLoaded extends ChefState {
  final List<Map<String, String>> Categories;
  final List<Map<String, String>> chefs;

  const ChefLoaded(this.Categories,this.chefs);

  @override
  List<Object?> get props => [Categories,chefs];
}

// State for errors
class ChefError extends ChefState {
  final String message;

  const ChefError(this.message);

  @override
  List<Object?> get props => [message];
}
