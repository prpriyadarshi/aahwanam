// favorite_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<ToggleFavorite>((event, emit) {
      emit(FavoriteToggled(isFavorite: !state.isFavorite));
    });
  }
}
