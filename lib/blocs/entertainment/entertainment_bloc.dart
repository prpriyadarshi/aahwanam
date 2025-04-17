import 'package:aahwanam/blocs/entertainment/entertainment_event.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntertainmentBloc extends Bloc<EntertainmentEvent, EntertainmentState> {
  EntertainmentBloc(): super(EntertainmentInitial()){
    // Handle the FetchEntertainement event
    on<FetchEntertainment>((event ,emit ) async {
      emit(EntertainmentLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final Services = [
          {'image': 'assets/images/Band.png', 'name': 'Band', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Drums.png', 'name': 'Drums', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/DJ.png', 'name': 'DJ', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Choreographer.png', 'name': 'Choreographer', 'price': '₹15,000 Onwards', 'rating': '4.3',},
        ];

        emit(EntertainmentLoaded(Services));
      }catch (e) {
        emit(EntertainmentError("Failed to load photographers"));
      }
    });

    // Handle the Entertainment event
    on<SelectEntertainment>((event, emit) {
      // Handle Entertainment selection logic
      print("Entertainment selected: ${event.entertainmentId}");
    });

  }

}