import '../../models/Event_model.dart';
import '../../models/subcategory_model.dart';

abstract class EventsEvent {}

class LoadEvents extends EventsEvent {}

class LoadAddressesEvent extends EventsEvent {}

class SelectAddressEvent extends EventsEvent {
  final AddressModel address;
  SelectAddressEvent(this.address);
}

class AddAddressEvent extends EventsEvent {
  final AddressModel address;
  AddAddressEvent(this.address);
}




