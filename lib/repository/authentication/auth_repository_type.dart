import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/error_response.dart';

abstract class AuthRepositoryType {
  Future<Either<ErrorResponse, UserCredential>> signInWithGoogle();
}
