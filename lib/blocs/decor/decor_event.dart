import 'package:equatable/equatable.dart';

abstract class DecorEvent extends Equatable {
  const DecorEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch DecorID data
class FetchDecor extends DecorEvent {}

// Event to select a specific Decor
class SelectDecor extends DecorEvent {
  final String decorId;

  const SelectDecor(this.decorId);

  @override
  List<Object?> get props => [decorId];
}
