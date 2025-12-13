import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';
import 'package:ecommerce_rote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
class AuthRepositoriesImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoriesImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, LoginResponseEntity>> login({required String email, required String password}) async{
    var response = await authRemoteDataSource.login(email: email, password: password);
    return response.fold((l){
      return Left(l);
    }, (r){
      return Right(r);
    });
  }

}