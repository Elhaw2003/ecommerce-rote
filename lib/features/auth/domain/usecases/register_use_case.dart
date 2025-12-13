import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/register_response_entity.dart';
@Injectable()
class RegisterUseCase{
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure,RegisterResponseEntity>> call({required String email,required String password,required String name,required String rePassword,required String phone})async{
    return await authRepository.register(email: email, password: password, name: name, rePassword: rePassword, phone: phone);
  }

}