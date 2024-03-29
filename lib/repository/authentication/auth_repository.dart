import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthline/data/api/response/auth_response.dart';

import 'package:healthline/data/datasource/authentication/auth_datasource.dart';
import 'package:healthline/data/error_response.dart';
import 'package:healthline/repository/authentication/auth_repository_type.dart';
import 'package:healthline/util/app_mixin.dart';
import 'package:healthline/util/log_data.dart';

class AuthRepository with ConnectivityMixin implements AuthRepositoryType {
  final AuthDataSource dataSource;
  AuthRepository({
    required authDataSource,
  }) : dataSource = authDataSource;
  @override
  Future<Either<ErrorResponse, UserCredential?>> signInWithGoogle() async {
    if (await isInConnection()) {
      try {
        final response = await dataSource.signInWithGoogle();
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
  Future<Either<ErrorResponse, String>> refreshTokenDoctor() async {
    if (await isInConnection()) {
      try {
        final response = await dataSource.refreshTokenDoctor();
        if (response == null) {
          return const Left(NoDataErrorResponse());
        } else {
          return Right(response);
        }
      } catch (e) {
        return Left(ErrorResponse(e.toString()));
      }
    }
    return const Left(NoConnectionErrorResponse());
  }

  @override
  Future<Either<ErrorResponse, String>> refreshTokenPatient() async {
    if (await isInConnection()) {
      try {
        final response = await dataSource.refreshTokenDoctor();
        if (response == null) {
          return const Left(NoDataErrorResponse());
        } else {
          return Right(response);
        }
      } catch (e) {
        return Left(ErrorResponse(e.toString()));
      }
    }
    return const Left(NoConnectionErrorResponse());
  }

  @override
  Future<Either<ErrorResponse, AuthResponse?>> signInPatient(
      {required String phone, required String password}) async {
    if (await isInConnection()) {
      try {
        final response =
            await dataSource.signInPatient(phone: phone, password: password);
        if (response == null) {
          return const Left(NoDataErrorResponse());
        } else {
          return Right(response);
        }
      } catch (e) {
        return Left(ErrorResponse(e.toString()));
      }
    }
    return const Left(NoConnectionErrorResponse());
  }
}
