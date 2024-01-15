import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/api/api_client.dart';
import 'package:healthline/data/api/api_client_type.dart';
import 'package:healthline/data/api/request/auth_request.dart';
import 'package:healthline/data/api/response/auth_response.dart';
import 'package:healthline/data/datasource/authentication/auth_datasource_type.dart';
import 'package:healthline/data/firebase/auth_service.dart';
import 'package:healthline/util/log_data.dart';

class AuthDataSource implements AuthDataSourceType {
  final AuthService _authService = AuthService();
  final APIClientType _apiClient = APIClientType(ApiClient().getDio());

  @override
  Future<UserCredential?> signInWithGoogle() {
    try {
      return _authService.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse?> signInPatient(
      {required String phone, required String password}) async {
    try {
      var response = await _apiClient
          .signInPatient(AuthRequest(phone: phone, password: password));
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> refreshTokenDoctor() async {
    try {
      var response = await _apiClient.refreshTokenDoctor();
      logPrint(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> refreshTokenPatient() async {
    try {
      var response = await _apiClient.refreshTokenPatient();
      logPrint(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
