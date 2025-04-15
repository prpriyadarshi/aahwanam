import 'package:equatable/equatable.dart';

abstract class ChefEvent extends Equatable {
  const ChefEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch chef data
class FetchChefs extends ChefEvent {}

// Event to select a specific chef
class SelectChefs extends ChefEvent {
  final String chefId;

  const SelectChefs(this.chefId);

  @override
  List<Object?> get props => [chefId];
}
