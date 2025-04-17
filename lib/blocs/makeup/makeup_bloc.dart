import 'package:aahwanam/blocs/makeup/makeup_event.dart';
import 'package:aahwanam/blocs/makeup/makeup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeupBloc extends Bloc<MakeupEvent, MakeupState> {
  MakeupBloc(): super(MakeupInitial()){
    // Handle the FetchPhotographers event
    on<FetchMakeup>((event ,emit ) async {
      emit(MakeupLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final makeUpLook = [
          {'name': 'Glam ', 'image': 'assets/images/Glam.png'},
          {'name': 'Bridal', 'image': 'assets/images/Bridal.png'},
          {'name': 'Subtle Look', 'image': 'assets/images/Subtle Look.png'},
          {'name': 'HD ', 'image': 'assets/images/HD.png'},
          {'name': 'Matte', 'image': 'assets/images/Matte.png'},
          {'name': 'Natural', 'image': 'assets/images/Natural.png'},
          {'name': ' Dewy', 'image': 'assets/images/Dewy.png'},
          {'name': 'Glitter', 'image': 'assets/images/Glitter.png'},
        ];

        final hairStyleLook = [
          {'name': 'Curl', 'image': 'assets/images/Curl.png'},
          {'name': 'Straight', 'image': 'assets/images/Straight.png'},
          {'name': 'Wavy', 'image': 'assets/images/Wavy.png'},
          {'name': 'Bun', 'image': 'assets/images/Bun.png'},
          {'name': 'Braid', 'image': 'assets/images/Braid.png'},
          {'name': 'Floral', 'image': 'assets/images/Floral.png'},
          {'name': 'Traditional', 'image': 'assets/images/Traditional.png'},
          {'name': 'Half Down', 'image': 'assets/images/Half Down.png'},
        ];

        final makeupAndHairArtists = [
          {'image': 'assets/images/Blush Makeover.png', 'name': 'Blush Makeover', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Heavens Makeup.png', 'name': 'Heavens Makeup', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/Beauty & Blush.png', 'name': 'Beauty & Blush', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Iconic Makeover.png', 'name': 'Iconic Makeover', 'price': '₹15,000 Onwards', 'rating': '4.3',},

        ];

        final trendingLooks = [
          {'image': 'assets/images/Makeup Trending1.png', },
          {'image': 'assets/images/Makeup Trending2.png', },
          {'image': 'assets/images/Makeup Trending3.png', },
          {'image': 'assets/images/Makeup Trending4.png',},
          {'image': 'assets/images/Makeup Trending5.png', },
        ];

        emit(MakeupLoaded(makeUpLook,hairStyleLook,makeupAndHairArtists,trendingLooks));
      }catch (e) {
        emit(MakeupError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectMakeup>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.makeupId}");
    });

  }

}