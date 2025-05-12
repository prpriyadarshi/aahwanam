import 'package:aahwanam/models/book_service_details.dart';
import 'package:aahwanam/models/service_details.dart';
import 'package:equatable/equatable.dart';

abstract class EntertainmentState extends Equatable {
  const EntertainmentState();

  @override
  List<Object?> get props => []; // Fixed to 'props'
}

// Initial state
class EntertainmentInitial extends EntertainmentState {}

// State when loading EntertainmentState data
class EntertainmentLoading extends EntertainmentState {}

// State when EntertainmentState data is loaded
class EntertainmentLoaded extends EntertainmentState {
  final List<Map<String, String>> Services;
  final List<Map<String, String>> Choreographers;
  final ServiceDetails entertainmentDetails;
  final BookServiceDetails entertainmentServiceDetails;

  const EntertainmentLoaded(this.Services ,this.Choreographers,this.entertainmentDetails,this.entertainmentServiceDetails);

  @override
  List<Object?> get props => [Services,Choreographers,entertainmentDetails,entertainmentServiceDetails];

}

// State for errors
class EntertainmentError extends EntertainmentState {
  final String message;

  const EntertainmentError(this.message);

  @override
  List<Object?> get props => [message];
}
