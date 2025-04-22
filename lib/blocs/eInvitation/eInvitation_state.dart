import 'package:equatable/equatable.dart';

abstract class EinvitationState extends Equatable {
  const EinvitationState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class EinvitationInitial extends EinvitationState {}

// State when loading Einvitation data
class EinvitationLoading extends EinvitationState {}

// State when Einvitation data is loaded
class EinvitationLoaded extends EinvitationState {
  final List<Map<String, String>> invitationThemes;
  final List<Map<String, String>> trendyTemplates;
  final List<Map<String, String>> videoTemplates;


  const EinvitationLoaded(this.invitationThemes,this.trendyTemplates,this.videoTemplates);

  @override
  List<Object?> get props => [invitationThemes,trendyTemplates,videoTemplates];
}

// State for errors
class EinvitationError extends EinvitationState {
  final String message;

  const EinvitationError(this.message);

  @override
  List<Object?> get props => [message];
}

