import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_event.dart';
import 'account_state.dart';
import 'package:aahwanam/models/gallery_section.dart';
import 'package:aahwanam/models/service_details.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoadAccountInfo>((event, emit) async {
      emit(AccountLoading());
      try {
        await Future.delayed(Duration(seconds: 1));

        final bookings = [
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/hair_style.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Minimal Mehndi by Mehndi & Beauty',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Delivered',
            'imagePath': 'assets/images/minimal_mehandi.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Floral Decor by Dream Decor',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Delivered',
            'imagePath': 'assets/images/floral_decor.png',
            // 'status': 'Delivered',
          },
        ];
        final addToCart = [
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/hair_style.png',
            // 'status': 'Delivered',
          },
        ];
        final inProgressBookings = [
          {
            'title': 'Birthday Decor by Dream decor',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Waiting for Artist..',
            'imagePath': 'assets/images/birthday_decor.png',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Waiting for Artist..',
            'imagePath': 'assets/images/hair_style_booking.png',
          },
        ];
        final wishlist = [
          // <-- ✅ Add this list
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            'showLikeIcon': 'true',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/hair_style.png',
            'showLikeIcon': 'true',
          },
        ];

        final conceptsTabImages = [
          {
            'imagePath': 'assets/images/concepts1.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts2.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts3.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts4.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts5.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts6.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/babyshootGallery3.png',
            'width': 100.0,
            'height': 100.0,
          },
          {
            'imagePath': 'assets/images/concepts7.png',
            'width': 100.0,
            'height': 100.0,
          },
        ];

        final packages = [
          {
            'title': "Birthday Party Package",
            'servicesIncluded': 4,
            'price': "28,000",
            'status': "Delivered"
          },
          {
            'title': "Kids Party Package",
            'servicesIncluded': 3,
            'price': "28,000",
            'status': "Delivered"
          },
          {
            'title': "Anniversary Package",
            'servicesIncluded': 3,
            'price': "28,000",
            'status': "Deliver Soon"
          },
        ];

        final cartdata = [
          {
            'title': 'Decoration',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000 ',
            'imageUrl': 'assets/images/cartdecoration.png',
          },
          {
            'title': 'Decoration',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000 ',
            'imageUrl': 'assets/images/cartdecoration2.png',
          },
          {
            'title': 'Bartender',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000 ',
            'imageUrl': 'assets/images/cartbortender.png',
          },
          {
            'title': 'Royal valet Service',
            'description':
                'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000 ',
            'imageUrl': 'assets/images/RoyalvaletService.png',
          },
        ];
        final serviceDetails = ServiceDetails(
          name: "Dream Decor",
          imagePath: "assets/images/dream decor 1.png",
          price: 1500.0,
          rating: 4.3,
          heading: "Silver Package",
          packagePrice: "₹20,000",
          description:
              "Silver Package Photography Service offers a fantastic choice When all you need a budget friendly photography and personal photoshoot for your event. ",
          subHeading: "Included in this Package are:",
          subHeadingDetails:
              "1 Professional Photographer + Videographe Candid Photos and Hd quality. Premium quality soft copies of your event. .",
          eventTitle: "Get quotes for your event",
          address: "Financial District",
          addressDescription:
              "OLorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,",
          mediaSections: [
            GallerySection(
              title: "Birthday Decor",
              mediaPaths: [
                'assets/images/birthdayDecor.png',
                'assets/images/birthdayDecor1.png',
                'assets/images/birthdayDecor2.png',
                // 'assets/images/birthdayGallery3.png',
              ],
              isVideo: false,
            ),
            GallerySection(
              title: "Anniversary Decor",
              mediaPaths: [
                'assets/images/preweddingGallery.png',
                'assets/images/preweddingGallery1.png',
                'assets/images/preweddingGallery2.png',
                'assets/images/preweddingGallery3.png',
              ],
              isVideo: false,
            ),
            GallerySection(
              title: "Pooja Decor",
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

        emit(AccountLoaded(
          firstName: 'Chanchal',
          lastName: 'Soni',
          phone: '9876543210',
          email: 'Chanchal.soni@payg.in',
          profileUrl: 'assets/images/profile.png',
          bookings: bookings,
          inProgressBookings: inProgressBookings,
          conceptsTabImages: conceptsTabImages,
          addToCart: addToCart,
          wishlist: wishlist,
          packages: packages,
          cartdata: cartdata,
          serviceDetails: serviceDetails,
        ));
      } catch (e) {
        emit(AccountError("Failed to load data"));
      }
    });
  }
}
