import 'package:dartz/dartz.dart';

import 'package:healthline/data/datasource/authentication/auth_datasource.dart';
import 'package:healthline/data/error_response.dart';
import 'package:healthline/data/firebase/response/auth_response.dart';
import 'package:healthline/repository/authentication/auth_repository_type.dart';
import 'package:healthline/util/app_mixin.dart';

class AuthRepository with ConnectivityMixin implements AuthRepositoryType {
  final AuthDataSource dataSource;
  AuthRepository({
    required authDataSource,
  }) : dataSource = authDataSource;
  @override
  Future<Either<ErrorResponse, AuthResponse>> loginWithEmail(
      {required String email, required String password}) async {
    if (await isInConnection()) {
      try {
        final response =
            await dataSource.loginWithEmail(email: email, password: password);
        if (response != null) {
          return Right(response);
        } else {
          return const Left(NoDataErrorResponse());
        }
      } catch (e) {
        return Left(ErrorResponse(e.toString()));
      }
    }
    return const Left(NoConnectionErrorResponse());
  }

  @override
  Future<Either<ErrorResponse, AuthResponse>> loginWithPhone(
      {required String phone, required String password}) {
    // TODO: implement loginWithPhone
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorResponse, AuthResponse>> registerWithEmail(
      {required String email, required String password}) async {
    if (await isInConnection()) {
      try {
        final response = await dataSource.registerWithEmail(
            email: email, password: password);
        if (response != null) {
          return Right(response);
        } else {
          return const Left(NoDataErrorResponse());
        }
      } catch (e) {
        return Left(ErrorResponse(e.toString()));
      }
    }
    return const Left(NoConnectionErrorResponse());
  }

  @override
  Future<Either<ErrorResponse, AuthResponse>> registerWithPhone(
      {required String phone, required String password}) {
    // TODO: implement registerWithPhone
    throw UnimplementedError();
  }
}
