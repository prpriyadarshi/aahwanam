import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/getquotesscreen.dart';
import '../decor/decor_state.dart';
import 'mehndi_event.dart';
import 'mehndi_state.dart';

class MehndiBloc extends Bloc<MehndiEvent, MehndiState> {
  MehndiBloc() : super(MehndiInitial()) {
    on<FetchMehndi>((event, emit) async {
      emit(MehndiLoading());

      try {
        await Future.delayed(Duration(seconds: 2));

        final mehndiTheme = [
          {'name': 'Bridal', 'image': 'assets/images/Bridal1.png'},
          {'name': 'Engagement', 'image': 'assets/images/Engagement.png'},
          {'name': 'Foot', 'image': 'assets/images/Foot.png'},
          {'name': 'Groom', 'image': 'assets/images/Groom.png'},
          {'name': 'Trendy', 'image': 'assets/images/Trendy.png'},
          {'name': 'Normal', 'image': 'assets/images/Normal.png'},
          {'name': 'Back Side', 'image': 'assets/images/Back Side.png'},
          {'name': 'Minimal', 'image': 'assets/images/Minimal.png'},
        ];

        final mehndiArtists = [
          {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 Onwards', 'rating': '4.5'},
          {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 Onwards', 'rating': '4.3'},
          {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 Onwards', 'rating': '4.5'},
          {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 Onwards', 'rating': '4.3'},
        ];

        final trendingMehndiDesigns = [
          {'image': 'assets/images/TrendingMehndi.png'},
          {'image': 'assets/images/TrendingMehndi1.png'},
          {'image': 'assets/images/TrendingMehndi2.png'},
          {'image': 'assets/images/TrendingMehndi3.png'},
          {'image': 'assets/images/TrendingMehndi4.png'},
        ];

        emit(MehndiLoaded(mehndiTheme, mehndiArtists, trendingMehndiDesigns));
      } catch (_) {
        emit(MehndiLoadedError("Failed to load Mehndi data"));
      }
    });

    on<SelectMehndi>((event, emit) {
      print("Mehndi selected: ${event.mehndiId}");
    });

    on<LoadMehndiTabScreen>((event, emit) async {
      emit(MehndiLoading());
      await Future.delayed(const Duration(milliseconds: 300));

      switch (event.index) {
        case 0:
        // Themes
          final themes = [
            {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 ', 'rating': '4.5'},
            {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 ', 'rating': '4.3'},
            {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 ', 'rating': '4.5'},
            {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 ', 'rating': '4.3'},
            {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 ', 'rating': '4.5'},
            {'image': 'assets/images/Mehndi & Beauty1.png', 'name': 'Mehndi Stars', 'price': '₹3,000 ', 'rating': '4.3'},
            {'image': 'assets/images/Mehndi & Art.png', 'name': 'Mehndi & Art', 'price': '₹4,000 ', 'rating': '4.5'},
            {'image': 'assets/images/Iconic Mehndi.png', 'name': 'Iconic Mehndi', 'price': '₹15,000 ', 'rating': '4.3'},
          ];
          emit(ThemesMehndiLoaded(themes));
          break;
        case 1:
        // Get Quotes
          emit(GetQuotesMehndiLoaded());
          break;
        case 2:
          final galleryImages = [
            'assets/images/Mehndi & Beauty.png',
            'assets/images/Mehndi & Beauty1.png',
            'assets/images/Mehndi & Art.png',
            'assets/images/Iconic Mehndi.png',
            'assets/images/TrendingMehndi4.png',
            'assets/images/TrendingMehndi.png',
            'assets/images/TrendingMehndi1.png',
            'assets/images/TrendingMehndi2.png',
            'assets/images/TrendingMehndi3.png',
            'assets/images/TrendingMehndi4.png',
            'assets/images/Mehndi & Art.png',
          ];

          emit(MehndiGalleryLoaded(galleryImages: galleryImages));

          break;
        case 3:
        // Reviews
          final photos = [
            'assets/images/Food Hut.png',
            'assets/images/Food Hut1.png',
            'assets/images/Food Zone.png',
            'assets/images/Pizza.png',
          ];
          final ratingData = {5: 50, 4: 20, 3: 15, 2: 10, 1: 5};
          emit(MehndiReviewLoaded(photos: photos, ratingData: ratingData));
          break;
        default:
          emit(MehndiLoadedError('Invalid tab index'));
      }
    });

  }
}
