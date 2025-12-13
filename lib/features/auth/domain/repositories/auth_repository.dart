import 'package:dartz/dartz.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginResponseEntity>> login({required String email,required String password});
}