
import 'package:aahwanam/blocs/bartender/bartender_event.dart';
import 'package:aahwanam/blocs/bartender/bartender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BartenderBloc extends Bloc<BartenderEvent, BartenderState> {
  BartenderBloc(): super(BartenderInitial()){
    // Handle the FetchPhotographers event
    on<FetchBartender>((event ,emit ) async {
      emit(BartenderLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));


        final Packages = [
          {
            "title": "Basic package",
            "description": "When You Provide All The Supplies & All You Need Is A Great Bartender to pour beer and wine.",
            "price": "2,000",
            "details": "we provide 1 per 70 guests.",
            "imagePath": "assets/images/Bartender1.png",
            "rating": 4.3,
          },

          {
            "title": "Mixologist package",
            "description": "Pouring for beer and wine service. with Flair bartending skills for added entertainment to your event.",
            "price": "3,000",
            "details": "we provide 1 per 50 guests.",
            "imagePath": "assets/images/Bartender2.png",
            "rating": 4.2,
          },

          {
            "title": "Complete package",
            "description": "Our Bartenders will bring everything needed for your event.  perfect for those who want a hassle-free service..",
            "price": "10,000",
            "details": "we provide 1 per 50 guests.",
            "imagePath": "assets/images/Bartender3.png",
            "rating": 4.2,
          },

          // Add more package data here
        ];


        emit(BartenderLoaded(Packages));
      }catch (e) {
        emit(BartenderError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectBartender>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.bartenderId}");
    });

  }

}