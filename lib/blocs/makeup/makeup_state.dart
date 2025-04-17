import 'package:equatable/equatable.dart';

abstract class MakeupState extends Equatable {
  const MakeupState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class MakeupInitial extends MakeupState {}

// State when loading Makeup data
class MakeupLoading extends MakeupState {}

// State when Makeup data is loaded
class MakeupLoaded extends MakeupState {
  final List<Map<String, String>> makeUpLook;
  final List<Map<String, String>> hairStyleLook;
  final List<Map<String, String>> makeupAndHairArtists;
  final List<Map<String, String>> trendingLooks;

  const MakeupLoaded(this.makeUpLook,this.hairStyleLook,this.makeupAndHairArtists,this.trendingLooks);

  @override
  List<Object?> get props => [makeUpLook,hairStyleLook,makeupAndHairArtists,trendingLooks];
}

// State for errors
class MakeupError extends MakeupState {
  final String message;

  const MakeupError(this.message);

  @override
  List<Object?> get props => [message];
}
