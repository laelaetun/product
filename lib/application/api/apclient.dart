import 'package:dio/dio.dart';
import 'package:product/application/constants/constants.dart';

class ApiClient {
final Dio dio=Dio(BaseOptions(baseUrl: Constants.baseUrl));
Future<Response> get(String path) async{
  return await dio.get(path);
}
}