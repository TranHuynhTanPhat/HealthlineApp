import 'package:dartz/dartz.dart';
import 'package:healthline/domain/model/auth_model.dart';
import 'package:healthline/domain/model/failure.dart';
import 'package:healthline/domain/translator/auth_translator.dart';
import 'package:healthline/domain/usecase/auth_usecase_type.dart';
import 'package:healthline/repository/authentication/auth_repository.dart';
import 'package:healthline/util/log_data.dart';

class AuthUsecase implements AuthUseCaseType {
  final AuthRepository repository;

  AuthUsecase({required AuthRepository authRepository})
      : repository = authRepository;
  @override
  Future<Either<Failure, AuthModel>> loginWithEmail(
      {required String email, required String password}) async {
    final result =
        await repository.loginWithEmail(email: email, password: password);
    return result.fold((errorResponse) {
      return Left(Failure(message: errorResponse.message));
    }, (response) {
      return Right(AuthTranslator.toAuthModel(response: response));
    });
  }

  @override
  Future<Either<Failure, AuthModel>> loginWithPhone(String phone) {
    // TODO: implement loginWithPhone
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthModel>> registerWithEmail(
      {required String email, required String password}) async {
    final result =
        await repository.registerWithEmail(email: email, password: password);
    return result.fold((errorResponse) {
      return Left(Failure(message: errorResponse.message));
    }, (response) {
      return Right(AuthTranslator.toAuthModel(response: response));
    });
  }

  @override
  Future<Either<Failure, AuthModel>> registerWithPhone(
      {required String email, required String password}) {
    // TODO: implement registerWithPhone
    throw UnimplementedError();
  }
}
