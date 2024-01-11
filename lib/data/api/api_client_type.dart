import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'api_client_type.g.dart';

@retrofit.RestApi()
abstract class APIClientType {
  factory APIClientType(Dio dio, {String baseUrl}) = _APIClientType;

}