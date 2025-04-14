import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    // Handle LoadDashboardData event
    on<LoadDashboardData>(_onLoadDashboardData);
  }

  // Function to handle the LoadDashboardData event
  Future<void> _onLoadDashboardData(
      LoadDashboardData event,
      Emitter<DashboardState> emit,
      ) async {
    emit(DashboardLoading());

    try {
      // Simulate a network delay
      await Future.delayed(Duration(seconds: 2));

      // Mock data
      final sliderImages = [
        'assets/images/Frame 1.png',
        'assets/images/slider 2.png',
        'assets/images/slider 3.png',
      
      ];
      final categories = [
        {'name': 'Photographer', 'image': 'assets/images/photographer.png'},
        {'name': 'Chef', 'image': 'assets/images/chef.png'},
        {'name': 'Bartender', 'image': 'assets/images/Bartender.png'},
        {'name': 'Makeup', 'image': 'assets/images/Makeup.png'},
        {'name': 'Entertainment', 'image': 'assets/images/Entertainment.png'},
        {'name': 'Mehndi', 'image': 'assets/images/Mehndi.png'},
        {'name': 'Decor', 'image': 'assets/images/Decor.png'},
        {'name': 'Pandit', 'image': 'assets/images/Pandit.png'},
      ];


      final decorators = [
      {'image': 'assets/images/Party Blush.png', 'name': 'Party Blush', 'price': '₹15,000 Onwards', 'rating': '4.7',},
        {'image': 'assets/images/Dream Decor.png', 'name': 'Dream Decor', 'price': '₹5,000 Onwards', 'rating': '4.7',},

      ];

      final mehndiArtists = [
        {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi & Beauty', 'price': '₹5,000 Onwards', 'rating': '4.7',},
        {'image': 'assets/images/Mehndi & Beauty.png', 'name': 'Mehndi Stars', 'price': '₹3,000 Onwards', 'rating': '4.7',},
      ];

      final trendingItems = [
        {'image': 'assets/images/trending1.png', },
        {'image': 'assets/images/trending2.png', },
        {'image': 'assets/images/trending3.png', },
        {'image': 'assets/images/trending1.png',},
        {'image': 'assets/images/trending2.png', },
        {'image': 'assets/images/trending3.png', },
        {'image': 'assets/images/trending1.png', },
      ];

      final packagesForAllItems = [
        {
          'image': 'assets/images/Birthday.png',
          'name': 'Birthday',
          'price': '₹50,000 Onwards',
          'rating': '4.7',
        },
        {
          'image': 'assets/images/Anniversary.png',
          'name': 'Anniversary',
          'price': '₹80,000 Onwards',
          'rating': '4.7',
        },
      ];

      emit(DashboardLoaded(sliderImages, categories,decorators,mehndiArtists,trendingItems,packagesForAllItems));
    } catch (e) {
      emit(DashboardError('Failed to load dashboard data'));
    }
  }
}
