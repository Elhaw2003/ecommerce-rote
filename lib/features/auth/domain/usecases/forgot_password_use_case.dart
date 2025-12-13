import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable()
class ForgotPasswordUseCase {
  final AuthRepository authRepository;
  ForgotPasswordUseCase({
    required this.authRepository,
});
  Future<Either<Failure,String>> call({required String email})async{
    return await authRepository.forgotPassword(email: email);
  }
}