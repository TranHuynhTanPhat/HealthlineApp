import 'package:dartz/dartz.dart';
import 'package:healthline/data/error_response.dart';

import 'package:healthline/data/firebase/response/auth_response.dart';

abstract class AuthRepositoryType {
  Future<Either<ErrorResponse, AuthResponse>> loginWithEmail({required String email, required String password});
  Future<Either<ErrorResponse, AuthResponse>> registerWithPhone({required String phone, required String password});
  Future<Either<ErrorResponse, AuthResponse>> registerWithEmail({required String email, required String password});
  Future<Either<ErrorResponse, AuthResponse>> loginWithPhone({required String phone, required String password});
}
