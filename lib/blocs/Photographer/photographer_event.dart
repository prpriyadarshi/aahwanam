import 'package:equatable/equatable.dart';

abstract class PhotographerEvent extends Equatable {
  const PhotographerEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch photographer data
class FetchPhotographers extends PhotographerEvent {}

// Event to select a specific photographer
class SelectPhotographer extends PhotographerEvent {
  final String photographerId;

  const SelectPhotographer(this.photographerId);

  @override
  List<Object?> get props => [photographerId];
}
