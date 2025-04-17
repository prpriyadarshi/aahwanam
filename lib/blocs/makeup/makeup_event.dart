import 'package:equatable/equatable.dart';

abstract class MakeupEvent extends Equatable {
  const MakeupEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch Makeup data
class FetchMakeup extends MakeupEvent {}

// Event to select a specific Makeup
class SelectMakeup extends MakeupEvent {
  final String makeupId;

  const SelectMakeup(this.makeupId);

  @override
  List<Object?> get props => [makeupId];
}
