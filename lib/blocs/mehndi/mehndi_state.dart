import 'package:equatable/equatable.dart';

abstract class MehndiState extends Equatable {
  const MehndiState();

  @override
  List<Object?> get props => []; // Fixed to 'props'

}

// Initial state
class MehndiInitial extends MehndiState {}

// State when loading MehndiState data
class MehndiLoading extends MehndiState {}

// State when MehndiState data is loaded
class MehndiLoaded extends MehndiState {
  final List<Map<String, String>> mehndiTheme;
  final List<Map<String, String>> mehndiArtists;
  final List<Map<String, String>> trendingMehndiDesigns;

  const MehndiLoaded(this.mehndiTheme,this.mehndiArtists,this.trendingMehndiDesigns);

  @override
  List<Object?> get props => [mehndiTheme,mehndiArtists,trendingMehndiDesigns];

}

// State for errors
class MehndiLoadedError extends MehndiState {
  final String message;

  const MehndiLoadedError(this.message);

  @override
  List<Object?> get props => [message];
}
