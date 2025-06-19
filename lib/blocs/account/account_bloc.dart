import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<LoadAccountInfo>((event, emit) async {
      emit(AccountLoading());
      try {
        await Future.delayed(Duration(seconds: 1));

        final bookings = [
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/hair_style.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Minimal Mehndi by Mehndi & Beauty',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Delivered',
            'imagePath': 'assets/images/minimal_mehandi.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Floral Decor by Dream Decor',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Delivered',
            'imagePath': 'assets/images/floral_decor.png',
            // 'status': 'Delivered',
          },
        ];
        final addToCart = [
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            // 'status': 'Delivered',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/hair_style.png',
            // 'status': 'Delivered',
          },
        ];
        final inProgressBookings = [
          {
            'title': 'Birthday Decor by Dream decor',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Waiting for Artist..',
            'imagePath': 'assets/images/birthday_decor.png',

          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '2,000',
            'details': 'Waiting for Artist..',
            'imagePath': 'assets/images/hair_style_booking.png',

          },
        ];
        final wishlist = [ // <-- ✅ Add this list
          {
            'title': 'Bridal Makeup by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
            'price': '8,000',
            'details': 'Booked On - 22, Feb 2025',
            'imagePath': 'assets/images/bridal_makeup.png',
            'showLikeIcon': 'true',
          },
          {
            'title': 'Hair Style by Blush Makeover',
            'description': 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
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
          {'title': "Birthday Party Package", 'servicesIncluded': 4, 'price': "28,000", 'status': "Delivered"},
          {'title': "Kids Party Package", 'servicesIncluded': 3, 'price': "28,000", 'status': "Delivered"},
          {'title': "Anniversary Package", 'servicesIncluded': 3, 'price': "28,000", 'status': "Deliver Soon"},
        ];


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

        ));
      }
      catch (e) {
        emit(AccountError("Failed to load data"));
      }
    });
  }
}