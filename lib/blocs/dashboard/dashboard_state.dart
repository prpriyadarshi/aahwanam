import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<String> sliderImages;
  final List<Map<String ,String>> categories;
  final List<Map<String, String>> decorators;
  final List<Map<String, String>> mehndiArtists;
  final List<Map<String, String>> trendingItems;
  final List<Map<String ,String>> packagesForAllItems;

  DashboardLoaded(this.sliderImages ,this.categories ,this.decorators, this.mehndiArtists ,this.trendingItems ,this.packagesForAllItems);
  @override
  List<Object?> get props => [sliderImages,categories, decorators, mehndiArtists, trendingItems,packagesForAllItems];
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);

  @override
  List<Object?> get props => [message];

}
