import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';
import 'package:equatable/equatable.dart';

class RegisterResponseEntity extends Equatable{
  String? token;
  UserEntity? user;
  RegisterResponseEntity({
    this.token,
  this.user
  });


  @override
  // TODO: implement props
  List<Object?> get props =>[token,user];
}