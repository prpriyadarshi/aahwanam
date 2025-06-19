import 'package:aahwanam/blocs/Packages/events_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<LoadEvents>((event, emit) async {
      emit(EventLoading());
      try {
        final events = [
          {'name': "Baby Shower", 'image': "assets/images/baby_shower.png"},
          {'name': "Birthday", 'image': "assets/images/birthday.png"},
          {'name': "Anniversary", 'image': "assets/images/anniversary.png"},
          {'name': "Kids Party", 'image': "assets/images/kids_party.png"},
          {'name': "Prewedding", 'image': "assets/images/prewedding.png"},
          {'name': "Proposal", 'image': "assets/images/proposal.png"},
          {'name': "Marriage", 'image': "assets/images/marriage.png"},
          {'name': "Haldi", 'image': "assets/images/haldi.png"},
          {'name': "Kitty Party", 'image': "assets/images/kitty_party.png"},
          {'name': "Engagement", 'image': "assets/images/engagement.png"},
          {'name': "Corporate Party", 'image': "assets/images/corporate.png"},
          {'name': "Baby Shoot", 'image': "assets/images/baby_shoot.png"},
        ];
        emit(EventLoaded(events));
      } catch (e) {
        emit(EventError("Something went wrong"));
      }
    });
  }
}
