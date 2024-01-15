import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/storage/app_storage.dart';
import 'package:healthline/data/storage/data_constants.dart';
import 'package:healthline/domain/model/auth_model.dart';
import 'package:healthline/domain/model/failure.dart';
import 'package:healthline/domain/translator/auth_translator.dart';
import 'package:healthline/domain/usecase/auth_usecase_type.dart';
import 'package:healthline/repository/authentication/auth_repository.dart';

import '../../util/log_data.dart';

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

  @override
  Future<void> refreshTokenDoctor() async {
    final result = await repository.refreshTokenDoctor();
    return result.fold((errorResponse) {
      logPrint(Left(Failure(message: errorResponse.message)));
    }, (response) {
      AppStorage().setString(key: DataConstants.ACCESS_TOKEN, value: response);
    });
  }

  @override
  Future<void> refreshTokenPatient() async {
    final result = await repository.refreshTokenPatient();
    return result.fold((errorResponse) {
      logPrint(Left(Failure(message: errorResponse.message)));
    }, (response) {
      AppStorage().setString(key: DataConstants.ACCESS_TOKEN, value: response);
    });
  }

  @override
  Future<Either<Failure, AuthModel>> signInPatient(
      {required String phone, required String password}) async {
    final result =
        await repository.signInPatient(phone: phone, password: password);
    return result.fold((errorResponse) {
      return Left(Failure(message: errorResponse.message));
    }, (response) {
      return Right(AuthTranslator.toAuthModel(response: response));
    });
  }
}
