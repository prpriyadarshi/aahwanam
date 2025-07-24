import 'dart:developer';
import '../../models/Event_model.dart';
import '../../models/subcategory_model.dart';


enum EventStatus { initial, loading, success, failure }

class EventState {
  final EventStatus status;
  final List<Map<String, String>> events;
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;
  final String? errorMessage;
  final String selectedCategoryId;
  final List<Service> filteredServices;

  const EventState({
    this.status = EventStatus.initial,
    this.events = const [],
    this.addresses = const [],
    this.selectedAddress,
    this.errorMessage,
    this.selectedCategoryId = '',
    this.filteredServices = const [],
  });

  EventState copyWith({
    EventStatus? status,
    List<Map<String, String>>? events,
    List<AddressModel>? addresses,
    AddressModel? selectedAddress,
    String? errorMessage,
    String? selectedCategoryId,
    List<Service>? filteredServices,
  }) {
    return EventState(
      status: status ?? this.status,
      events: events ?? this.events,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      filteredServices: filteredServices ?? this.filteredServices,
    );
  }
}