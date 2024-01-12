import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSourceType {
  Future<UserCredential?> signInWithGoogle();
  // Future<AuthResponse?> loginWithPhone({required String phone, required String password});
  // Future<AuthResponse?> registerWithEmail({required String email, required String password});
  // Future<AuthResponse?> registerWithPhone({required String phone, required String password});

}