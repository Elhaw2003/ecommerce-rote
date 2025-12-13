import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity{
  LoginResponseModel({
       super.user,
       super.token,});

  LoginResponseModel.fromJson(dynamic json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }



}

class UserModel extends UserEntity{
  UserModel({
       super.name,
       super.email,
       super.role,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }



}