import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager {
  late Dio dio;

  ApiManager({required this.dio});

  Future<Response> post (String path , {Map<String , dynamic>? data, Map<String , dynamic>? queryParameters})async{
   return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status){
          return true;
        }
      )
    );
  }
  Future<Response> put (String path , {Map<String , dynamic>? data, Map<String , dynamic>? queryParameters})async{
   return await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status){
          return true;
        }
      )
    );
  }

}