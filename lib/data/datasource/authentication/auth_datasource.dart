import 'package:healthline/data/datasource/authentication/auth_datasource_type.dart';
import 'package:healthline/data/firebase/auth_service.dart';
import 'package:healthline/data/firebase/response/auth_response.dart';

class AuthDataSource implements AuthDataSourceType {
  final AuthService _authService;
  AuthDataSource({
    required authService,
  }) : _authService = authService;
  @override
  Future<AuthResponse?> loginWithEmail(
      {required String email, required String password}) {
    try {
      return _authService.loginWithEmail(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse?> loginWithPhone(
      {required String phone, required String password}) {
    // TODO: implement loginWithPhone
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse?> registerWithEmail(
      {required String email, required String password}) {
     try {
      return _authService.registerWithEmail(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse?> registerWithPhone(
      {required String phone, required String password}) {
    // TODO: implement registerWithPhone
    throw UnimplementedError();
  }
}
