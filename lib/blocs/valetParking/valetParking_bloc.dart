import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/gallery_section.dart';
import '../../models/service_details.dart';
import 'valetParking_event.dart';
import 'valetParking_state.dart';

class ValetParkingBloc extends Bloc<ValetParkingEvent, ValetParkingState> {
  ValetParkingBloc() : super(ValetParkingInitial()) {
    // Load main valet parking screen
    on<FetchValetParking>((event, emit) async {
      emit(ValetParkingLoading());

      try {
        await Future.delayed(const Duration(seconds: 1));

        final packages = [
          {
            "title": "Basic Service",
            "description": "When all you need is budget friendly valet associates for your event so you can just relax and enjoy.",
            "price": "₹2,000",
            "details": "We provide 1 valet per 50 guests.",
            "imagePath": "assets/images/Basic Service.png",
            "rating": 4.3,
          },
          {
            "title": "Royal Service",
            "description": "Experience the art of hospitality with our luxury valet associates for VIP entries.",
            "price": "₹3,000",
            "details": "We provide 1 valet per 40 guests.",
            "imagePath": "assets/images/Royal Service.png",
            "rating": 4.2,
          },
        ];
        final serviceDetails = ServiceDetails(
          name: "Basic Service",
          imagePath: "assets/images/baby shoot main.png",
          price: 15000.0,
          rating: 4.7,
          heading: "Basic Package",
          packagePrice: "₹20,000",
          description: "Basic Package Bartending Service offers a fantastic choice for those who  need a budget friendly valet associates for your event. so that you just relax and enjoy the event. ",
          subHeading: "Included in this Package are:",
          subHeadingDetails: '''
Professional driver can handle any type of car.
Maintaining a clean and order environment.
Answering questions about the parking.
''',

          eventTitle: "Get quotes for your event",
          address: "Financial District",
          addressDescription: "OLorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,",
          mediaSections: [
            GallerySection(
              title: "Birthday Photoshoot",
              mediaPaths: [
                'assets/images/birthdayGallery.png',
                'assets/images/birthdayGallery1.png',
                'assets/images/birthdayGallery2.png',
                'assets/images/birthdayGallery3.png',
              ],
              isVideo: false,
            ),
            GallerySection(
              title: "Prewedding Videos",
              mediaPaths: [
                'assets/images/preweddingGallery.png',
                'assets/images/preweddingGallery1.png',
                'assets/images/preweddingGallery2.png',
                'assets/images/preweddingGallery3.png',
              ],
              isVideo: true,
            ),
            GallerySection(
              title: "Photos & Videos",
              mediaPaths: [
                'assets/images/babyshootGallery.png',
                'assets/images/babyshootGallery3.png',
                'assets/images/babyshootGallery2.png',
                'assets/images/babyshootGallery3.png',
              ],
              isVideo: false,
              // useGrid: true,
            ),
          ],
          // Add actual GallerySection list here
          reviewPhotoUrls: [
            'assets/images/baby shoot main.png',
            'assets/images/baby shoot main.png',
            'assets/images/baby shoot main.png',
            'assets/images/baby shoot main.png',
            'assets/images/baby shoot main.png',
            'assets/images/baby shoot main.png',
          ],
          totalRatings: 120,
          totalReviews: 45,
          averageRating: 4.5,


        );

        emit(ValetParkingLoaded(packages,serviceDetails));

      } catch (_) {
        emit(ValetParkingError("Failed to load valet packages."));
      }
    });

    // Handle tab screen switching
    on<LoadValetParkingTabScreen>((event, emit) async {
      emit(ValetParkingLoading());

      await Future.delayed(const Duration(milliseconds: 300));

      switch (event.index) {
        case 0:
        // All Details tab
          final packages = [
            {
              "title": "Basic Service",
              "description": "When all you need is budget friendly valet associates for your event so you can just relax and enjoy.",
              "price": "₹2,000",
              "details": "We provide 1 valet per 50 guests.",
              "imagePath": "assets/images/Basic Service.png",
              "rating": 4.3,
            },
            {
              "title": "Royal Service",
              "description": "Experience the art of hospitality with our luxury valet associates for VIP entries.",
              "price": "₹3,000",
              "details": "We provide 1 valet per 40 guests.",
              "imagePath": "assets/images/Royal Service.png",
              "rating": 4.2,
            },
          ];
          final serviceDetails = ServiceDetails(
            name: "Valet Parking",
            imagePath: "assets/images/baby shoot main.png",
            price: 15000.0,
            rating: 4.7,
            heading: "Basic Package",
            packagePrice: "₹20,000",
            description: "Basic Package Bartending Service offers a fantastic choice for those who  need a budget friendly valet associates for your event. so that you just relax and enjoy the event. ",
            subHeading: "Included in this Package are:",
            subHeadingDetails:
            '''
Professional driver can handle any type of car whether automatic or manual. These drivers are trained, experienced and are considerably responsible staffs.
Maintaining a clean and order environment.
Answering questions about the parking.
''',


            eventTitle: "Get quotes for your event",
            address: "Financial District",
            addressDescription: "OLorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,",
            mediaSections: [
              GallerySection(
                title: "Birthday Photoshoot",
                mediaPaths: [
                  'assets/images/birthdayGallery.png',
                  'assets/images/birthdayGallery1.png',
                  'assets/images/birthdayGallery2.png',
                  'assets/images/birthdayGallery3.png',
                ],
                isVideo: false,
              ),
              GallerySection(
                title: "Prewedding Videos",
                mediaPaths: [
                  'assets/images/preweddingGallery.png',
                  'assets/images/preweddingGallery1.png',
                  'assets/images/preweddingGallery2.png',
                  'assets/images/preweddingGallery3.png',
                ],
                isVideo: true,
              ),
              GallerySection(
                title: "Photos & Videos",
                mediaPaths: [
                  'assets/images/babyshootGallery.png',
                  'assets/images/babyshootGallery3.png',
                  'assets/images/babyshootGallery2.png',
                  'assets/images/babyshootGallery3.png',
                ],
                isVideo: false,
                // useGrid: true,
              ),
            ],
            // Add actual GallerySection list here
            reviewPhotoUrls: [
              'assets/images/baby shoot main.png',
              'assets/images/baby shoot main.png',
              'assets/images/baby shoot main.png',
              'assets/images/baby shoot main.png',
              'assets/images/baby shoot main.png',
              'assets/images/baby shoot main.png',
            ],
            totalRatings: 120,
            totalReviews: 45,
            averageRating: 4.5,


          );
          emit(ValetParkingLoaded(packages,serviceDetails));
          break;

        case 1:
        // Gallery tab
          final galleryImages = [
            "assets/images/valet1.png",
            "assets/images/valet2.png",
            "assets/images/valet3.png",
            "assets/images/valet4.png",
            "assets/images/valet5.png",
          ];
          emit(ValetParkingGalleryLoaded(galleryImages));
          break;

        case 2:
        // Review tab
          final photos = [
            "assets/images/review1.png",
            "assets/images/review2.png",
            "assets/images/review3.png",
          ];
          final ratingData = {
            5: 50,
            4: 30,
            3: 15,
            2: 5,
            1: 2,
          };
          emit(ValetParkingReviewLoaded(photos: photos, ratingData: ratingData));
          break;

        default:
          emit(ValetParkingError("Invalid tab index"));
      }
    });

    on<SelectValetParking>((event, emit) {
      print("Valet selected: ${event.valetId}");
    });
  }
}
