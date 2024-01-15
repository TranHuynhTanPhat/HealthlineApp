import 'package:dio/dio.dart';
import 'package:healthline/data/api/api_constants.dart';
import 'package:healthline/data/api/request/auth_request.dart';

import 'package:healthline/data/api/response/base/data_response.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart' as retrofit;

part 'api_client_type.g.dart';

@retrofit.RestApi()
abstract class APIClientType {
  factory APIClientType(Dio dio, {String baseUrl}) = _APIClientType;

  @retrofit.POST(ApiConstants.USER_LOG_IN)
  Future<DataResponse> signInPatient(@Body() AuthRequest request);

  @retrofit.POST(ApiConstants.DOCTOR_REFRESH_TOKEN)
  Future<DataResponse> refreshTokenDoctor();

  @retrofit.POST(ApiConstants.USER_REFRESH_TOKEN)
  Future<DataResponse> refreshTokenPatient();
}
