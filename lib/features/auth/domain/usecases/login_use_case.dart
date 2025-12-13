import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/login_response_entity.dart';
@Injectable()
class LoginUseCase{
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure,LoginResponseEntity>> call({required String email,required String password})async{
    return await authRepository.login(email: email, password: password);
  }


}