import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable()
class VerifyOtpUseCase {
  final AuthRepository authRepository;

  VerifyOtpUseCase({required this.authRepository});
  Future<Either<Failure,String>> call({required String resetCode})async{
    return await authRepository.verifyOtp(resetCode: resetCode);
  }
}