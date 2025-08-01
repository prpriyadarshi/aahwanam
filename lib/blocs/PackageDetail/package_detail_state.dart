import 'package:equatable/equatable.dart';

class PackageDetailState extends Equatable {
  final bool loading;
  final Map<String, dynamic>? package;
  final List<Map<String, dynamic>> reviews;
  final List<String> gallery;

  const PackageDetailState({
    this.loading = true,
    this.package,
    this.reviews = const [],
    this.gallery = const [],
  });

  PackageDetailState copyWith({
    bool? loading,
    Map<String, dynamic>? package,
    List<Map<String, dynamic>>? reviews,
    List<String>? gallery,
  }) {
    return PackageDetailState(
      loading: loading ?? this.loading,
      package: package ?? this.package,
      reviews: reviews ?? this.reviews,
      gallery: gallery ?? this.gallery,
    );
  }

  @override
  List<Object?> get props => [loading, package, reviews, gallery];
}
