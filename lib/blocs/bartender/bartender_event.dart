import 'package:equatable/equatable.dart';

abstract class BartenderEvent extends Equatable {
  const BartenderEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch Bartender data
class FetchBartender extends BartenderEvent {}

// Event to select a specific Bartender
class SelectBartender extends BartenderEvent {
  final String bartenderId;

  const SelectBartender(this.bartenderId);

  @override
  List<Object?> get props => [bartenderId];
}
