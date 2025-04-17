import 'package:equatable/equatable.dart';

abstract class EntertainmentEvent extends Equatable {
  const EntertainmentEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch EntertainmentId data
class FetchEntertainment extends EntertainmentEvent {}

// Event to select a specific EntertainmentId
class SelectEntertainment extends EntertainmentEvent {
  final String entertainmentId;

  const SelectEntertainment(this.entertainmentId);

  @override
  List<Object?> get props => [entertainmentId];
}
