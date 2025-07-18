import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/book_service_details.dart';

import 'decor_event.dart';
import 'decor_state.dart';

class DecorBloc extends Bloc<DecorEvent, DecorState> {
  DecorBloc() : super(DecorInitial()) {
    on<FetchDecor>(_onFetchDecor);
    on<LoadTabScreen>(_onLoadTabScreen);
    on<SelectDecor>(_onSelectDecor);
  }

  Future<void> _onFetchDecor(FetchDecor event, Emitter<DecorState> emit) async {
    emit(DecorLoading());

    try {
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
        {'image': 'assets/images/Party Blush.png', 'name': 'Party Blush', 'price': '₹5,000 Onwards', 'rating': '4.5'},
        {'image': 'assets/images/Dream Decor.png', 'name': 'Dream Decor', 'price': '₹3,000 Onwards', 'rating': '4.3'},
        {'image': 'assets/images/party blush1.png', 'name': 'Party Blush', 'price': '₹4,000 Onwards', 'rating': '4.5'},
        {'image': 'assets/images/party blush2.png', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3'},
        {'image': 'assets/images/party blush3.jpg', 'name': 'Dream Decor', 'price': '₹4,000 Onwards', 'rating': '4.5'},
        {'image': 'assets/images/party blush4.jpg', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3'},
        {'image': 'assets/images/dream decor1.jpg', 'name': 'Dream Decor', 'price': '₹5,000 Onwards', 'rating': '4.3'},
        {'image': 'assets/images/party blush2.png', 'name': 'Dream Decor', 'price': '₹8,000 Onwards', 'rating': '4.3'},
        {'image': 'assets/images/party blush3.jpg', 'name': 'Dream Decor', 'price': '₹4,000 Onwards', 'rating': '4.5'},
        {'image': 'assets/images/party blush4.jpg', 'name': 'Dream Decor', 'price': '₹15,000 Onwards', 'rating': '4.3'},
      ];

      final trendingDecorations = [
        {'image': 'assets/images/trending1.png'},
        {'image': 'assets/images/trending2.png'},
        {'image': 'assets/images/trending3.png'},
        {'image': 'assets/images/trendingDecoration4.png'},
        {'image': 'assets/images/trendingDecoration5.png'},
      ];

      final bookServiceDetails = BookServiceDetails(
        title: 'Silver Package by Photo Studio',
        imagePath: 'assets/images/photographer.png',
        description: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
        price: '8,000 ',
        locationTitle: 'Financial District',
        locationDescription: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
        eventDate: '',
        eventTime: '',
        serviceCharge: '1,000',
        platformFee: '500',
        transportFee: '500',
        totalAmount: '2,000',
      );

      emit(DecorLoaded(
        eventsAndThemes: eventsAndThemes,
        decorators: decorators,
        trendingDecorations: trendingDecorations,
        bookServiceDetails: bookServiceDetails,
      ));
    } catch (e) {
      emit(DecorLoadedError("Failed to load decorators"));
    }
  }

  Future<void> _onLoadTabScreen(LoadTabScreen event, Emitter<DecorState> emit) async {
    emit(DecorLoading());
    await Future.delayed(Duration(milliseconds: 300));

    switch (event.index) {
      case 0:
        final birthdayItems = [
          {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5000', 'type': 'theme'},
          {'image': 'assets/images/Anniversary1.png', 'price': '₹5200', 'type': 'theme'},
          {'image': 'assets/images/birthday_decor.png', 'price': '₹5400', 'type': 'theme'},
          {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5600', 'type': 'theme'},
          {'image': 'assets/images/baby.png', 'price': '₹5000', 'type': 'theme'},
          {'image': 'assets/images/birthdayGallery3.png', 'price': '₹5200', 'type': 'theme'},
          {'image': 'assets/images/dream decor1.jpg', 'price': '₹5400', 'type': 'theme'},
          {'image': 'assets/images/Birthdaydecoration.jpg', 'price': '₹5600', 'type': 'theme'},
        ];
        emit(ThemesLoaded(birthdayItems));
        break;

      case 1:
        emit(GetQuotesLoaded());
        break;

      case 2:
        final galleryImages = [
          'assets/images/birthdayGallery.png',
          'assets/images/birthdayGallery1.png',
          'assets/images/birthdayGallery2.png',
          'assets/images/birthdayGallery3.png',
          'assets/images/Anniversary.png',
          'assets/images/Anniversary1.png',
          'assets/images/Anniversary2.png',
          'assets/images/Anniversary.png',
          'assets/images/poojatheme1.png',
          'assets/images/poojatheme2.png',
          'assets/images/poojatheme3.png',
          'assets/images/poojatheme4.png',
        ];
        emit(GalleryLoaded(galleryImages: galleryImages));
        break;

      case 3:
        final photos = [
          'assets/images/Food Hut.png',
          'assets/images/Food Hut1.png',
          'assets/images/Food Zone.png',
          'assets/images/Food Hut.png',
          'assets/images/Pizza.png',
        ];
        final ratingData = {5: 50, 4: 20, 3: 15, 2: 10, 1: 5};
        emit(DecorationReviewLoaded(photos: photos, ratingData: ratingData));
        break;
    }
  }

  void _onSelectDecor(SelectDecor event, Emitter<DecorState> emit) {
    print("Decor selected: ${event.decorId}");
    // You can emit some state if needed
  }
}
