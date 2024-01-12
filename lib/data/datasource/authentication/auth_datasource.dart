import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/datasource/authentication/auth_datasource_type.dart';
import 'package:healthline/data/firebase/auth_service.dart';

class AuthDataSource implements AuthDataSourceType {
  final AuthService _authService;
  AuthDataSource({
    required authService,
  }) : _authService = authService;
  @override
  Future<UserCredential?> signInWithGoogle() {
    try {
      return _authService.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }
}
