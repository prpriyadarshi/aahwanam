import 'package:aahwanam/blocs/eInvitation/eInvitation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'eInvitation_state.dart';

class EinvitationBloc extends Bloc<EinvitationEvent, EinvitationState> {
  EinvitationBloc(): super(EinvitationInitial()){
    // Handle the FetchEinvitation event
    on<FetchEinvitation>((event ,emit ) async {
      emit(EinvitationLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final invitationThemes = [
          {'name': 'Birthday ', 'image': 'assets/images/invitationTheme.png'},
          {'name': 'Marriage', 'image': 'assets/images/invitationTheme1.png'},
          {'name': ' Anniversary', 'image': 'assets/images/invitationTheme2.png'},
          {'name': 'Save Dates ', 'image': 'assets/images/invitationTheme3.png'},
          {'name': 'Pooja', 'image': 'assets/images/invitationTheme4.png'},
          {'name': 'Haldi', 'image': 'assets/images/invitationTheme5.png'},
          {'name': ' Baby shower', 'image': 'assets/images/invitationTheme6.png'},
          {'name': 'Video Card', 'image': 'assets/images/invitationTheme7.png'},
        ];

        final trendyTemplates = [
          { 'image': 'assets/images/trendyTem.png'},
          { 'image': 'assets/images/trendyTem1.png'},
          { 'image': 'assets/images/trendyTem2.png'},
          {'image': 'assets/images/trendyTem3.png'},
          {'image': 'assets/images/trendyTem4.png'},
          {'image': 'assets/images/trendyTem5.png'},
        ];

        final videoTemplates = [
          {'image': 'assets/images/videoTem.png',},
          {'image': 'assets/images/videoTem1.png',},
          {'image': 'assets/images/videoTem2.png',},
          {'image': 'assets/images/videoTem3.png',},

        ];

        emit(EinvitationLoaded(invitationThemes,trendyTemplates,videoTemplates));
      }catch (e) {
        emit(EinvitationError("Failed to load photographers"));
      }
    });

    // Handle the SelectEinvitation event
    on<SelectEinvitation>((event, emit) {
      // Handle photographer selection logic
      print("Einvitation selected: ${event.invitationId}");
    });

  }

}