import 'package:aahwanam/blocs/Photographer/photographer_event.dart';
import 'package:aahwanam/blocs/Photographer/photographer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotographerBloc extends Bloc<PhotographerEvent, PhotographerState> {
  PhotographerBloc() : super(PhotographerInitial()) {
    // Handle the FetchPhotographers event
    on<FetchPhotographers>((event, emit) async {
      emit(PhotographerLoading());

      try {
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final photographers = [
          {'name': 'Birthday', 'image': 'assets/images/Birthday1.png'},
          {'name': 'Marriage', 'image': 'assets/images/Marriage.png'},
          {'name': 'Anniversary', 'image': 'assets/images/Anniversary2.png'},
          {'name': 'Baby Shoot', 'image': 'assets/images/Baby Shoot.png'},
          {'name': 'Prewedding', 'image': 'assets/images/Prewedding.png'},
          {'name': 'Corporate', 'image': 'assets/images/Corporate.png'},
          {
            'name': 'Maternity Shoot',
            'image': 'assets/images/Maternity shoot.png'
          },
          {'name': 'Others', 'image': 'assets/images/Others.png'},
        ];

        final packages = [
          {
            "title": "Gold package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Silver package.png",
            "rating": 4.2,
          },

          {
            "title": "Gold package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Gold package.png",
            "rating": 4.2,
          },

          {
            "title": "Diamond package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Diamond package.png",
            "rating": 4.2,
          },

          {
            "title": "Baby Photoshoot ",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/baby.png",
            "rating": 4.2,
          },

          {
            "title": "Pre-Wedding Shoot ",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Pre-Wedding Shoot.png",
            "rating": 4.2,
          },

          {
            "title": "Full Wedding Pack",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Full Wedding Pack.png",
            "rating": 4.2,
          },
          // Add more package data here
        ];

        final birthdayPackages = [
          {
            "title": "Gold package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Silver package.png",
            "rating": 4.2,
          },

          {
            "title": "Gold package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Gold package.png",
            "rating": 4.2,
          },

          {
            "title": "Diamond package",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Diamond package.png",
            "rating": 4.2,
          },

          // Add more package data here
        ];

        final babyShootPackages = [
          {
            "title": "Baby Photoshoot ",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/baby.png",
            "rating": 4.2,
          },
        ];

        final preWeddingPackages = [
          {
            "title": "Pre-Wedding Shoot",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Pre-Wedding Shoot.png",
            "rating": 4.2,
          },
        ];

        final fullWeddingPackages = [
          {
            "title": "Full Wedding Pack",
            "description":
                "When all you need a budget-friendly photography and personal shoot for your event.",
            "price": "12,000",
            "details": "This includes 1 Photographer & soft copies of photos.",
            "imagePath": "assets/images/Full Wedding Pack.png",
            "rating": 4.2,
          },
          // Add more package data here
        ];

        final photoAndvideographers = [
          {'image': 'assets/images/photo&video.png', 'name': 'Photo Studio', 'price': '₹15,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/photo&video1.png', 'name': 'Photo World', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/photo&video2.png', 'name': 'Iconic Studio', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/photo&video3.png', 'name': 'Photo Art', 'price': '₹5,000 Onwards', 'rating': '4.2',},
          {'image': 'assets/images/photo&video9.png', 'name': 'Photo Art', 'price': '₹5,000 Onwards', 'rating': '4.73',},
          {'image': 'assets/images/photo&video4.png', 'name': 'Photo World', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/photo&video5.png', 'name': 'Photo Gallery', 'price': '₹15,000 Onwards', 'rating': '4.2',},
          {'image': 'assets/images/photo&video6.png', 'name': 'Photo Studio', 'price': '₹4,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/photo&video7.png', 'name': 'Photo Gallery', 'price': '₹5,000 Onwards', 'rating': '4.4',},
          {'image': 'assets/images/photo&video8.png', 'name': 'Iconic Studio', 'price': '₹15,000 Onwards', 'rating': '4.7',},

        ];

        emit(PhotographerLoaded(photographers, packages, birthdayPackages,
            babyShootPackages, preWeddingPackages, fullWeddingPackages,photoAndvideographers));
      } catch (e) {
        emit(PhotographerError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectPhotographer>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.photographerId}");
    });
  }
}
