import 'package:aahwanam/blocs/PackageDetail/package_detail_event.dart';
import 'package:aahwanam/blocs/PackageDetail/package_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageDetailBloc extends Bloc<PackageDetailEvent, PackageDetailState> {
  PackageDetailBloc() : super(const PackageDetailState()) {
    on<LoadPackageDetail>(_onLoadPackageDetail);
  }

  void _onLoadPackageDetail(
      LoadPackageDetail event, Emitter<PackageDetailState> emit) {
    emit(state.copyWith(
      loading: false,
      package: event.package,
      reviews: [
        {
          'rating': 4.7,
          'comment': 'Very good service',
          'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          'image': 'assets/images/Bartender-review.png'
        },
        {
          'rating': 4.2,
          'comment': 'Very good service',
          'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          'image': 'assets/images/Bartender-review.png'
        },
      ],
      gallery: [
        'assets/images/gallery1.png',
        'assets/images/gallery2.png',
        'assets/images/gallery3.png',
        'assets/images/gallery4.png',
      ],
    ));
  }
}
