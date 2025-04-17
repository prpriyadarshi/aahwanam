import 'package:aahwanam/blocs/mehndi/mehndi_event.dart';
import 'package:aahwanam/blocs/mehndi/mehndi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MehndiBloc extends Bloc<MehndiEvent, MehndiState> {
  MehndiBloc(): super(MehndiInitial()){
    // Handle the FetchPhotographers event
    on<FetchMehndi>((event ,emit ) async {
      emit(MehndiLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final mehndiTheme = [
          {'name': 'Bridal ', 'image': 'assets/images/Bridal1.png'},
          {'name': 'Engagement', 'image': 'assets/images/Engagement.png'},
          {'name': 'Foot', 'image': 'assets/images/Foot.png'},
          {'name': 'Groom ', 'image': 'assets/images/Groom.png'},
          {'name': 'Trendy', 'image': 'assets/images/Trendy.png'},
          {'name': 'Normal', 'image': 'assets/images/Normal.png'},
          {'name': ' Back Side', 'image': 'assets/images/Back Side.png'},
          {'name': 'Minimal', 'image': 'assets/images/Minimal.png'},
        ];

        final mehndiArtists = [
          {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 Onwards', 'rating': '4.3',},
        ];

        final trendingMehndiDesigns = [
          {'image': 'assets/images/TrendingMehndi.png', },
          {'image': 'assets/images/TrendingMehndi1.png', },
          {'image': 'assets/images/TrendingMehndi2.png', },
          {'image': 'assets/images/TrendingMehndi3.png',},
          {'image': 'assets/images/TrendingMehndi4.png', },
        ];

        emit(MehndiLoaded(mehndiTheme,mehndiArtists,trendingMehndiDesigns));
      }catch (e) {
        emit(MehndiLoadedError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectMehndi>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.mehndiId}");
    });

  }

}