import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable{

   String? token;
   UserEntity? user;

  LoginResponseEntity({ this.token,  this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [token,user];

}
class UserEntity extends Equatable{
   String? name;
   String? email;
   String? role;

  UserEntity({ this.name,  this.email,  this.role});

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,role];
}