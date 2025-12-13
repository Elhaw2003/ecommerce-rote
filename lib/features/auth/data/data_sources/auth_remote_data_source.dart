import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_rote/core/end_points.dart';
import 'package:ecommerce_rote/core/error/failure.dart';
import 'package:ecommerce_rote/core/services/api_manager.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/features/auth/data/models/LoginResponseModel.dart';
import 'package:ecommerce_rote/features/auth/data/models/RegisterResponseModel.dart';
import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';
import 'package:ecommerce_rote/features/auth/domain/entities/register_response_entity.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failure,LoginResponseEntity>> login({required String email,required String password});
  Future<Either<Failure,RegisterResponseEntity>> register({required String email,required String password,required String name,required String rePassword,required String phone});
}
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDatsSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDatsSourceImpl({required this.apiManager});
  @override
  Future<Either<Failure, LoginResponseEntity>> login({required String email, required String password}) async {
    try {
      var checkConnectivity = await Connectivity().checkConnectivity();
      if (checkConnectivity == ConnectivityResult.none) {
        return Left(NetworkFailure(message: AppTexts.noInterNet));
      }
      var response = await apiManager.post(
        AppEndPoints.baseUrl + AppEndPoints.login,
        data: {
          "email": email,
          "password": password
        },
      );
      if (response.statusCode! >=200 && response.statusCode! <300) {
        print("=== ${response.data}");
        return Right(LoginResponseModel.fromJson(response.data));
      }
      else {
        print("=== ${response.data["message"]}");
        return Left(ApiFailure(message: response.data["message"] ?? "Login Failed"));
      }
  }on DioException catch(e){
      // check internet
      if(e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown){
        return Left(NetworkFailure(message: AppTexts.noInterNet));
      }
      return Left(
        ApiFailure(
          message: e.response?.data["message"] ?? "Something went wrong",
        ),
      );
    }
    catch(e){
      print("=== ${e.toString()}");
      return Left(ApiFailure(message: "UnExpected Error"));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> register({required String email, required String password, required String name, required String rePassword, required String phone}) async{
    try {
      var checkConnectivity = await Connectivity().checkConnectivity();
      if (checkConnectivity == ConnectivityResult.none) {
        return Left(NetworkFailure(message: AppTexts.noInterNet));
      }
      var response = await apiManager.post(
        AppEndPoints.baseUrl + AppEndPoints.register,
        data: {
          "email": email,
          "password": password,
          "rePassword":rePassword,
          "phone":phone,
          "name":name
        },
      );
      if (response.statusCode! >=200 && response.statusCode! <300) {
        print("=== ${response.data}");
        return Right(RegisterResponseModel.fromJson(response.data));
      }
      else {
        print("=== ${response.data["message"]}");
        return Left(ApiFailure(message: response.data["message"] ?? "Register Failed"));
      }
    }on DioException catch(e){
      // check internet
      if(e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown){
        return Left(NetworkFailure(message: AppTexts.noInterNet));
      }
      return Left(
        ApiFailure(
          message: e.response?.data["message"] ?? "Something went wrong",
        ),
      );
    }
    catch(e){
      print("=== ${e.toString()}");
      return Left(ApiFailure(message: "UnExpected Error"));
    }
  }

}