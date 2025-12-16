import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable()
class ChangePasswordUseCase {
  final AuthRepository authRepository;

  ChangePasswordUseCase({required this.authRepository});
  Future<Either<Failure,String>> call({required String email,required String newPassword})async{
    return await authRepository.changePassword(email: email, newPassword: newPassword);
  }
}