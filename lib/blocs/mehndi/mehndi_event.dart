import 'package:equatable/equatable.dart';

abstract class MehndiEvent extends Equatable {
  const MehndiEvent();

  @override
  List<Object?> get props => [];
}
class SelectMehndi extends MehndiEvent {
  final String mehndiId;

  const SelectMehndi(this.mehndiId);

  @override
  List<Object?> get props => [mehndiId];
}
class FetchMehndi extends MehndiEvent {}

class LoadMehndiTabScreen extends MehndiEvent {
  final int index;

  const LoadMehndiTabScreen(this.index);

  @override
  List<Object?> get props => [index];
}


// Triggered when reviews are to be loaded
class LoadMehndiReview extends MehndiEvent {
  const LoadMehndiReview();
}
