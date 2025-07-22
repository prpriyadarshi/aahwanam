import 'package:equatable/equatable.dart';

/// Base class for all Decor events
abstract class DecorEvent extends Equatable {
  const DecorEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch all decorator data
class FetchDecor extends DecorEvent {}

/// Event to select a specific decorator by ID
class SelectDecor extends DecorEvent {
  final String decorId;

  const SelectDecor(this.decorId);

  @override
  List<Object?> get props => [decorId];
}

/// Event to load a specific tab screen (Themes, Get Quote, Gallery, Reviews)
class LoadTabScreen extends DecorEvent {
  final int index;

  const LoadTabScreen(this.index);

  @override
  List<Object?> get props => [index];
}

/// Event to load decorator review data
class LoadDecorationReview extends DecorEvent {}
