
import 'package:aahwanam/blocs/chef/chef_event.dart';
import 'package:aahwanam/blocs/chef/chef_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefBloc extends Bloc<ChefEvent, ChefState> {
  ChefBloc(): super(ChefInitial()){
    // Handle the FetchPhotographers event
    on<FetchChefs>((event ,emit ) async {
      emit(ChefLoading());

      try{
        // Simulating fetching data from a repository or API
        await Future.delayed(Duration(seconds: 2));
        final Categories = [
          {'name': 'Cuisines', 'image': 'assets/images/Cuisines.png'},
          {'name': 'Tiffins', 'image': 'assets/images/Tiffins.png'},
          {'name': 'Snacks', 'image': 'assets/images/Snacks.png'},
          {'name': 'Desserts', 'image': 'assets/images/Desserts.png'},
          {'name': 'Pizza', 'image': 'assets/images/Pizza.png'},
          {'name': 'Beverages', 'image': 'assets/images/Beverages.png'},
          {'name': ' Appetizers', 'image': 'assets/images/Appetizers.png'},
          {'name': 'Platters', 'image': 'assets/images/Platters.png'},
        ];

        final chefs = [
          {'image': 'assets/images/Ambika Caters.png', 'name': 'Ambika Cooking', 'price': '₹8,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Food Zone.png', 'name': 'Food Zone', 'price': '₹3,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Food Hut.png', 'name': 'Food Hut', 'price': '₹15,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Food Hut1.png', 'name': 'Food Hut', 'price': '₹15,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Taza Kitchen.png', 'name': 'Taza Kitchen', 'price': '₹4,000 Onwards', 'rating': '4.7',},
          {'image': 'assets/images/Taza Kitchen1.png', 'name': 'Taza Kitchen', 'price': '₹4,000 Onwards', 'rating': '4.7',},

        ];

        emit(ChefLoaded(Categories,chefs));
      }catch (e) {
        emit(ChefError("Failed to load photographers"));
      }
    });

    // Handle the SelectPhotographer event
    on<SelectChefs>((event, emit) {
      // Handle photographer selection logic
      print("Photographer selected: ${event.chefId}");
    });

  }

}