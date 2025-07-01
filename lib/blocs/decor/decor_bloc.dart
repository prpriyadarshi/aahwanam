import 'package:aahwanam/blocs/decor/decor_event.dart';
import 'package:aahwanam/blocs/decor/decor_state.dart';
import 'package:aahwanam/blocs/mehndi/mehndi_event.dart';
import 'package:aahwanam/blocs/mehndi/mehndi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecorBloc extends Bloc<DecorEvent, DecorState> {
  DecorBloc(): super(DecorInitial()){
    // Handle the FetchPhotographers event
    on<FetchDecor>((event ,emit ) async {
      emit(DecorLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final eventsAndThemes = [
          {'name': 'Birthday ', 'image': 'assets/images/Birthday2.png'},
          {'name': 'Marriage', 'image': 'assets/images/marraige.png'},
          {'name': 'Anniversary', 'image': 'assets/images/Anniversary1.png'},
          {'name': 'Floral ', 'image': 'assets/images/Floral1.png'},
          {'name': 'Pooja', 'image': 'assets/images/Pooja.png'},
          {'name': 'Haldi', 'image': 'assets/images/Haldi.png'},
          {'name': 'Baby shower', 'image': 'assets/images/Baby shower.png'},
          {'name': 'Others', 'image': 'assets/images/Others1.png'},
        ];

        final decorators = [
          {'image': 'assets/images/Party Blush.png', 'name': 'Party Blush', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Dream Decor.png', 'name': 'Dream Decor', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/party blush1.png', 'name': 'Party Blush', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/party blush2.png', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/party blush3.jpg', 'name': 'Dream Decor', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/party blush4.jpg', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/dream decor1.jpg', 'name': 'Dream Decor', 'price': '₹5,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/party blush2.png', 'name': 'Dream Decor', 'price': '₹8,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/party blush3.jpg', 'name': 'Dream Decor', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/party blush4.jpg', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3',},
        ];

        final trendingDecorations = [
          {'image': 'assets/images/trending1.png', },
          {'image': 'assets/images/trending2.png', },
          {'image': 'assets/images/trending3.png', },
          {'image': 'assets/images/trendingDecoration4.png',},
          {'image': 'assets/images/trendingDecoration5.png', },
        ];

        emit(DecorLoaded(eventsAndThemes,decorators,trendingDecorations));
      }catch (e) {
        emit(DecorLoadedError("Failed to load photographers"));
      }
    });

    // Handle the SelectDecor event
    on<SelectDecor>((event, emit) {
      // Handle Decor selection logic
      print("Decor selected: ${event.decorId}");
    });

  }

}