import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/api/response/auth_response.dart';

abstract class AuthDataSourceType {
  Future<UserCredential?> signInWithGoogle();
  Future<AuthResponse?> signInPatient({required String phone, required String password});
  Future<String?> refreshTokenPatient();
  Future<String?> refreshTokenDoctor();
  // Future<AuthResponse?> loginWithPhone({required String phone, required String password});
  // Future<AuthResponse?> registerWithEmail({required String email, required String password});
  // Future<AuthResponse?> registerWithPhone({required String phone, required String password});

}