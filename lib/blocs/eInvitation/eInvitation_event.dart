import 'package:equatable/equatable.dart';

abstract class EinvitationEvent extends Equatable {
  const EinvitationEvent();

  @override
  List<Object?> get props => [];

}

// Event to fetch invitation data
class FetchEinvitation extends EinvitationEvent {}

// Event to select a specific invitation
class SelectEinvitation extends EinvitationEvent {
  final String invitationId;

  const SelectEinvitation(this.invitationId);

  @override
  List<Object?> get props => [invitationId];
}
