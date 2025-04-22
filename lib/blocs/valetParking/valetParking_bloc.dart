import 'package:aahwanam/blocs/valetParking/valetParking_event.dart';
import 'package:aahwanam/blocs/valetParking/valetParking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValetParkingBloc extends Bloc<ValetParkingEvent, ValetParkingState> {
  ValetParkingBloc(): super(ValetParkingInitial()){
    // Handle the FetchValet event
    on<FetchValetParking>((event ,emit ) async {
      emit(ValetParkingLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));


        final Packages = [
          {
            "title": "Basic Service",
            "description": "When all you need a budget friendly valet associates for your event. so that you just relax and enjoy the event.",
            "price": "2,000",
            "details": "we provide 1 per 50 guests.",
            "imagePath": "assets/images/Basic Service.png",
            "rating": 4.3,
          },

          {
            "title": "Royal Service",
            "description": "Experience the art of hospitality with our luxury valet associates for your VIP entry. professionals handle the parking for you.",
            "price": "3,000",
            "details": "we provide 1 per 40 guests.",
            "imagePath": "assets/images/Royal Service.png",
            "rating": 4.2,
          },

          // Add more package data here
        ];


        emit(ValetParkingLoaded(Packages));
      }catch (e) {
        emit(ValetParkingError("Failed to load photographers"));
      }
    });

    // Handle the SelectValet event
    on<SelectValetParking>((event, emit) {
      // Handle photographer selection logic
      print("Valet selected: ${event.valetId}");
    });

  }

}