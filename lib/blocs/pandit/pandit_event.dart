import 'package:equatable/equatable.dart';

abstract class PanditEvent extends Equatable {
  const PanditEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch PanditID data
class FetchPandit extends PanditEvent {}

// Event to select a specific Pandit
class SelectPandit extends PanditEvent {
  final String panditId;

  const SelectPandit(this.panditId);

  @override
  List<Object?> get props => [panditId];
}

class UpdateSelectedLanguage extends PanditEvent {
  final String selectedLanguage;

  UpdateSelectedLanguage(this.selectedLanguage);
}



