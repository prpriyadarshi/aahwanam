import 'package:equatable/equatable.dart';

abstract class DecorState extends Equatable {
  const DecorState();

  @override
  List<Object?> get props => []; // Fixed to 'props'

}

// Initial state
class DecorInitial extends DecorState {}

// State when loading DecorState data
class DecorLoading extends DecorState {}

// State when DecorState data is loaded
class DecorLoaded extends DecorState {
  final List<Map<String, String>> eventsAndThemes;
  final List<Map<String, String>> decorators;
  final List<Map<String, String>> trendingDecorations;

  const DecorLoaded(this.eventsAndThemes,this.decorators,this.trendingDecorations);

  @override
  List<Object?> get props => [eventsAndThemes,decorators,trendingDecorations];

}

// State for errors
class DecorLoadedError extends DecorState {
  final String message;

  const DecorLoadedError(this.message);

  @override
  List<Object?> get props => [message];
}
