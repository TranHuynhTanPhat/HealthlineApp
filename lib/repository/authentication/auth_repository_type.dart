import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/api/response/auth_response.dart';
import 'package:healthline/data/error_response.dart';

abstract class AuthRepositoryType {
  Future<Either<ErrorResponse, UserCredential?>> signInWithGoogle();
  Future<Either<ErrorResponse, AuthResponse?>> signInPatient({required String phone, required String password});
  Future<Either<ErrorResponse, String>> refreshTokenDoctor();
  Future<Either<ErrorResponse, String>> refreshTokenPatient();
}
