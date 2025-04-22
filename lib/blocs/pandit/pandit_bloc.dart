import 'package:aahwanam/blocs/pandit/pandit_event.dart';
import 'package:aahwanam/blocs/pandit/pandit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanditBloc extends Bloc<PanditEvent, PanditState> {
  PanditBloc(): super(PanditInitial()){
    // Handle the FetchPhotographers event
    on<FetchPandit>((event ,emit ) async {
      emit(PanditLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));

        final poojaTheme = [
          {'image': 'assets/images/poojatheme.png', 'name': 'Griha Pravesh', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/poojatheme1.png', 'name': 'Durga Pooja', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/poojatheme2.png', 'name': 'Satyanarayana ', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/poojatheme3.png', 'name': 'Ganesh Pooja', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/poojatheme4.png', 'name': 'Laxmi Pooja', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/poojatheme5.png', 'name': 'Durga Pooja', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/poojatheme6.png', 'name': 'Satyanarayana ', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/poojatheme7.png', 'name': 'Ganesh Pooja', 'price': '₹15,000 Onwards', 'rating': '4.3',},
        ];


        emit(PanditLoaded(poojaTheme));
      }catch (e) {
        emit(PanditLoadedError("Failed to load photographers"));
      }
    });

    // Handle the selctpandit event
    on<SelectPandit>((event, emit) {
      // Handle pandit selection logic
      print("Photographer selected: ${event.panditId}");
    });

    on<UpdateSelectedLanguage>((event, emit) {
      // Emit state with updated language if needed
      print("Selected Language: ${event.selectedLanguage}");
    });



  }

}