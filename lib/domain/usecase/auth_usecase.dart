import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/domain/model/failure.dart';
import 'package:healthline/domain/usecase/auth_usecase_type.dart';
import 'package:healthline/repository/authentication/auth_repository.dart';

class AuthUsecase implements AuthUseCaseType {
  final AuthRepository repository;

  AuthUsecase({required AuthRepository authRepository})
      : repository = authRepository;
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    final result = await repository.signInWithGoogle();
    return result.fold((errorResponse) {
      return Left(Failure(message: errorResponse.message));
    }, (response) {
      return Right(response);
    });
  }
}
