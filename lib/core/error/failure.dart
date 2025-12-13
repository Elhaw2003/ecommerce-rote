import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;

  Failure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class ApiFailure extends Failure{
  ApiFailure({required super.message});
}
class NetworkFailure extends Failure{
  NetworkFailure({required super.message});
}