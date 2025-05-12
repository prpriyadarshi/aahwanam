import 'package:aahwanam/blocs/entertainment/entertainment_event.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_state.dart';
import 'package:aahwanam/models/book_service_details.dart';
import 'package:aahwanam/models/gallery_section.dart';
import 'package:aahwanam/models/service_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pandit/pandit_event.dart';

class EntertainmentBloc extends Bloc<EntertainmentEvent, EntertainmentState> {
  EntertainmentBloc(): super(EntertainmentInitial()){
    // Handle the FetchEntertainement event
    on<FetchEntertainment>((event ,emit ) async {
      emit(EntertainmentLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final Services = [
          {'image': 'assets/images/Band.png', 'name': 'Band', 'price': '₹5,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Drums.png', 'name': 'Drums', 'price': '₹3,000 Onwards', 'rating': '4.3',},
          {'image': 'assets/images/DJ.png', 'name': 'DJ', 'price': '₹4,000 Onwards', 'rating': '4.5',},
          {'image': 'assets/images/Choreographer.png', 'name': 'Choreographer', 'price': '₹15,000 Onwards', 'rating': '4.3',},
        ];

        final Choreographers = [

          {'image': 'assets/images/Choreographers.png', 'name': 'Dance Studio', 'price': '₹15,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Choreographers1.png', 'name': 'Dancing World', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Choreographers2.png', 'name': 'Iconic Studio', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Choreographers3.png', 'name': 'Dance Art', 'price': '₹5,000 Onwards', 'rating': '4.2',},
          {'image': 'assets/images/Choreographers4.png', 'name': 'Dancing & Art', 'price': '₹5,000 Onwards', 'rating': '4.73',},
          {'image': 'assets/images/Choreographers5.png', 'name': 'Dance World', 'price': '₹5,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Choreographers6.png', 'name': 'Dance Gallery', 'price': '₹15,000 Onwards', 'rating': '4.2',},
          {'image': 'assets/images/Choreographers7.png', 'name': 'Dance Studio', 'price': '₹4,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Choreographers8.png', 'name': 'Photo Gallery', 'price': '₹5,000 Onwards', 'rating': '4.4',},
          {'image': 'assets/images/Choreographers9.png', 'name': 'Iconic Studio', 'price': '₹15,000 Onwards', 'rating': '4.7',},
        ];


        final entertainmentDetails = ServiceDetails(
          name: "Photo Studio",
          imagePath: "assets/images/entertainmentDts.png",
          price: 8000.0,
          rating: 4.3,
          heading: "About Choreographer",
          packagePrice: "5 Yrs of Experience",
          description: "Lorem ipsum dolor sit amet, dolor consectetur dolor adipiscing elit, those who simply would like a trained bartender to pour beer and wine. ",
          subHeading: "Choreographer’s Speciality :",
          subHeadingDetails: "Bollywood Dance \n Tollywood Dance \n Classical Dance \n Salsa Dance \n Folk Dance ",
          eventTitle: "Details & Requirements",
          label1: "No. Of Performances*",
          label2: "No. Of Sessions",
          initialValue1: "4",
          initialValue2: "5 Hrs",
          address: "Financial District",
          addressDescription: "OLorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,",
          mediaSections: [
            GallerySection(
              title: "Classical Dance Video",
              mediaPaths: [
                'assets/images/birthdayGallery.png',
                'assets/images/birthdayGallery1.png',
                'assets/images/birthdayGallery2.png',
                'assets/images/birthdayGallery3.png',
              ],
              isVideo: true,
            ),
            GallerySection(
              title: "Bridal Entry Dance ",
              mediaPaths: [
                'assets/images/preweddingGallery.png',
                'assets/images/preweddingGallery2.png',
                'assets/images/preweddingGallery3.png',
                'assets/images/preweddingGallery1.png',
              ],
              isVideo: true,
            ),
            GallerySection(
              title: "Sangeet Dance",
              mediaPaths: [
                'assets/images/babyshootGallery2.png',
                'assets/images/babyshootGallery3.png',
                'assets/images/babyshootGallery.png',
                'assets/images/babyshootGallery3.png',

              ],
              isVideo: true,
              // useGrid: true,
            ),

            GallerySection(
              title: "Maternity Shoot",
              mediaPaths: [
                'assets/images/babyshootGallery.png',
                'assets/images/babyshootGallery3.png',
                'assets/images/babyshootGallery3.png',
                'assets/images/babyshootGallery2.png',
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

        final entertainmentServiceDetails = BookServiceDetails(
          title: 'Choreographer by Dance Studio',
          imagePath: 'assets/images/Choreographers.png',
          description: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
          price: '2,000',
          locationTitle: 'Financial District',
          locationDescription: 'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
          eventDate: '',
          eventTime: '',
          serviceCharge: '1,000',
          platformFee: '500',
          transportFee: '500',
          totalAmount: '2,000',
          label1: "No. Of Performances*",
          label2: "No. Of Sessions",
          initialValue1: "4",
          initialValue2: "5 Hrs",
          isPerSession: true,
        );

        emit(EntertainmentLoaded(Services,Choreographers, entertainmentDetails,entertainmentServiceDetails));
      }catch (e) {
        emit(EntertainmentError("Failed to load photographers"));
      }
    });

    // Handle the Entertainment event
    on<SelectEntertainment>((event, emit) {
      // Handle Entertainment selection logic
      print("Entertainment selected: ${event.entertainmentId}");
    });

    on<UpdateSelectedEntertainmentLanguage>((event, emit) {
      // Emit state with updated language if needed
      print("Selected Language: ${event.selectedLanguage}");
    });


  }

}