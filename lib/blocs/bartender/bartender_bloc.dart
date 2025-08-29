
import 'package:aahwanam/blocs/bartender/bartender_event.dart';
import 'package:aahwanam/blocs/bartender/bartender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BartenderBloc extends Bloc<BartenderEvent, BartenderState> {
  BartenderBloc(): super(BartenderInitial()){
    // Handle the FetchPhotographers event
    on<FetchBartender>((event ,emit ) async {
      emit(BartenderLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));


        final Packages = [
          {
            "title": "Basic package",
            "description": "When You Provide All The Supplies & All You Need Is A Great Bartender to pour beer and wine.",
            "price": "2,000",
            "details": "we provide 1 per 70 guests.",
            "imagePath": "assets/images/Bartender1.png",
            "rating": 4.3,
            "included": [
              "Bartender, shaker, wine key, bottle opener, spill mat, ice bucket, and serving bins.",
              "Responsibility for wine and beer storage at proper temperatures.",
              "Maintaining a clean and orderly environment.",
              "Answering all questions about the wine & beer options available."
            ],
            "reviews": [
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              },
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              }
            ],
            "photo_gallery": [
              {

                "category": "Kitty Party",
                "images": [
                  "assets/images/KittyParty4.png",
                  "assets/images/Kitty-party2.png",
                  "assets/images/Kitty-party1.png",
                  "assets/images/Kitty-party1.png"
                ],
              },
              {

                "category": "Get Together",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Get-Together2.png",
                  "assets/images/Get-Together3.png",
                  "assets/images/Kitty-party1.png",

                ]
              },
              {
                "category": "Birthday Party",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Birthday-Party1.png",
                  "assets/images/Get-Together2.png",
                  "assets/images/Kitty-party1.png",
                ]

              }
            ]
          },

          {
            "title": "Mixologist package",
            "description": "Pouring for beer and wine service. with Flair bartending skills for added entertainment to your event.",
            "price": "3,000",
            "details": "we provide 1 per 50 guests.",
            "imagePath": "assets/images/Bartender2.png",
            "rating": 4.2,
            "included": [
          "A skilled, certified mixologist who will prepare classic, seasonal, and signature cocktails tailored to your event.",
          "Mixologists who are trained in flair bartending to provide entertaining, interactive service as they craft your drinks.",
          "Shaker, wine key, bottle opener, spill mat, ice bucket, and serving bins.",
          "Responsibility for wine and beer storage at proper temperatures.",
          "Maintaining a clean and order environment.",
          "Answering questions about the wine & beer options.",
            ],
            "reviews": [
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              },
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              }
            ],
            "photo_gallery": [
              {

                "category": "Kitty Party",
                "images": [
                  "assets/images/KittyParty4.png",
                  "assets/images/Kitty-party2.png",
                  "assets/images/Kitty-party1.png"
                ],
              },
              {

                "category": "Get Together",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Get-Together2.png",
                  "assets/images/Get-Together3.png"
                ]
              },
              {
                "category": "Birthday Party",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Birthday-Party1.png",
                  "assets/images/Get-Together2.png"
                ]

              }
            ],
          },

          {
            "title": "Complete package",
            "description": "Our Bartenders will bring everything needed for your event.  perfect for those who want a hassle-free service..",
            "price": "10,000",
            "details": "we provide 1 per 50 guests.",
            "imagePath": "assets/images/Bartender3.png",
            "rating": 4.2,
            "included": [
          "Our top 2 bartender for 150 guests will be at your service, equipped with the best in class tools for an exceptional experience.",
          "Sophisticated glassware to compliment your drinks and enhance the overall experience.",
          "Ambient Lighting and Bar Props.",
          "A Cocktail Menu having numbers of crafted cocktails that suits your event.",
          "Free advice from our experts to calculate Alcohol price and quantity.",
          "Includes All the Bar Tools.",
          "A Portable Bar with Linens, Coolers, Water, Mixers, Juice, Soda, Garnish, and an abundance of ice to keep your drinks cool and refreshing!",
          "Includes All Dry Goods to include Disposable Cups (9oz & 12oz), Cocktail Napkins, Straws, and Cocktail Picks.",
          "Pick up to 3 Mixers to Include: One Soda(Coke, Sprite, Ginger Ale etc..) Club Soda, Tonic Water, Ginger Beer, Margarita Mix, Sweet n’ Sour, Simple Syrup, Grenadine, Lime, and Lemon Juice.",
          "Pick up to 3 Juices to Include: Orange, Cranberry, Lemonade, Grapefruit, and Pineapple Juice.",
          "Pick up to 4 Garnishes to Include: Lemons, Limes, Oranges, Olives, Cherries, and Mint.",
          "Responsibility for wine and beer storage at proper temperatures.",
          "Maintaining a clean and order environment.",
            ],
            "reviews": [
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              },
              {
                "rating": 4.2,
                "comment": "Very good service",
                "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                "image": "assets/images/Bartender-review.png"
              }

            ],
            "photo_gallery": [
              {

                "category": "Kitty Party",
                "images": [
                  "assets/images/KittyParty4.png",
                  "assets/images/Kitty-party2.png",
                  "assets/images/Kitty-party1.png"
                ],
              },
              {

                "category": "Get Together",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Get-Together2.png",
                  "assets/images/Get-Together3.png"
                ]
              },
              {
                "category": "Birthday Party",
                "images": [
                  "assets/images/Get-Together1.png",
                  "assets/images/Birthday-Party1.png",
                  "assets/images/Get-Together2.png"
                ]

              }
            ],
          },

          // Add more package data here
        ];


        emit(BartenderLoaded(Packages));
      }catch (e) {
        emit(BartenderError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectBartender>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.bartenderId}");
    });

  }

}