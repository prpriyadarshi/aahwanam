import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/Event_model.dart';
import '../../models/subcategory_model.dart';
import 'events_event.dart';
import 'events_state.dart';

class EventBloc extends Bloc<EventsEvent, EventState> {
  EventBloc()
      : super(EventState(
    status: EventStatus.initial,
    events: [],
    addresses: [],
  )) {
    // Load Events
    on<LoadEvents>((event, emit) async {
      emit(state.copyWith(status: EventStatus.loading));
      try {
        final events = [
          {'name': "Baby Shower", 'image': "assets/images/Babyshower.png"},
          {'name': "Birthday", 'image': "assets/images/Birthday event.png"},
          {'name': "Anniversary", 'image': "assets/images/Anniversary event.png"},
          {'name': "Kids Party", 'image': "assets/images/Kids party.png"},
          {'name': "Prewedding", 'image': "assets/images/PreWedding event.png"},
          {'name': "Proposal", 'image': "assets/images/Proposal event.png"},
          {'name': "Marriage", 'image': "assets/images/Marriage event.png"},
          {'name': "Haldi", 'image': "assets/images/Haldi event.png"},
          {'name': "Kitty Party", 'image': "assets/images/Kitty party EE.png"},
          {'name': "Engagement", 'image': "assets/images/Engagement EE.png"},
          {'name': "Corporate Party", 'image': "assets/images/Corporate Party.png"},
          {'name': "Baby Shoot", 'image': "assets/images/Baby shoot EE.png"},
        ];
        emit(state.copyWith(events: events, status: EventStatus.success));
      } catch (e) {
        emit(state.copyWith(
            status: EventStatus.failure,
            errorMessage: 'Something went wrong'));
      }
    });

    // Load Addresses
    on<LoadAddressesEvent>((event, emit) {
      final dummy = [
        AddressModel(
          title: 'Financial District',
          subtitle:
          'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
        ),
        AddressModel(
          title: 'Madhapur',
          subtitle:
          'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
        ),
        AddressModel(
          title: 'Hitech City',
          subtitle:
          'Lorem ipsum dolor sit amet, dolor consectetur adipiscing elit,',
        ),
      ];
      emit(state.copyWith(addresses: dummy));
    });

    // Select Address
    on<SelectAddressEvent>((event, emit) {
      emit(state.copyWith(selectedAddress: event.address));
    });

    // Add New Address
    on<AddAddressEvent>((event, emit) {
      final updated = [...state.addresses, event.address];
      emit(state.copyWith(
          addresses: updated, selectedAddress: event.address));
    });
  }
}
