import 'package:equatable/equatable.dart';

abstract class BartenderState extends Equatable {
  const BartenderState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class BartenderInitial extends BartenderState {}

// State when loading  Bartender data
class  BartenderLoading extends BartenderState {}

// State when  Bartender data is loaded
class BartenderLoaded extends BartenderState {
  final List<Map<String, dynamic>> Packages;

  const BartenderLoaded(this.Packages);

  @override
  List<Object?> get props => [Packages];
}

// State for errors
class BartenderError extends BartenderState {
  final String message;

  const BartenderError(this.message);

  @override
  List<Object?> get props => [message];
}
