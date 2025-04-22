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
          {'name': 'Glam ', 'image': 'assets/images/Glam.png'},
          {'name': 'Bridal', 'image': 'assets/images/Bridal.png'},
          {'name': 'Subtle Look', 'image': 'assets/images/Subtle Look.png'},
          {'name': 'HD ', 'image': 'assets/images/HD.png'},
          {'name': 'Matte', 'image': 'assets/images/Matte.png'},
          {'name': 'Natural', 'image': 'assets/images/Natural.png'},
          {'name': ' Dewy', 'image': 'assets/images/Dewy.png'},
          {'name': 'Glitter', 'image': 'assets/images/Glitter.png'},
        ];

        final trendyTemplates = [
          {'name': 'Curl', 'image': 'assets/images/Curl.png'},
          {'name': 'Straight', 'image': 'assets/images/Straight.png'},
          {'name': 'Wavy', 'image': 'assets/images/Wavy.png'},
          {'name': 'Bun', 'image': 'assets/images/Bun.png'},
          {'name': 'Braid', 'image': 'assets/images/Braid.png'},
          {'name': 'Floral', 'image': 'assets/images/Floral.png'},
          {'name': 'Traditional', 'image': 'assets/images/Traditional.png'},
          {'name': 'Half Down', 'image': 'assets/images/Half Down.png'},
        ];

        final videoTemplates = [
          {'image': 'assets/images/Blush Makeover.png', 'name': 'Blush Makeover', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Heavens Makeup.png', 'name': 'Heavens Makeup', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/Beauty & Blush.png', 'name': 'Beauty & Blush', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Iconic Makeover.png', 'name': 'Iconic Makeover', 'price': '₹15,000 Onwards', 'rating': '4.3',},

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