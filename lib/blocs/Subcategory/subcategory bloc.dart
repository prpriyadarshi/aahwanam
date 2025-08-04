import 'package:aahwanam/blocs/Subcategory/subcategory%20event.dart';
import 'package:aahwanam/blocs/Subcategory/subcategory%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/subcategory_model.dart'; // Ensure this path is correct


class SubcategoryBloc extends Bloc<SubcategoryEvent, SubcategoryState> {
  SubcategoryBloc()
      : super(SubcategoryState(
      categories: [], selectedIndex: 0, eventDetails: [], serviceCounts: const {})) {
    on<LoadSubcategoryData>(_onLoadData);
    on<SelectCategory>(_onSelectCategory);
    on<LoadEventDetails>(_onLoadEventDetails);
    on<UpdateServiceCount>(_onUpdateServiceCount);
  }

  void _onLoadData(LoadSubcategoryData event, Emitter<SubcategoryState> emit) {
    final categories = [
      CategoryModel(
        name: 'Decoration',
        image: 'assets/images/Decoration event.png',
        services: [
          ServiceItem(
            id: 'decoration_floral_1',
            title: 'Floral Decoration',
            imageUrl: 'assets/images/Floral decoration event.png',
            price: '₹8,000',
            description: 'Beautiful floral arrangements for your special event.',
          ),
          ServiceItem(
            id: 'decoration_kids_1',
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special event.png',
            price: '₹6,000',
            description: 'Colorful and fun decorations perfect for children\'s parties.',
          ),
          ServiceItem(
            id: 'decoration_balloon_1',
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Ballon decoration event.png',
            price: '₹8,000',
            description: 'Elegant balloon arrangements in various themes and colors.',
          ),
          ServiceItem(
            id: 'decoration_kids_2',
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 2 event.png',
            price: '₹6,000',
            description: 'Another exciting kids theme decoration package.',
          ),
          ServiceItem(
            id: 'decoration_balloon_2',
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 2 event.png',
            price: '₹8,000',
            description: 'Premium balloon decoration with creative designs.',
          ),
          ServiceItem(
            id: 'decoration_love_1',
            title: 'Love Theme',
            imageUrl: 'assets/images/Love theme event.png',
            price: '₹6,000',
            description: 'Romantic decoration perfect for anniversaries and proposals.',
          ),
          ServiceItem(
            id: 'decoration_balloon_3',
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 3 event.png',
            price: '₹8,000',
            description: 'Custom balloon designs for any celebration.',
          ),
          ServiceItem(
            id: 'decoration_kids_3',
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 3 event.png',
            price: '₹6,000',
            description: 'More fun and unique kids party decorations.',
          ),
          ServiceItem(
            id: 'decoration_balloon_4',
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 4 event.png',
            price: '₹8,000',
            description: 'Large-scale balloon installations.',
          ),
          ServiceItem(
            id: 'decoration_kids_4',
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 4 event.png',
            price: '₹6,000',
            description: 'Themed kids decorations for memorable events.',
          ),
          ServiceItem(
            id: 'decoration_balloon_5',
            title: 'Balloon Decoration',
            imageUrl: 'assets/images/Balloons decoration 5 event.png',
            price: '₹8,000',
            description: 'Artistic balloon sculptures.',
          ),
          ServiceItem(
            id: 'decoration_kids_5',
            title: 'Kids Special',
            imageUrl: 'assets/images/Kids special 5 event.png',
            price: '₹6,000',
            description: 'Exciting and playful kids party solutions.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Makeup & Hair',
        image: 'assets/images/Makeup event.png',
        services: [
          ServiceItem(
            id: 'makeup_bridal_traditional_1',
            title: 'Bridal & Traditional',
            imageUrl: 'assets/images/Bridal makeup1.png',
            price: '₹10,000',
            description: 'Exquisite bridal makeup with a traditional touch.',
          ),
          ServiceItem(
            id: 'makeup_natural_braid_1',
            title: 'Natural & Braid',
            imageUrl: 'assets/images/Natural makeup event.png',
            price: '₹10,000',
            description: 'Subtle natural makeup with elegant braided hairstyles.',
          ),
          ServiceItem(
            id: 'makeup_bridal_straight_1',
            title: 'Bridal & Straight',
            imageUrl: 'assets/images/Bridal makeup 2 event.png',
            price: '₹10,000',
            description: 'Modern bridal makeup paired with sleek straight hair.',
          ),
          ServiceItem(
            id: 'makeup_glow_traditional_1',
            title: 'Glow & Traditional',
            imageUrl: 'assets/images/Glow makeup event.png',
            price: '₹10,000',
            description: 'Radiant glow makeup for a traditional look.',
          ),
          ServiceItem(
            id: 'makeup_blush_halfdown_1',
            title: 'Blush & Half Down',
            imageUrl: 'assets/images/Blush makeover event.png',
            price: '₹10,000',
            description: 'Fresh blush makeover with a charming half-up half-down hairstyle.',
          ),
          ServiceItem(
            id: 'makeup_iconic_floral_1',
            title: 'Iconic & Floral',
            imageUrl: 'assets/images/Iconic makeover event.png',
            price: '₹10,000',
            description: 'Bold iconic makeover complemented by floral hair accessories.',
          ),
          ServiceItem(
            id: 'makeup_beauty_wavy_1',
            title: 'Beauty & Wavy',
            imageUrl: 'assets/images/Beauty makeover event.png',
            price: '₹10,000',
            description: 'Enhance your natural beauty with a wavy hairstyle.',
          ),
          ServiceItem(
            id: 'makeup_beauty_hd_blush_1',
            title: 'Beauty HD & Blush',
            imageUrl: 'assets/images/Beauty HD event.png',
            price: '₹7,000',
            description: 'High-definition makeup with a soft blush finish.',
          ),
          ServiceItem(
            id: 'makeup_heaven_curls_1',
            title: 'Heaven & Curls',
            imageUrl: 'assets/images/Heavy makeover event.png',
            price: '₹7,000',
            description: 'Luxurious makeover with bouncy curls.',
          ),
          ServiceItem(
            id: 'makeup_dewy_blush_bun_1',
            title: 'Dewy Blush & Bun',
            imageUrl: 'assets/images/Dewy blush event.png',
            price: '₹7,000',
            description: 'Fresh dewy makeup with a chic bun hairstyle.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Mehndi',
        image: 'assets/images/Mehndi event.png',
        services: [
          ServiceItem(
            id: 'mehndi_beauty_1',
            title: 'Mehndi & Beauty',
            imageUrl: 'assets/images/The mehndi event.png',
            price: '₹2,500',
            description: 'Complete mehndi and beauty package.',
          ),
          ServiceItem(
            id: 'mehndi_the_mehndi_1',
            title: 'The Mehndi',
            imageUrl: 'assets/images/The mehndi event.png',
            price: '₹300 per hand',
            description: 'Simple and elegant mehndi designs.',
          ),
          ServiceItem(
            id: 'mehndi_art_1',
            title: 'Mehndi & Art',
            imageUrl: 'assets/images/Mehndi art event.png',
            price: '₹300 per hand',
            description: 'Artistic mehndi designs for various occasions.',
          ),
          ServiceItem(
            id: 'mehndi_stars_1',
            title: 'Mehndi Stars',
            imageUrl: 'assets/images/Mehndi stars event.png',
            price: '₹300 per hand',
            description: 'Star-themed mehndi patterns.',
          ),
          ServiceItem(
            id: 'mehndi_iconic_1',
            title: 'Iconic Mehndi',
            imageUrl: 'assets/images/Iconic mehndi event.png',
            price: '₹300 per hand',
            description: 'Unique and iconic mehndi designs.',
          ),
          ServiceItem(
            id: 'mehndi_story_1',
            title: 'Mehndi Story',
            imageUrl: 'assets/images/Mehndi story event.png',
            price: '₹300 per hand',
            description: 'Story-telling mehndi art.',
          ),
          ServiceItem(
            id: 'mehndi_bridal_1',
            title: 'Bridal Mehndi',
            imageUrl: 'assets/images/Bridal mehndi event.png',
            price: '₹300 per hand',
            description: 'Intricate bridal mehndi designs.',
          ),
          ServiceItem(
            id: 'mehndi_heena_1',
            title: 'Heena Mehndi',
            imageUrl: 'assets/images/Heena mehndi event.png',
            price: '₹300 per hand',
            description: 'Traditional heena mehndi applications.',
          ),
          ServiceItem(
            id: 'mehndi_groom_1',
            title: 'Groom Mehndi',
            imageUrl: 'assets/images/Groom mehndi event.png',
            price: '₹300 per hand',
            description: 'Special mehndi designs for grooms.',
          ),
          ServiceItem(
            id: 'mehndi_trendy_1',
            title: 'Trendy Mehndi',
            imageUrl: 'assets/images/Trendy mehndi event.png',
            price: '₹300 per hand',
            description: 'Modern and trendy mehndi patterns.',
          ),
          ServiceItem(
            id: 'mehndi_engagement_1',
            title: 'Engagement Mehndi',
            imageUrl: 'assets/images/Engagement mehndi event.png',
            price: '₹300 per hand',
            description: 'Elegant mehndi for engagement ceremonies.',
          ),
          ServiceItem(
            id: 'mehndi_backside_1',
            title: 'Backside Mehndi',
            imageUrl: 'assets/images/Backside mehndi event.png',
            price: '₹300 per hand',
            description: 'Beautiful mehndi designs for the back of the hand.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Entertainment',
        image: 'assets/images/Entertainment event.png',
        services: [
          ServiceItem(
            id: 'entertainment_band_1',
            title: 'Band',
            imageUrl: 'assets/images/Band event.png',
            price: '₹8,000',
            description: 'When all you need a budget friendly Band for your event.',
          ),
          ServiceItem(
            id: 'entertainment_drums_1',
            title: 'Drums',
            imageUrl: 'assets/images/Drums event.png',
            price: '₹12,000',
            description: 'When all you need a budget friendly Drum for your event.',
          ),
          ServiceItem(
            id: 'entertainment_dj_1',
            title: 'DJ',
            imageUrl: 'assets/images/DJ event.png',
            price: '₹12,000',
            description: 'When all you need a budget friendly DJ for your event.',
          ),
          ServiceItem(
            id: 'entertainment_choreographer_1',
            title: 'Choreographer',
            imageUrl: 'assets/images/Choreographer event.png',
            price: '₹12,000',
            description: 'When all you need a budget friendly choreographer for your event.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Bartender',
        image: 'assets/images/Bartender event.png',
        services: [
          ServiceItem(
            id: 'bartender_service_1',
            title: 'Bartender Service',
            imageUrl: 'assets/images/Bartender event.png',
            price: '₹5,000',
            description: 'When all you need a budget friendly Bartender.',
          ),
          ServiceItem(
            id: 'bartender_mixologist_1',
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
            id: 'valet_basic_1',
            title: 'Basic Service',
            imageUrl: 'assets/images/Basic parking event.png',
            price: '₹3,500',
            description: 'When all you need a budget friendly Vallet Associate.',
          ),
          ServiceItem(
            id: 'valet_royal_1',
            title: 'Royal Service',
            imageUrl: 'assets/images/Royal parking event.png',
            price: '₹7,500',
            description: 'When all you need a budget friendly Vallet Associate.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Pandit',
        image: 'assets/images/Pandit event.png',
        services: [
          ServiceItem(
            id: 'Indian pandit',
            title: 'Indian Pandit',
            imageUrl: 'assets/images/indian pandit event.png',
            price: '₹4,500',
            description: 'Experienced Indian Pandit for religious ceremonies.',
          ),
          ServiceItem(
            id: 'pandit_north_indian',
            title: 'North Indian Pandit',
            imageUrl: 'assets/images/north pandit event.png',
            price: '₹4,000',
            description: 'Experienced North Indian Pandit for religious ceremonies.',
          ),
          ServiceItem(
            id: 'pandit_south_indian',
            title: 'South Indian Pandit',
            imageUrl: 'assets/images/south pandit event.png',
            price: '₹4,500',
            description: 'Experienced South Indian Pandit for religious ceremonies.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Photography',
        image: 'assets/images/Photography event.png',
        services: [
          ServiceItem(
            id: 'photography_silver_1',
            title: 'Silver Package',
            imageUrl: 'assets/images/Silver package event photos.png',
            price: '₹25,000',
            description: 'When all you need a budget friendly photographer.',
          ),
          ServiceItem(
            id: 'photography_gold_1',
            title: 'Gold Package',
            imageUrl: 'assets/images/Gold event photos.png',
            price: '₹18,000',
            description: 'When all you need a budget friendly photographer.',
          ),
          ServiceItem(
            id: 'photography_diamond_1',
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
            id: 'invitation_digital_1',
            title: 'Digital Invitation',
            imageUrl: 'assets/images/invitation1 event.png',
            price: '₹1,500',
            description: 'Customizable digital invitations for all events.',
          ),
          ServiceItem(
            id: 'invitation_printed_1',
            title: 'Printed Invitation Cards',
            imageUrl: 'assets/images/printed_invite.png',
            price: '₹10 / card',
            description: 'High-quality printed invitation cards.',
          ),
        ],
      ),
      CategoryModel(
        name: 'Chef',
        image: 'assets/images/Chef event.png',
        services: [
          ServiceItem(
            id: 'chef buffet',
            title: 'Chef',
            imageUrl: 'assets/images/Chef1.png',
            price: '₹350 / plate',
            description: 'Delicious vegetarian buffet spread.',
          ),
          ServiceItem(
            id: 'chef_veg_buffet_1',
            title: 'Veg Buffet',
            imageUrl: 'assets/images/veg buffet event.png',
            price: '₹350 / plate',
            description: 'Delicious vegetarian buffet spread.',
          ),
          ServiceItem(
            id: 'chef_nonveg_buffet_1',
            title: 'Non-Veg Buffet',
            imageUrl: 'assets/images/non veg buffet event.png',
            price: '₹500 / plate',
            description: 'Sumptuous non-vegetarian buffet options.',
          ),
        ],
      ),
    ];

    emit(state.copyWith(categories: categories));
  }

  void _onSelectCategory(SelectCategory event, Emitter<SubcategoryState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  void _onLoadEventDetails(LoadEventDetails event, Emitter<SubcategoryState> emit) {
    // Create dynamic event details based on serviceId
    final eventDetails = _getEventDetailsForService(event.serviceId);
    emit(state.copyWith(eventDetails: [eventDetails]));
  }

  EventDetails _getEventDetailsForService(String serviceId) {
    // Return different event details based on service ID
    switch (serviceId) {
      case 'decoration_floral_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Floral Decoration',
          eventImage: 'assets/images/Floral decoration event.png',
          eventPrice: '₹8,000',
          description: 'Beautiful floral arrangements with fresh flowers. Perfect for weddings, birthdays, and special occasions. Our expert florists create stunning displays that will make your event memorable.',
          perviousWorkImages: [
            'assets/images/Floral decoration event.png',
            'assets/images/Floral decoration event.png',
            'assets/images/Floral decoration event.png',
            'assets/images/Floral decoration event.png',
          ],
          packagesIncluded: [
            "Fresh flower arrangements",
            "Professional setup and installation",
            "Variety of seasonal flowers",
            "Custom color themes available",
            "Post-event cleanup included"
          ],
        );

      case 'decoration_balloon_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Balloon Decoration',
          eventImage: 'assets/images/Ballon decoration event.png',
          eventPrice: '₹8,000',
          description: 'Creative balloon decorations with various themes and color combinations. Professional balloon artists create amazing arches, centerpieces, and themed displays.',
          perviousWorkImages: [
            'assets/images/Ballon decoration event.png',
            'assets/images/Balloons decoration 2 event.png',
            'assets/images/Balloons decoration 3 event.png',
            'assets/images/Balloons decoration 4 event.png',
          ],
          packagesIncluded: [
            "Balloon arches and columns",
            "Themed balloon arrangements",
            "Professional installation",
            "High-quality latex balloons",
            "Custom color matching"
          ],
        );

      case 'decoration_kids_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Kids Special Decoration',
          eventImage: 'assets/images/Kids special event.png',
          eventPrice: '₹6,000',
          description: 'Fun and colorful decorations specially designed for children\'s parties. Includes cartoon themes, bright colors, and child-friendly decorative elements.',
          perviousWorkImages: [
            'assets/images/Kids special event.png',
            'assets/images/Kids special 2 event.png',
            'assets/images/Kids special 3 event.png',
            'assets/images/Kids special 4 event.png',
          ],
          packagesIncluded: [
            "Cartoon character themes",
            "Colorful backdrop setup",
            "Child-safe decorative materials",
            "Fun props and accessories",
            "Age-appropriate designs"
          ],
        );

      case 'entertainment_band_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Live Band Performance',
          eventImage: 'assets/images/Band event.png',
          eventPrice: '₹8,000',
          description: 'Professional live band with experienced musicians. They perform various genres including Bollywood, classical, and contemporary music to entertain your guests.',
          perviousWorkImages: [
            'assets/images/Band event.png',
            'assets/images/Band event.png',
            'assets/images/Band event.png',
            'assets/images/Band event.png',
          ],
          packagesIncluded: [
            "4-piece professional band",
            "2-hour performance",
            "Sound system included",
            "Microphones and instruments",
            "Variety of music genres"
          ],
        );

      case 'entertainment_dj_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Professional DJ Service',
          eventImage: 'assets/images/DJ event.png',
          eventPrice: '₹12,000',
          description: 'Professional DJ service with state-of-the-art sound system and lighting. Our DJs play the latest hits and take requests to keep your party going all night.',
          perviousWorkImages: [
            'assets/images/DJ event.png',
            'assets/images/DJ event.png',
            'assets/images/DJ event.png',
            'assets/images/DJ event.png',
          ],
          packagesIncluded: [
            "Professional DJ with experience",
            "High-quality sound system",
            "LED lighting setup",
            "Wireless microphones",
            "Music library with latest hits",
            "4-hour service duration"
          ],
        );

    // Add cases for other specific service details as needed
    // For instance, you might want to add cases for:
      case 'makeup_bridal_traditional_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Bridal & Traditional Makeup',
          eventImage: 'assets/images/Bridal makeup1.png',
          eventPrice: '₹10,000',
          description: 'Get a stunning bridal look with traditional makeup techniques. Our artists ensure you look perfect on your special day.',
          perviousWorkImages: [
            'assets/images/Bridal makeup1.png',
            'assets/images/Bridal makeup1.png',
            'assets/images/Bridal makeup1.png',
            'assets/images/Bridal makeup1.png',
            'assets/images/Bridal makeup1.png'

          ],
          packagesIncluded: [
            "Bridal makeup application",
            "Hair styling (traditional updos)",
            "Draping (saree/lehenga)",
            "False lashes application",
            "Pre-bridal consultation"
          ],
        );

      case 'mehndi_bridal_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Bridal Mehndi',
          eventImage: 'assets/images/Bridal mehndi event.png',
          eventPrice: '₹300 per hand', // Assuming this is the price for a full bridal mehndi, or adjust as per your model
          description: 'Intricate and detailed bridal mehndi designs, covering full hands and feet with traditional and contemporary patterns.',
          perviousWorkImages: [
            'assets/images/Bridal mehndi event.png',
            'assets/images/The mehndi event.png',
            'assets/images/Mehndi art event.png',
            'assets/images/Iconic mehndi event.png',
          ],
          packagesIncluded: [
            "Full hand and foot bridal mehndi",
            "Customized designs",
            "High-quality natural henna paste",
            "Application at your chosen venue",
            "Aftercare instructions"
          ],
        );

      case 'bartender_service_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Basic Bartender Service',
          eventImage: 'assets/images/Bartender event.png',
          eventPrice: '₹5,000',
          description: 'Professional bartender service for your event, including basic cocktail mixing and beverage serving.',
          perviousWorkImages: [
            'assets/images/Bartender event.png',
            'assets/images/Mixologist event.png',
            'assets/images/Bartender event.png',
            'assets/images/Mixologist event.png',
          ],
          packagesIncluded: [
            "1 professional bartender",
            "Basic bar tools",
            "Beverage service (non-alcoholic & alcoholic)",
            "Setup and cleanup of bar area",
            "5-hour service duration"
          ],
        );
      case 'valet_basic_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Basic Valet Parking Service',
          eventImage: 'assets/images/Basic parking event.png',
          eventPrice: '₹3,500',
          description: 'Efficient and reliable basic valet parking service to manage guest parking at your event.',
          perviousWorkImages: [
            'assets/images/Basic parking event.png',
            'assets/images/Royal parking event.png',
            'assets/images/Basic parking event.png',
            'assets/images/Royal parking event.png',
          ],
          packagesIncluded: [
            "2-3 professional valet associates (depending on guest count)",
            "Parking management and coordination",
            "Guest vehicle handling and parking",
            "Event signage for parking area",
            "Up to 4 hours of service"
          ],
        );
      case 'pandit_north_indian_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'North Indian Pandit Service',
          eventImage: 'assets/images/pandit_north.png',
          eventPrice: '₹4,000',
          description: 'Experienced North Indian Pandit available for all types of pujas, ceremonies, and religious rituals.',
          perviousWorkImages: [
            'assets/images/pandit_north.png',
            'assets/images/pandit_south.png',
            'assets/images/pandit_north.png',
            'assets/images/pandit_south.png',
          ],
          packagesIncluded: [
            "Experienced Pandit for the ceremony",
            "Guidance on rituals and prayers",
            "Blessings and spiritual advice",
            "Travel to event location within city limits",
            "Duration based on ceremony type"
          ],
        );
      case 'photography_silver_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Silver Photography Package',
          eventImage: 'assets/images/Silver package event photos.png',
          eventPrice: '₹25,000',
          description: 'An affordable photography package perfect for capturing key moments of your event with high-quality images.',
          perviousWorkImages: [
            'assets/images/Silver package event photos.png',
            'assets/images/Gold event photos.png',
            'assets/images/Diamond event photos.png',
            'assets/images/Silver package event photos.png',
          ],
          packagesIncluded: [
            "1 professional photographer",
            "Up to 4 hours of coverage",
            "100-150 edited high-resolution images",
            "Online gallery for viewing and sharing",
            "Basic photo enhancements"
          ],
        );
      case 'invitation_digital_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Digital Invitation Design',
          eventImage: 'assets/images/invitation1 event.png',
          eventPrice: '₹1,500',
          description: 'Modern and eco-friendly digital invitation designs tailored to your event theme and style.',
          perviousWorkImages: [
            'assets/images/invitation1 event.png',
            'assets/images/printed_invite.png',
            'assets/images/invitation1 event.png',
            'assets/images/printed_invite.png',
          ],
          packagesIncluded: [
            "Custom digital invitation design",
            "High-resolution image or video format",
            "2 rounds of revisions",
            "Option to include RSVP link",
            "Delivery within 3-5 business days"
          ],
        );
      case 'chef_veg_buffet_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Vegetarian Buffet Service',
          eventImage: 'assets/images/veg_buffet.png',
          eventPrice: '₹350 / plate',
          description: 'A delicious and varied vegetarian buffet menu, perfect for any gathering, featuring fresh ingredients and diverse culinary options.',
          perviousWorkImages: [
            'assets/images/veg_buffet.png',
            'assets/images/nonveg_buffet.png',
            'assets/images/veg_buffet.png',
            'assets/images/nonveg_buffet.png',
          ],
          packagesIncluded: [
            "Choice of 2 appetizers",
            "Choice of 3 main courses (Indian/Continental)",
            "Assorted breads and rice options",
            "1 dessert option",
            "Full buffet setup with serving staff"
          ],
        );
      case 'decoration_kids_2':
        return EventDetails(
          serviceId: serviceId,
          title: 'Kids Special Decoration (Theme 2)',
          eventImage: 'assets/images/Kids special 2 event.png',
          eventPrice: '₹6,000',
          description: 'An alternate exciting kids theme decoration package with different character options and playful elements for a truly magical children\'s party.',
          perviousWorkImages: [
            'assets/images/Kids special event.png',
            'assets/images/Kids special 2 event.png',
            'assets/images/Kids special 3 event.png',
            'assets/images/Kids special 4 event.png',
          ],
          packagesIncluded: [
            "Themed backdrops (e.g., superhero, princess)",
            "Balloon decor matching the theme",
            "Table settings with themed accessories",
            "Photo booth props for kids",
            "Safe and vibrant decorations"
          ],
        );

      case 'decoration_balloon_2':
        return EventDetails(
          serviceId: serviceId,
          title: 'Premium Balloon Decoration',
          eventImage: 'assets/images/Balloons decoration 2 event.png',
          eventPrice: '₹8,000',
          description: 'Elevate your event with premium balloon decoration, featuring more intricate designs, larger installations, and custom color palettes.',
          perviousWorkImages: [
            'assets/images/Ballon decoration event.png',
            'assets/images/Balloons decoration 2 event.png',
            'assets/images/Balloons decoration 3 event.png',
            'assets/images/Balloons decoration 4 event.png',
          ],
          packagesIncluded: [
            "Custom balloon garlands and arches",
            "Balloon centerpieces and sculptures",
            "Delivery and professional setup",
            "High-grade, long-lasting balloons",
            "Takedown service available upon request"
          ],
        );

      case 'decoration_love_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Love Theme Decoration',
          eventImage: 'assets/images/Love theme event.png',
          eventPrice: '₹6,000',
          description: 'Create a romantic ambiance with our specially curated love theme decoration, perfect for anniversaries, proposals, and intimate gatherings.',
          perviousWorkImages: [
            'assets/images/Love theme event.png',
            'assets/images/Love theme event.png', // Add more relevant images here if available
            'assets/images/Floral decoration event.png',
            'assets/images/Ballon decoration event.png',
          ],
          packagesIncluded: [
            "Romantic lighting (fairy lights, candles)",
            "Floral accents (roses, lilies)",
            "Heart-shaped balloons/decorations",
            "Fabric drapes and elegant settings",
            "Personalized touches (e.g., photo display area)"
          ],
        );

      case 'decoration_balloon_3':
        return EventDetails(
          serviceId: serviceId,
          title: 'Balloon Decoration (Design 3)',
          eventImage: 'assets/images/Balloons decoration 3 event.png',
          eventPrice: '₹8,000',
          description: 'A unique and creative balloon decoration design for various events, ensuring a festive and visually appealing atmosphere.',
          perviousWorkImages: [
            'assets/images/Balloons decoration 3 event.png',
            'assets/images/Ballon decoration event.png',
            'assets/images/Balloons decoration 2 event.png',
            'assets/images/Balloons decoration 4 event.png',
          ],
          packagesIncluded: [
            "Spiral balloon columns",
            "Ceiling balloon drops",
            "Themed balloon bouquets",
            "Color coordination based on event palette",
            "Durable and vibrant balloons"
          ],
        );

      case 'decoration_kids_3':
        return EventDetails(
          serviceId: serviceId,
          title: 'Kids Special Decoration (Theme 3)',
          eventImage: 'assets/images/Kids special 3 event.png',
          eventPrice: '₹6,000',
          description: 'Another engaging kids special decoration package, offering a new array of themes and playful elements to make children\'s parties unforgettable.',
          perviousWorkImages: [
            'assets/images/Kids special 3 event.png',
            'assets/images/Kids special event.png',
            'assets/images/Kids special 2 event.png',
            'assets/images/Kids special 4 event.png',
          ],
          packagesIncluded: [
            "Custom character standees",
            "Interactive play areas (if space permits)",
            "Bright and vibrant color schemes",
            "Child-friendly props and seating",
            "Fun balloon sculptures for kids"
          ],
        );

      case 'decoration_balloon_4':
        return EventDetails(
          serviceId: serviceId,
          title: 'Balloon Decoration (Design 4)',
          eventImage: 'assets/images/Balloons decoration 4 event.png',
          eventPrice: '₹8,000',
          description: 'An advanced balloon decoration package with elaborate designs, perfect for grand celebrations and corporate events.',
          perviousWorkImages: [
            'assets/images/Balloons decoration 4 event.png',
            'assets/images/Ballon decoration event.png',
            'assets/images/Balloons decoration 2 event.png',
            'assets/images/Balloons decoration 3 event.png',
          ],
          packagesIncluded: [
            "Large-scale balloon walls",
            "Custom branded balloons (for corporate events)",
            "Balloon archways for entrances",
            "Illuminated balloon arrangements",
            "On-site design consultation"
          ],
        );

      case 'decoration_kids_4':
        return EventDetails(
          serviceId: serviceId,
          title: 'Kids Special Decoration (Theme 4)',
          eventImage: 'assets/images/Kids special 4 event.png',
          eventPrice: '₹6,000',
          description: 'A fourth unique kids special decoration offering, with fresh ideas and delightful elements to create a truly enchanting environment for young guests.',
          perviousWorkImages: [
            'assets/images/Kids special 4 event.png',
            'assets/images/Kids special event.png',
            'assets/images/Kids special 2 event.png',
            'assets/images/Kids special 3 event.png',
          ],
          packagesIncluded: [
            "Fairy tale or adventure themes",
            "Interactive games integration",
            "Soft play area setup (optional)",
            "Character cutouts and props",
            "Vibrant floor and wall decorations"
          ],
        );

      case 'decoration_balloon_5':
        return EventDetails(
          serviceId: serviceId,
          title: 'Balloon Decoration (Design 5)',
          eventImage: 'assets/images/Balloons decoration 5 event.png',
          eventPrice: '₹8,000',
          description: 'The ultimate balloon decoration experience, featuring bespoke designs, multi-dimensional structures, and artistic balloon arrangements.',
          perviousWorkImages: [
            'assets/images/Balloons decoration 5 event.png',
            'assets/images/Ballon decoration event.png',
            'assets/images/Balloons decoration 2 event.png',
            'assets/images/Balloons decoration 3 event.png',
          ],
          packagesIncluded: [
            "Sculptural balloon art",
            "Floating balloon displays",
            "Confetti balloons and balloon drops",
            "Full venue balloon transformation",
            "Expert design and execution"
          ],
        );

      case 'decoration_kids_5':
        return EventDetails(
          serviceId: serviceId,
          title: 'Kids Special Decoration (Theme 5)',
          eventImage: 'assets/images/Kids special 5 event.png',
          eventPrice: '₹6,000',
          description: 'Our most comprehensive kids special decoration package, ensuring a spectacular and immersive experience for children of all ages.',
          perviousWorkImages: [
            'assets/images/Kids special 5 event.png',
            'assets/images/Kids special event.png',
            'assets/images/Kids special 2 event.png',
            'assets/images/Kids special 3 event.png',
          ],
          packagesIncluded: [
            "Immersive themed environments (e.g., jungle, space)",
            "Dedicated activity stations",
            "Kid-friendly lighting and sound",
            "Custom backdrops with character appearances",
            "Safety-approved decorative elements"
          ],
        );

      case 'makeup_natural_braid_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Natural Makeup & Braid Hairdo',
          eventImage: 'assets/images/Natural makeup event.png',
          eventPrice: '₹10,000',
          description: 'Achieve a fresh and elegant look with natural makeup and a beautifully styled braid, perfect for a subtle yet sophisticated appearance.',
          perviousWorkImages: [
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Natural makeup event.png',
          ],
          packagesIncluded: [
            "Natural-look makeup application",
            "Choice of various braid styles (e.g., French, Dutch, fishtail)",
            "Light contouring and highlighting",
            "Subtle eye makeup",
            "Hair accessories (optional)"
          ],
        );

      case 'makeup_bridal_straight_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Bridal Makeup with Straight Hair',
          eventImage: 'assets/images/Bridal makeup 2 event.png',
          eventPrice: '₹10,000',
          description: 'A modern bridal makeup look complemented by sleek, straight hair, offering a sophisticated and contemporary aesthetic for your wedding day.',
          perviousWorkImages: [
            'assets/images/Bridal makeup 2 event.png',
            'assets/images/Bridal Makeup event.png',
            'assets/images/Iconic makeover event.png',
            'assets/images/Beauty HD event.png',
          ],
          packagesIncluded: [
            "Full bridal makeup application",
            "Professional hair straightening",
            "Long-lasting makeup products",
            "Touch-up kit provided",
            "Pre-event hair and makeup trial"
          ],
        );

      case 'makeup_glow_traditional_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Glow Makeover & Traditional Hairdo',
          eventImage: 'assets/images/Glow makeup event.png',
          eventPrice: '₹10,000',
          description: 'A glowing makeup look paired with a traditional hairstyle, perfect for festive occasions and cultural celebrations.',
          perviousWorkImages: [
            'assets/images/Glow makeup event.png',
            'assets/images/Beauty makeover event.png',
            'assets/images/Heavy makeover event.png',
            'assets/images/Dewy blush event.png',
          ],
          packagesIncluded: [
            "Radiant glow makeup application",
            "Traditional hair styling (e.g., elaborate buns, jadas)",
            "Skin prepping and priming",
            "Highlighter and shimmer application",
            "Floral or traditional hair accessories"
          ],
        );

      case 'makeup_blush_halfdown_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Blush Makeover & Half Down Hairstyle',
          eventImage: 'assets/images/Blush makeover event.png',
          eventPrice: '₹10,000',
          description: 'A soft and fresh blush-focused makeover with a beautiful half-up half-down hairstyle, ideal for engagements and casual parties.',
          perviousWorkImages: [
            'assets/images/Blush makeover event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Beauty makeover event.png',
            'assets/images/Heavy makeover event.png',
          ],
          packagesIncluded: [
            "Soft blush application for a natural flush",
            "Half-up half-down hair styling",
            "Minimal eye makeup and lip tint",
            "Face prepping and setting spray",
            "Hair pinning and securing for durability"
          ],
        );

      case 'makeup_iconic_floral_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Iconic Makeover & Floral Hair',
          eventImage: 'assets/images/Iconic makeover event.png',
          eventPrice: '₹10,000',
          description: 'An iconic, statement-making makeover combined with fresh floral arrangements for your hair, creating a truly memorable look.',
          perviousWorkImages: [
            'assets/images/Iconic makeover event.png',
            'assets/images/Bridal Makeup event.png',
            'assets/images/Beauty HD event.png',
            'assets/images/Heavy makeover event.png',
          ],
          packagesIncluded: [
            "Bold and iconic makeup artistry",
            "Fresh flower hair styling",
            "Advanced contouring and highlighting",
            "Dramatic eye makeup (optional)",
            "Customizable floral arrangements"
          ],
        );

      case 'makeup_beauty_wavy_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Beauty Makeover & Wavy Hair',
          eventImage: 'assets/images/Beauty makeover event.png',
          eventPrice: '₹10,000',
          description: 'Enhance your natural beauty with a captivating makeover and soft, elegant wavy hair, perfect for any special occasion.',
          perviousWorkImages: [
            'assets/images/Beauty makeover event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Glow makeup event.png',
            'assets/images/Dewy blush event.png',
          ],
          packagesIncluded: [
            "Complete beauty makeover",
            "Professional wavy hair styling",
            "Foundation, concealer, and powder application",
            "Blush and bronzer",
            "Lipstick and eye shadow application"
          ],
        );

      case 'makeup_beauty_hd_blush_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Beauty HD & Blush Look',
          eventImage: 'assets/images/Beauty HD event.png',
          eventPrice: '₹7,000',
          description: 'High-definition makeup for a flawless camera-ready look, with a focus on a healthy, natural blush to enhance your features.',
          perviousWorkImages: [
            'assets/images/Beauty HD event.png',
            'assets/images/Blush makeover event.png',
            'assets/images/Iconic makeover event.png',
            'assets/images/Heavy makeover event.png',
          ],
          packagesIncluded: [
            "HD foundation and concealer",
            "Contouring and highlighting for definition",
            "Natural blush application",
            "Subtle eye makeup and defined brows",
            "Long-lasting setting spray"
          ],
        );

      case 'makeup_heaven_curls_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Heavenly Makeover & Curls',
          eventImage: 'assets/images/Heavy makeover event.png',
          eventPrice: '₹7,000',
          description: 'A luxurious and glamorous makeover paired with beautiful, bouncy curls, designed to make you look and feel divine.',
          perviousWorkImages: [
            'assets/images/Heavy makeover event.png',
            'assets/images/Beauty makeover event.png',
            'assets/images/Glow makeup event.png',
            'assets/images/Dewy blush event.png',
          ],
          packagesIncluded: [
            "Full-face glamorous makeover",
            "Professional hair curling (various curl types)",
            "Eye makeup with dramatic effect (optional)",
            "Lip color and definition",
            "Hair spray for long-lasting hold"
          ],
        );

      case 'makeup_dewy_blush_bun_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Dewy Blush Makeover & Bun',
          eventImage: 'assets/images/Dewy blush event.png',
          eventPrice: '₹7,000',
          description: 'A fresh and youthful dewy makeup look with a touch of natural blush, perfectly complemented by a classic bun hairstyle.',
          perviousWorkImages: [
            'assets/images/Dewy blush event.png',
            'assets/images/Natural makeup event.png',
            'assets/images/Blush makeover event.png',
            'assets/images/Beauty HD event.png',
          ],
          packagesIncluded: [
            "Dewy finish foundation application",
            "Natural blush on cheeks",
            "Choice of bun styles (e.g., low bun, high bun, messy bun)",
            "Minimalist eye makeup",
            "Hydrating and illuminating primers"
          ],
        );

      case 'mehndi_beauty_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Mehndi & Beauty Services',
          eventImage: 'assets/images/Mehndi beauty event.png',
          eventPrice: '₹2,500',
          description: 'A combined package offering exquisite mehndi designs along with basic beauty services to complete your look.',
          perviousWorkImages: [
            'assets/images/Mehndi beauty event.png',
            'assets/images/The mehndi event.png',
            'assets/images/Mehndi art event.png',
            'assets/images/Mehndi stars event.png',
          ],
          packagesIncluded: [
            "Mehndi application (specific coverage as per price)",
            "Basic facial/clean-up",
            "Manicure/Pedicure (basic)",
            "Eyebrow threading/shaping",
            "High-quality henna paste"
          ],
        );

      case 'mehndi_the_mehndi_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'The Classic Mehndi Design',
          eventImage: 'assets/images/The mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Timeless and traditional mehndi designs, perfect for general occasions and family functions, applied with precision.',
          perviousWorkImages: [
            'assets/images/The mehndi event.png',
            'assets/images/Mehndi art event.png',
            'assets/images/Mehndi stars event.png',
            'assets/images/Iconic mehndi event.png',
          ],
          packagesIncluded: [
            "Classic mehndi patterns (front/back of hand)",
            "Natural henna cone",
            "Quick application time",
            "Consultation for design choice",
            "Aftercare tips for darker stain"
          ],
        );

      case 'mehndi_art_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Mehndi Artistry',
          eventImage: 'assets/images/Mehndi art event.png',
          eventPrice: '₹300 per hand',
          description: 'Creative and artistic mehndi designs, incorporating modern motifs and intricate detailing for a unique look.',
          perviousWorkImages: [
            'assets/images/Mehndi art event.png',
            'assets/images/Mehndi beauty event.png',
            'assets/images/The mehndi event.png',
            'assets/images/Iconic mehndi event.png',
          ],
          packagesIncluded: [
            "Custom artistic mehndi designs",
            "Detailed patterns and shading",
            "Choice of modern or fusion designs",
            "Professional henna artist",
            "Suitable for all occasions"
          ],
        );

      case 'mehndi_stars_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Mehndi with Star Motifs',
          eventImage: 'assets/images/Mehndi stars event.png',
          eventPrice: '₹300 per hand',
          description: 'Playful and charming mehndi designs featuring star patterns, ideal for younger individuals or fun events.',
          perviousWorkImages: [
            'assets/images/Mehndi stars event.png',
            'assets/images/Mehndi beauty event.png',
            'assets/images/The mehndi event.png',
            'assets/images/Mehndi art event.png',
          ],
          packagesIncluded: [
            "Star-themed mehndi patterns",
            "Simple yet attractive designs",
            "Child-friendly application (if applicable)",
            "Quick drying henna",
            "Suitable for casual events"
          ],
        );

      case 'mehndi_iconic_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Iconic Mehndi Designs',
          eventImage: 'assets/images/Iconic mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Signature mehndi designs that are unique and stand out, perfect for making a statement at any event.',
          perviousWorkImages: [
            'assets/images/Iconic mehndi event.png',
            'assets/images/The mehndi event.png',
            'assets/images/Mehndi story event.png',
            'assets/images/Bridal mehndi event.png',
          ],
          packagesIncluded: [
            "Exclusive iconic mehndi patterns",
            "Intricate detailing and fine lines",
            "Personalized elements if desired",
            "Experienced artist for precise application",
            "Suitable for high-profile events"
          ],
        );

      case 'mehndi_story_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Mehndi Storytelling',
          eventImage: 'assets/images/Mehndi story event.png',
          eventPrice: '₹300 per hand',
          description: 'Mehndi designs that tell a story or represent a significant theme, making your mehndi truly personal and meaningful.',
          perviousWorkImages: [
            'assets/images/Mehndi story event.png',
            'assets/images/Iconic mehndi event.png',
            'assets/images/Bridal mehndi event.png',
            'assets/images/Engagement mehndi event.png',
          ],
          packagesIncluded: [
            "Narrative-based mehndi designs",
            "Incorporation of personal symbols/elements",
            "Detailed and expressive artwork",
            "Consultation for story development",
            "A unique and memorable mehndi experience"
          ],
        );

      case 'mehndi_heena_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Traditional Heena Mehndi',
          eventImage: 'assets/images/Heena mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Authentic heena mehndi application, using traditional techniques and natural ingredients for a rich and long-lasting stain.',
          perviousWorkImages: [
            'assets/images/Heena mehndi event.png',
            'assets/images/Bridal mehndi event.png',
            'assets/images/Groom mehndi event.png',
            'assets/images/Trendy mehndi event.png',
          ],
          packagesIncluded: [
            "Pure natural henna application",
            "Traditional Indian/Arabic patterns",
            "Emphasis on fine lines and shading",
            "Guidance on aftercare for color development",
            "Suitable for all traditional ceremonies"
          ],
        );

      case 'mehndi_groom_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Groom Mehndi Designs',
          eventImage: 'assets/images/Groom mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Specialized mehndi designs for grooms, often simpler and more masculine, yet elegant and symbolic for their wedding day.',
          perviousWorkImages: [
            'assets/images/Groom mehndi event.png',
            'assets/images/Heena mehndi event.png',
            'assets/images/Trendy mehndi event.png',
            'assets/images/Engagement mehndi event.png',
          ],
          packagesIncluded: [
            "Groom-specific mehndi patterns",
            "Symbolic designs (e.g., kalash, baraat)",
            "Quick and efficient application",
            "Focus on arms and feet (optional)",
            "Matching designs with bride (optional)"
          ],
        );

      case 'mehndi_trendy_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Trendy Mehndi Art',
          eventImage: 'assets/images/Trendy mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Stay fashionable with the latest trendy mehndi designs, incorporating contemporary styles and popular motifs.',
          perviousWorkImages: [
            'assets/images/Trendy mehndi event.png',
            'assets/images/Heena mehndi event.png',
            'assets/images/Groom mehndi event.png',
            'assets/images/Engagement mehndi event.png',
          ],
          packagesIncluded: [
            "Latest trending mehndi designs",
            "Geometric patterns, minimalist designs, abstract art",
            "Use of glitter and stones (optional)",
            "Suitable for fashion-forward individuals",
            "Perfect for pre-wedding shoots and parties"
          ],
        );

      case 'mehndi_engagement_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Engagement Mehndi Designs',
          eventImage: 'assets/images/Engagement mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Elegant and graceful mehndi designs specifically for engagement ceremonies, focusing on delicate patterns and ring finger accents.',
          perviousWorkImages: [
            'assets/images/Engagement mehndi event.png',
            'assets/images/Trendy mehndi event.png',
            'assets/images/Groom mehndi event.png',
            'assets/images/Backside mehndi event.png',
          ],
          packagesIncluded: [
            "Engagement-specific mehndi patterns",
            "Focus on hands and wrists",
            "Delicate floral and vine motifs",
            "Symbolic engagement elements (e.g., rings)",
            "Applied with precision and care"
          ],
        );

      case 'mehndi_backside_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Backside Hand Mehndi',
          eventImage: 'assets/images/Backside mehndi event.png',
          eventPrice: '₹300 per hand',
          description: 'Beautiful mehndi designs specifically crafted for the back of the hands, enhancing their elegance and appeal.',
          perviousWorkImages: [
            'assets/images/Backside mehndi event.png',
            'assets/images/Engagement mehndi event.png',
            'assets/images/Trendy mehndi event.png',
            'assets/images/Groom mehndi event.png',
          ],
          packagesIncluded: [
            "Exclusive back-hand mehndi patterns",
            "Intricate wrist and finger designs",
            "Focus on visibility and elegance",
            "Suitable for all formal and informal events",
            "Applied with high-quality henna"
          ],
        );

      case 'entertainment_drums_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Professional Drummer Service',
          eventImage: 'assets/images/Drums event.png',
          eventPrice: '₹12,000',
          description: 'Add rhythm and energy to your event with a professional drummer, perfect for live music setups or solo performances.',
          perviousWorkImages: [
            'assets/images/Drums event.png',
            'assets/images/Band event.png',
            'assets/images/DJ event.png',
            'assets/images/Choreographer event.png',
          ],
          packagesIncluded: [
            "1 professional drummer",
            "Full drum kit and percussion instruments",
            "2-hour performance slot",
            "Sound system integration support",
            "Variety of rhythmic styles (Bollywood, Western, etc.)"
          ],
        );

      case 'entertainment_choreographer_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Event Choreographer',
          eventImage: 'assets/images/Choreographer event.png',
          eventPrice: '₹12,000',
          description: 'Hire a professional choreographer to train for sangeet, flash mobs, or special dance performances for your event.',
          perviousWorkImages: [
            'assets/images/Choreographer event.png',
            'assets/images/Band event.png',
            'assets/images/DJ event.png',
            'assets/images/Drums event.png',
          ],
          packagesIncluded: [
            "1 professional choreographer",
            "Custom dance routine creation",
            "Multiple practice sessions (as agreed)",
            "Music selection and editing support",
            "Performance coordination on event day"
          ],
        );

      case 'bartender_mixologist_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Expert Mixologist Service',
          eventImage: 'assets/images/Mixologist event.png',
          eventPrice: '₹12,000',
          description: 'Elevate your beverage experience with an expert mixologist who crafts bespoke cocktails and provides a premium bar service.',
          perviousWorkImages: [
            'assets/images/Mixologist event.png',
            'assets/images/Bartender event.png',
            'assets/images/Mixologist event.png',
            'assets/images/Bartender event.png',
          ],
          packagesIncluded: [
            "1 expert mixologist",
            "Premium bar setup and tools",
            "Custom cocktail menu development",
            "Garnish station with fresh ingredients",
            "5-hour service duration"
          ],
        );

      case 'valet_royal_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Royal Valet Parking Service',
          eventImage: 'assets/images/Royal parking event.png',
          eventPrice: '₹7,500',
          description: 'Provide your guests with a luxurious and seamless parking experience with our royal valet service, offering expedited service and premium care.',
          perviousWorkImages: [
            'assets/images/Royal parking event.png',
            'assets/images/Basic parking event.png',
            'assets/images/Royal parking event.png',
            'assets/images/Basic parking event.png',
          ],
          packagesIncluded: [
            "4-5 professional valet associates (depending on guest count)",
            "Red carpet service (optional)",
            "Dedicated pickup and drop-off points",
            "Umbrella service for guests (if raining)",
            "Up to 6 hours of service"
          ],
        );

      case 'pandit_south_indian_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'South Indian Pandit Service',
          eventImage: 'assets/images/pandit_south.png',
          eventPrice: '₹4,500',
          description: 'Experienced South Indian Pandit available for all types of pujas, ceremonies, and religious rituals following South Indian traditions.',
          perviousWorkImages: [
            'assets/images/pandit_south.png',
            'assets/images/pandit_north.png',
            'assets/images/pandit_south.png',
            'assets/images/pandit_north.png',
          ],
          packagesIncluded: [
            "Experienced Pandit for the ceremony",
            "Guidance on South Indian rituals",
            "Blessings and spiritual advice",
            "Travel to event location within city limits",
            "Duration based on ceremony type"
          ],
        );

      case 'photography_gold_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Gold Photography Package',
          eventImage: 'assets/images/Gold event photos.png',
          eventPrice: '₹18,000',
          description: 'Our popular gold photography package offers comprehensive coverage and a blend of candid and posed shots to cherish your event memories.',
          perviousWorkImages: [
            'assets/images/Gold event photos.png',
            'assets/images/Silver package event photos.png',
            'assets/images/Diamond event photos.png',
            'assets/images/Gold event photos.png',
          ],
          packagesIncluded: [
            "1 lead photographer + 1 assistant",
            "Up to 6 hours of coverage",
            "200-250 edited high-resolution images",
            "USB drive with all images",
            "Basic photo album (e.g., 20 pages)"
          ],
        );

      case 'photography_diamond_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Diamond Photography Package',
          eventImage: 'assets/images/Diamond event photos.png',
          eventPrice: '₹18,000',
          description: 'The premium diamond photography package offers extensive coverage, multiple photographers, and luxurious deliverables for a truly grand memory.',
          perviousWorkImages: [
            'assets/images/Diamond event photos.png',
            'assets/images/Gold event photos.png',
            'assets/images/Silver package event photos.png',
            'assets/images/Diamond event photos.png',
          ],
          packagesIncluded: [
            "2 lead photographers + 1 videographer (optional)",
            "Full event day coverage (up to 8 hours)",
            "300+ edited high-resolution images",
            "Premium photo album (e.g., 40 pages)",
            "Short highlight video (3-5 minutes)"
          ],
        );

      case 'invitation_printed_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Printed Invitation Cards',
          eventImage: 'assets/images/printed_invite.png',
          eventPrice: '₹10 / card',
          description: 'High-quality printed invitation cards with various design options and finishes, delivered to your doorstep.',
          perviousWorkImages: [
            'assets/images/printed_invite.png',
            'assets/images/invitation1 event.png',
            'assets/images/printed_invite.png',
            'assets/images/invitation1 event.png',
          ],
          packagesIncluded: [
            "Customizable card designs",
            "Choice of paper quality and finish",
            "Printing with high-quality ink",
            "Envelopes included",
            "Minimum order quantity applies"
          ],
        );

      case 'chef_nonveg_buffet_1':
        return EventDetails(
          serviceId: serviceId,
          title: 'Non-Vegetarian Buffet Service',
          eventImage: 'assets/images/nonveg_buffet.png',
          eventPrice: '₹500 / plate',
          description: 'A delectable non-vegetarian buffet menu featuring a variety of meat and poultry dishes, prepared with fresh ingredients and rich flavors.',
          perviousWorkImages: [
            'assets/images/nonveg_buffet.png',
            'assets/images/veg_buffet.png',
            'assets/images/nonveg_buffet.png',
            'assets/images/veg_buffet.png',
          ],
          packagesIncluded: [
            "Choice of 2 non-veg appetizers",
            "Choice of 3 non-veg main courses",
            "Assorted breads and rice options",
            "1 dessert option",
            "Full buffet setup with serving staff"
          ],
        );

      default:
      // Default event details for any unmatched service
        return EventDetails(
          serviceId: serviceId,
          title: 'Event Service',
          eventImage: 'assets/images/Chef event.png',
          eventPrice: '₹5,000',
          description: 'Professional event service tailored to your needs. Our experienced team ensures high-quality service delivery for your special occasion.',
          perviousWorkImages: [
            'assets/images/Chef event.png',
            'assets/images/Chef event.png',
            'assets/images/Chef event.png',
            'assets/images/Chef event.png',
          ],
          packagesIncluded: [
            "Professional service team",
            "Quality equipment and materials",
            "Setup and installation",
            "Customer support",
            "Satisfaction guarantee"
          ],
        );
    }
  }

  void _onUpdateServiceCount(UpdateServiceCount event, Emitter<SubcategoryState> emit) {
    final newCounts = Map<String, int>.from(state.serviceCounts);
    newCounts[event.serviceId] = event.newCount; // Changed from serviceTitle to serviceId for consistency
    emit(state.copyWith(serviceCounts: newCounts));
  }
}