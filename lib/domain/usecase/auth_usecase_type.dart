import 'package:dartz/dartz.dart';
import 'package:healthline/domain/model/auth_model.dart';
import 'package:healthline/domain/model/failure.dart';

abstract class AuthUseCaseType {
  Future<Either<Failure, AuthModel>> loginWithEmail({required String email, required String password});
  Future<Either<Failure, AuthModel>> loginWithPhone( String phone);
  Future<Either<Failure, AuthModel>> registerWithEmail({required String email, required String password});
  // Future<Either<Failure, AuthModel>> registerWithPhone({required String email, required String password});
}