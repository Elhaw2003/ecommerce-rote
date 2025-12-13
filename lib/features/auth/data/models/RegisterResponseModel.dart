import 'package:ecommerce_rote/features/auth/domain/entities/register_response_entity.dart';

import 'LoginResponseModel.dart';

class RegisterResponseModel extends RegisterResponseEntity{
  RegisterResponseModel({
      super.user,
      super.token,});

  RegisterResponseModel.fromJson(dynamic json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

}