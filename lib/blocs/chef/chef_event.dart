import 'package:equatable/equatable.dart';

abstract class ChefEvent extends Equatable {
  const ChefEvent();

  @override
  List<Object?> get props => [];
}

class FetchChefs extends ChefEvent {}

class SelectChefs extends ChefEvent {
  final String chefId;

  const SelectChefs(this.chefId);

  @override
  List<Object?> get props => [chefId];
}

class LoadChefTabScreen extends ChefEvent {
  final int index;

  const LoadChefTabScreen(this.index);

  @override
  List<Object?> get props => [index];
}
