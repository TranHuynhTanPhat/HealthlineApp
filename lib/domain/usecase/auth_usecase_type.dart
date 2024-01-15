import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/domain/model/auth_model.dart';
import 'package:healthline/domain/model/failure.dart';

abstract class AuthUseCaseType {
  Future<Either<Failure, UserCredential?>> signInWithGoogle();
  Future<Either<Failure, AuthModel>> signInPatient({required String phone, required String password});
  Future<void> refreshTokenPatient();
  Future<void> refreshTokenDoctor();
 
  // Future<Either<Failure, AuthModel>> registerWithPhone({required String email, required String password});
}