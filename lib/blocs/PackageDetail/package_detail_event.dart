import 'package:equatable/equatable.dart';

abstract class PackageDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPackageDetail extends PackageDetailEvent {
  final Map<String, dynamic> package;
  LoadPackageDetail(this.package);

  @override
  List<Object?> get props => [package];
}
