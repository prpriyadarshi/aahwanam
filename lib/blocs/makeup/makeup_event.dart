import 'package:equatable/equatable.dart';

/// Base class for all MakeupHair events
abstract class MakeupEvent extends Equatable {
  const MakeupEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch all makeup data
class FetchMakeup extends MakeupEvent {}

/// Event to select a specific makeup service by ID
class SelectMakeup extends MakeupEvent {
  final String makeupId;

  const SelectMakeup(this.makeupId);

  @override
  List<Object?> get props => [makeupId];
}

/// Event to load a specific tab screen (like Themes, Quotes, Gallery, Reviews)
class LoadMakeupTabScreen extends MakeupEvent {
  final int index;

  const LoadMakeupTabScreen(this.index);

  @override
  List<Object?> get props => [index];
}

/// Event to load makeup hair review data
class LoadMakeupHairReview extends MakeupEvent {}
