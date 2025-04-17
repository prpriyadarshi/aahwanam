import 'package:equatable/equatable.dart';

abstract class MehndiEvent extends Equatable {
  const MehndiEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch MehndiID data
class FetchMehndi extends MehndiEvent {}

// Event to select a specific Mehndi
class SelectMehndi extends MehndiEvent {
  final String mehndiId;

  const SelectMehndi(this.mehndiId);

  @override
  List<Object?> get props => [mehndiId];
}
