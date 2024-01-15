// ignore_for_file: no_leading_underscores_for_local_identifiers, constant_identifier_names
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:healthline/app/app_controller.dart';
import 'package:healthline/data/api/alice_inspector/alice_inspector.dart';
import 'package:healthline/data/api/api_constants.dart';
import 'package:healthline/data/storage/app_storage.dart';
import 'package:healthline/presentation/resources/enum.dart';
import 'package:healthline/util/log_data.dart';

import '../storage/data_constants.dart';
import 'response/auth_response.dart';

class ApiClient {
  static const CONNECT_TIME_OUT = 60 * 1000;
  static const RECEIVE_TIME_OUT = 60 * 1000;
  static const ENABLE_LOG = true;
  static const ACCESS_TOKEN_HEADER = 'Authorization';
  static const LANGUAGE = 'Accept-Language';

  // singleton
  static final ApiClient instance = ApiClient._internal();

  factory ApiClient() {
    return instance;
  }

  ApiClient._internal();

  late Map<String, dynamic> headers;
  late CookieJar cookieJar;

  Future<void> init(
      {String? platform,
      String? deviceId,
      String? language,
      String? appVersion}) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );

    // cookieJar = CookieJar();
    headers = {
      'Content-Type': 'application/json',
      'X-Version': appVersion,
      'X-Platform': platform,
      'x-device-id': deviceId
    };
    setLanguage(language!);
  }

  // void setToken(String token) {
  //   headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
  // }

  void setLanguage(String language) {
    headers[LANGUAGE] = language;
  }

  BaseOptions getDioBaseOption() {
    return BaseOptions(
      connectTimeout: const Duration(seconds: CONNECT_TIME_OUT),
      receiveTimeout: const Duration(seconds: RECEIVE_TIME_OUT),
      headers: instance.headers,
      responseType: ResponseType.json,
    );
  }

  Dio getDio() {
    // var dio = Dio(instance.getDioBaseOption(isUpload));
    var dio = Dio(instance.getDioBaseOption());
    dio.interceptors.add(AliceInspector().alice.getDioInterceptor());

    dio.interceptors.add(CookieManager(instance.cookieJar));

    dio.addSentry();

    if (ENABLE_LOG) {
      dio.interceptors.add(LogInterceptor(
          requestBody: true, responseBody: true, logPrint: logPrint));
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // if (!isUpload) {
          /// check path
          if (!options.path.contains('http')) {
            options.path = dotenv.get('BASE_URL', fallback: '') + options.path;
          }

          AuthResponse? user;

          /// check access token
          try {
            user = AppController().authState == AuthState.DoctorAuthorized
                ? AuthResponse.fromJson(json
                    .decode(AppStorage().getString(key: DataConstants.DOCTOR)!))
                : AuthResponse.fromJson(json.decode(
                    AppStorage().getString(key: DataConstants.PATIENT)!));
          } catch (e) {
            logPrint(e);
          }

          if (user == null || user.jwtToken == null) {
            return handler.next(options);
          }

          String? jwtToken =
              AppStorage().getString(key: DataConstants.ACCESS_TOKEN);

          bool isExpired = JwtDecoder.isExpired(jwtToken!);

          /// if access token expired ---> refresh token
          /// else continue
          /// dont rt when path contain LOG_IN or SIGN_UP or REFRESH_TOKEN or LOG_OUT

          if (isExpired &&
              !options.path.contains(ApiConstants.USER_REFRESH_TOKEN) &&
              !options.path.contains(ApiConstants.USER_LOG_IN) &&
              !options.path.contains(ApiConstants.USER_LOG_OUT) &&
              !options.path.contains(ApiConstants.USER)) {
            try {
              /// refresh token if success continue
              /// else logout

              if (AppController().authState == AuthState.DoctorAuthorized) {
                final response = await dio.post(
                    dotenv.get('BASE_URL', fallback: '') +
                        ApiConstants.DOCTOR_REFRESH_TOKEN);
                if (response.statusCode == 200) {
                  if (response.data != null) {
                    options.headers[ACCESS_TOKEN_HEADER] =
                        "Bearer ${response.data["jwtToken"]}";
                    AppStorage().setString(
                      key: DataConstants.DOCTOR,
                      value: user
                          .copyWith(jwtToken: response.data)
                          .toJson()
                          .toString(),
                    );
                  } else {
                    logout();
                  }
                } else {
                  logout();
                }
              } else {
                final response = await dio.post(
                    dotenv.get('BASE_URL', fallback: '') +
                        ApiConstants.USER_REFRESH_TOKEN);
                if (response.statusCode == 200) {
                  if (response.data != null) {
                    options.headers[ACCESS_TOKEN_HEADER] =
                        "Bearer ${response.data["jwtToken"]}";
                    AppStorage().setString(
                      key: DataConstants.DOCTOR,
                      value: user
                          .copyWith(jwtToken: response.data)
                          .toJson()
                          .toString(),
                    );
                  } else {
                    logout();
                  }
                } else {
                  logout();
                }
              }

              return handler.next(options);
            } on DioException catch (error) {
              return handler.reject(error, true);
            }
          } else {
            options.headers[ACCESS_TOKEN_HEADER] = "Bearer $jwtToken";
            return handler.next(options);
          }
          // } else {
          //   logPrint('CALL_CLOUDINARY_API');

          //   // options.headers.remove('ACCESS_TOKEN_HEADER');

          //   /// check path
          //   if (!options.path.contains('http')) {
          //     options.path =
          //         dotenv.get('CLOUDINARY_API', fallback: '') + options.path;
          //   }
          //   return handler.next(options);
          // }
        },
        onResponse: (Response response, handler) async {
          logPrint("RESPONSE");
          logPrint(response.headers);
          try {
            await instance.cookieJar.saveFromResponse(
                Uri.parse('${dotenv.get('BASE_URL', fallback: '')}/'), []);
          } catch (e) {
            logPrint(e);
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          logPrint("ERROR");
          logPrint(error.message);
          // if (error.response?.statusCode == 401) {
          //   logout();
          // }
          Sentry.captureException(
            "REST_CLIENT: $error",
          );
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  Future<void> logout() async {
    try {
      await AppStorage().clear();
      AppController.instance.authState = AuthState.Unauthorized;
      if (AppController.instance.authState == AuthState.DoctorAuthorized) {
        await getDio().delete(
            dotenv.get('BASE_URL', fallback: '') + ApiConstants.DOCTOR_LOG_OUT);
      } else {
        await getDio().delete(
            dotenv.get('BASE_URL', fallback: '') + ApiConstants.USER_LOG_OUT);
      }
      instance.cookieJar.deleteAll();
    } catch (e) {
      logPrint(e);
    }
    // EasyLoading.showToast(translate(navigatorKey?.currentState!.context!, 'value'));
    EasyLoading.dismiss();
    // navigatorKey?.currentState!
    //     .pushNamedAndRemoveUntil(logInName, (route) => false);
  }

  void runHttpInspector() {
    AliceInspector().alice.showInspector();
  }
}
