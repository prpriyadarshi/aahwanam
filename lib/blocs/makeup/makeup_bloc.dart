import 'package:flutter_bloc/flutter_bloc.dart';
import 'makeup_event.dart';
import 'makeup_state.dart';

class MakeupBloc extends Bloc<MakeupEvent, MakeupState> {
  MakeupBloc() : super(MakeupInitial()) {
    on<FetchMakeup>((event, emit) async {
      emit(MakeupLoading());

      try {
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
          {
            'image': 'assets/images/Blush Makeover.png',
            'name': 'Blush Makeover',
            'price': '₹5,000 Onwards',
            'rating': '4.5',
          },
          {
            'image': 'assets/images/Heavens Makeup.png',
            'name': 'Heavens Makeup',
            'price': '₹3,000 Onwards',
            'rating': '4.3',
          },
          {
            'image': 'assets/images/Beauty & Blush.png',
            'name': 'Beauty & Blush',
            'price': '₹4,000 Onwards',
            'rating': '4.5',
          },
          {
            'image': 'assets/images/Iconic Makeover.png',
            'name': 'Iconic Makeover',
            'price': '₹15,000 Onwards',
            'rating': '4.3',
          },
          {
            'image': 'assets/images/Blush Makeover.png',
            'name': 'Blush Makeover',
            'price': '₹5,000 Onwards',
            'rating': '4.5',
          },
          {
            'image': 'assets/images/Heavens Makeup.png',
            'name': 'Heavens Makeup',
            'price': '₹3,000 Onwards',
            'rating': '4.3',
          },
          {
            'image': 'assets/images/Beauty & Blush.png',
            'name': 'Beauty & Blush',
            'price': '₹4,000 Onwards',
            'rating': '4.5',
          },
          {
            'image': 'assets/images/Iconic Makeover.png',
            'name': 'Iconic Makeover',
            'price': '₹15,000 Onwards',
            'rating': '4.3',
          },
        ];

        final trendingLooks = [
          {'image': 'assets/images/Makeup Trending1.png'},
          {'image': 'assets/images/Makeup Trending2.png'},
          {'image': 'assets/images/Makeup Trending3.png'},
          {'image': 'assets/images/Makeup Trending4.png'},
          {'image': 'assets/images/Makeup Trending5.png'},
        ];

        emit(MakeupLoaded(
          makeUpLook,
          hairStyleLook,
          makeupAndHairArtists,
          trendingLooks,
        ));
      } catch (e) {
        emit(MakeupError("Failed to load makeup data"));
      }
    });

    on<SelectMakeup>((event, emit) {
      print("Makeup selected: ${event.makeupId}");
    });

    on<LoadMakeupTabScreen>((event, emit) async {
      emit(MakeupLoading());
      await Future.delayed(const Duration(milliseconds: 300));

      switch (event.index) {
        case 0:
          final makeupItems = [
            {'image': 'assets/images/Makeup.png', 'price': '₹5000', 'type': 'theme'},
            {'image': 'assets/images/Blush Makeover.png', 'price': '₹5200', 'type': 'theme'},
            {'image': 'assets/images/Makeup Trending1.png', 'price': '₹5400', 'type': 'theme'},
            {'image': 'assets/images/Makeup Trending2.png', 'price': '₹5600', 'type': 'theme'},
            {'image': 'assets/images/Makeup Trending3.png', 'price': '₹5000', 'type': 'theme'},
            {'image': 'assets/images/Makeup Trending4.png', 'price': '₹5200', 'type': 'theme'},
            {'image': 'assets/images/Makeup Trending5.png', 'price': '₹5400', 'type': 'theme'},
            {'image': 'assets/images/Makeup.png', 'price': '₹5600', 'type': 'theme'},
          ];
          emit(MakeupThemesLoaded(makeupItems));
          break;

        case 1:
          emit(GetQuotesLoaded());
          break;

        case 2:
          final galleryImages = [
            'assets/images/Makeup.png',
            'assets/images/Blush Makeover.png',
            'assets/images/Makeup Trending1.png',
            'assets/images/Makeup Trending2.png',
            'assets/images/Makeup Trending3.png',
            'assets/images/Makeup Trending4.png',
            'assets/images/Makeup Trending5.png',
            'assets/images/Makeup Trending2.png',
            'assets/images/Makeup Trending4.png',
            'assets/images/Makeup Trending1.png',
          ];
          emit(makeupGalleryLoaded(galleryImages: galleryImages));
          break;

        case 3:
          final photos = [
            'assets/images/Food Hut.png',
            'assets/images/Food Hut1.png',
            'assets/images/Food Zone.png',
            'assets/images/Pizza.png',
          ];
          final ratingData = {5: 50, 4: 20, 3: 15, 2: 10, 1: 5};
          emit(MakeupReviewLoaded(photos: photos, ratingData: ratingData));
          break;

        default:
          emit(MakeupInitial());
          break;
      }
    });
  }
}
