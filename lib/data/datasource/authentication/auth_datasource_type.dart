import 'package:healthline/data/firebase/response/auth_response.dart';

abstract class AuthDataSourceType {
  Future<AuthResponse?> loginWithEmail({required String email, required String password});
  Future<AuthResponse?> loginWithPhone({required String phone, required String password});
  Future<AuthResponse?> registerWithEmail({required String email, required String password});
  Future<AuthResponse?> registerWithPhone({required String phone, required String password});

}