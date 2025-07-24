import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/subcategory_model.dart';
import 'subcategory event.dart';
import 'subcategory state.dart';

class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  SubcategoryBloc()
      : super(SubcategoryState(categories: [], selectedIndex: 0, eventDetails: [], serviceCounts: const {}, )) {
    on<LoadSubcategoryData>(_onLoadData);
    on<SelectCategory>(_onSelectCategory);
    on<LoadEventDetails>(_onLoadEventDetails);
    on<UpdateServiceCount>(_onUpdateServiceCount); // ADD HANDLER

  }

  void _onLoadData(
      LoadSubcategoryData event, Emitter<SubcategoryState> emit) {
    final categories = [
      CategoryModel(
        name: 'Decoration',
        image: 'assets/images/Decoration event.png',
        services: [
          ServiceItem(
            title: 'Floral Decoration',
            imageUrl: 'assets/images/Floral decoration event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special event.png',
            price: '₹6,000',
          ),
          ServiceItem(
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Ballon decoration event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 2 event.png',
            price: '₹6,000',
          ),
          ServiceItem(
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 2 event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Love Theme',
            imageUrl: 'assets/images/Love theme event.png',
            price: '₹6,000',
          ),
          ServiceItem(
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 3 event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 3 event.png',
            price: '₹6,000',
          ),
          ServiceItem(
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 4 event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 4 event.png',
            price: '₹6,000',
          ),
          ServiceItem(
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 5 event.png',
            price: '₹8,000',
          ),
          ServiceItem(
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 5 event.png',
            price: '₹6,000',
          ),

        ],
      ),
      CategoryModel(
        name: 'Makeup & Hair',
        image: 'assets/images/Makeup event.png',
        services: [
          ServiceItem(
            title: 'Bridal & Traditional',
            imageUrl: 'assets/images/Bridal Makeup  event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Natural & Braid',
            imageUrl: 'assets/images/Natural makeup event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Bridal & Straight',
            imageUrl: 'assets/images/Bridal makeup 2 event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Glow & Traditional',
            imageUrl: 'assets/images/Glow makeup event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Blush Makeover & Half Down',
            imageUrl: 'assets/images/Blush makeover event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Iconic Makeover & Floral',
            imageUrl: 'assets/images/Iconic makeover event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Beauty & Wavy',
            imageUrl: 'assets/images/Beauty makeover event.png',
            price: '₹10,000',
          ),
          ServiceItem(
            title: 'Beauty HD & Blush',
            imageUrl: 'assets/images/Beauty HD event.png',
            price: '₹7,000',
          ),
          ServiceItem(
            title: 'Heaven & Curls',
            imageUrl: 'assets/images/Heavy makeover event.png',
            price: '₹7,000',
          ),
          ServiceItem(
            title: 'Dewy Blush & Bun',
            imageUrl: 'assets/images/Dewy blush event.png',
            price: '₹7,000',
          ),
        ],
      ),
      CategoryModel(
        name: 'Mehndi',
        image: 'assets/images/Mehndi event.png',
        services: [
          ServiceItem(
            title: 'Mehndi & Beauty',
            imageUrl: 'assets/images/Mehndi beauty  event.png',
            price: '₹2,500',
          ),
          ServiceItem(
            title: 'The Mehndi',
            imageUrl: 'assets/images/The mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Mehndi & Art',
            imageUrl: 'assets/images/Mehndi art event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Mehndi Stars',
            imageUrl: 'assets/images/Mehndi stars event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Iconic Mehndi',
            imageUrl: 'assets/images/Iconic mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Mehndi Story',
            imageUrl: 'assets/images/Mehndi story event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Bridal Mehndi',
            imageUrl: 'assets/images/Bridal mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Heena Mehndi',
            imageUrl: 'assets/images/Heena mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Groom Mehndi',
            imageUrl: 'assets/images/Groom mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Trendy Mehndi',
            imageUrl: 'assets/images/Trendy mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Engagement Mehndi',
            imageUrl: 'assets/images/Engagement mehndi event.png',
            price: '₹300 per hand',
          ),
          ServiceItem(
            title: 'Backside Mehndi',
            imageUrl: 'assets/images/Backside mehndi event.png',
            price: '₹300 per hand',
          ),
        ],
      ),
      CategoryModel(
        name: 'Entertainment',
        image: 'assets/images/Entertainment event.png',
        services: [
          ServiceItem(
            title: 'Band',
            imageUrl: 'assets/images/Band event.png', // Placeholder, ensure you have this image
            price: '₹8,000',
            description: 'When all you need a budget friendly Band for your event.' ,
          ),
          ServiceItem(
              title: 'Drums',
              imageUrl: 'assets/images/Drums event.png', // Placeholder, ensure you have this image
              price: '₹12,000',
              description: 'When all you need a budget friendly Drum for your event.'
          ),
          ServiceItem(
            title: 'DJ',
            imageUrl: 'assets/images/DJ event.png', // Placeholder, ensure you have this image
            price: '₹12,000',
            description: 'When all you need a budget friendly DJ for your event. ',
          ),
          ServiceItem(
            title: 'Choreographer',
            imageUrl: 'assets/images/Choreographer event.png', // Placeholder, ensure you have this image
            price: '₹12,000',
            description: 'When all you need a budget friendly choreographer for your event. ',
          ),
        ],
      ),
      CategoryModel(
        name: 'Bartender',
        image: 'assets/images/Bartender event.png',
        services: [
          ServiceItem(
            title: 'Bartender Service',
            imageUrl: 'assets/images/Bartender event.png',
            price: '₹5,000',
            description: 'When all you need a budget friendly Bartender.',
          ),
          ServiceItem(
            title: 'Mixologist',
            imageUrl: 'assets/images/Mixologist event.png',
            price: '₹12,000',
            description: 'When all you need a budget friendly Mixologist.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Valet Parking',
        image: 'assets/images/Valetparking event.png',
        services: [
          ServiceItem(
            title: 'Basic Service',
            imageUrl: 'assets/images/Basic parking event.png',
            price: '₹3,500',
            description: 'When all you need a budget friendly Vallet Associate. ',
          ),
          ServiceItem(
            title: 'Royal Service',
            imageUrl: 'assets/images/Royal parking event.png',
            price: '₹7,500',
            description: 'When all you need a budget friendly Vallet Associate. ',
          ),
        ],
      ),
      CategoryModel(
        name: 'Pandit',
        image: 'assets/images/Pandit event.png',
        services: [
          ServiceItem(
            title: 'North Indian Pandit',
            imageUrl: 'assets/images/pandit_north.png',
            price: '₹4,000',
            description: 'dejvyhjebcvyejnvchjevcxhyejncvjevcgmcvegjc',
          ),
          ServiceItem(
            title: 'South Indian Pandit',
            imageUrl: 'assets/images/pandit_south.png',
            price: '₹4,500',
            description: 'dejvyhjebcvyejnvchjevcxhyejncvjevcgmcvegjc',
          ),
        ],
      ),
      CategoryModel(
        name: 'Photography',
        image: 'assets/images/Photography event.png',
        services: [
          ServiceItem(
            title: 'Silver Package',
            imageUrl: 'assets/images/Silver package event photos.png',
            price: '₹25,000',
            description: 'When all you need a budget friendly photographer.',
          ),
          ServiceItem(
            title: 'Gold Package',
            imageUrl: 'assets/images/Gold event photos.png',
            price: '₹18,000',
            description: 'When all you need a budget friendly photographer.',
          ),
          ServiceItem(
            title: 'Diamond Package',
            imageUrl: 'assets/images/Diamond event photos.png',
            price: '₹18,000',
            description: 'When all you need a budget friendly photographer.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Invitation',
        image: 'assets/images/Invitation event.png',
        services: [
          ServiceItem(
            title: 'Digital Invitation',
            imageUrl: 'assets/images/digital_invite.png',
            price: '₹1,500',
          ),
          ServiceItem(
            title: 'Printed Invitation Cards',
            imageUrl: 'assets/images/printed_invite.png',
            price: '₹10 / card',
          ),
        ],
      ),
      CategoryModel(
        name: 'Chef',
        image: 'assets/images/Chef event.png',
        services: [
          ServiceItem(
            title: 'Veg Buffet',
            imageUrl: 'assets/images/veg_buffet.png',
            price: '₹350 / plate',
          ),
          ServiceItem(
            title: 'Non-Veg Buffet',
            imageUrl: 'assets/images/nonveg_buffet.png',
            price: '₹500 / plate',
          ),
        ],
      ),
    ];

    emit(state.copyWith(categories: categories));
  }

  void _onSelectCategory(
      SelectCategory event, Emitter<SubcategoryState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  void _onLoadEventDetails(
      LoadEventDetails event,Emitter<SubcategoryState> emit){ // Corrected Emitter type
    final eventDetails = [
      EventDetails(
        eventImage: 'assets/images/Chef event.png',
        eventPrice: '3000',
        Description: 'Hi ehllo cuejbcudb ddhehb ehv hhfut rgrueyvhe ehbcveucheucgehc ehhev ',
        perviousWorkImages: [
          'assets/images/Chef event.png',
          'assets/images/Chef event.png',
          'assets/images/Chef event.png',
          'assets/images/Chef event.png',
          'assets/images/Chef event.png',
        ],
      ),
    ];
    // Don't forget to emit the new state!
    emit(state.copyWith(eventDetails: eventDetails));
  }

  void _onUpdateServiceCount(
      UpdateServiceCount event, Emitter<SubcategoryState> emit) {
    final newCounts = Map<String, int>.from(state.serviceCounts);
    newCounts[event.serviceTitle] = event.newCount;
    emit(state.copyWith(serviceCounts: newCounts));
  }
}
