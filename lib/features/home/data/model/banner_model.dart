import 'package:equatable/equatable.dart';

class BannerModel extends Equatable{
  final String image;

  BannerModel({required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [image];
}