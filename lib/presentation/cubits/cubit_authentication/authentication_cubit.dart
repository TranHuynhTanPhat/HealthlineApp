// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthline/data/datasource/authentication/auth_datasource.dart';
import 'package:healthline/domain/usecase/auth_usecase.dart';
import 'package:healthline/repository/authentication/auth_repository.dart';

import '../../../app/app_controller.dart';
import '../../../data/storage/app_storage.dart';
import '../../../data/storage/data_constants.dart';
import '../../../util/log_data.dart';
import '../../resources/enum.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(AuthenticationInitial(blocState: BlocState.Successed));
  // final UserRepository _userRepository = UserRepository();
  // final DoctorRepository _doctorRepository = DoctorRepository();
  // final CommonRepository _commonRepository = CommonRepository();
  final AuthUsecase _authUsecase = AuthUsecase(
      authRepository: AuthRepository(authDataSource: AuthDataSource()));

  @override
  void onChange(Change<AuthenticationState> change) {
    super.onChange(change);
    logPrint("${change.currentState}: ${change.currentState.blocState}");
  }

  Future<void> registerAccount(
      String fullName,
      String phone,
      String email,
      String password,
      String passwordConfirm,
      String gender,
      String birthday,
      String address) async {
    emit(RegisterAccountState(blocState: BlocState.Pending));
    try {
      // await _userRepository.registerAccount(fullName, phone, email, password,
      //     passwordConfirm, gender, birthday, address);
      emit(RegisterAccountState(blocState: BlocState.Successed));
    } on DioException catch (e) {
      emit(
        RegisterAccountState(
          blocState: BlocState.Failed,
          error: e.response!.data['message'].toString(),
        ),
      );
    } catch (e) {
      emit(
        RegisterAccountState(
          blocState: BlocState.Failed,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginState(blocState: BlocState.Pending));
    try {
      var response = await _authUsecase.signInWithGoogle();
      response.fold((errorRes) {
        logPrint(errorRes.message);
        throw errorRes.message;
      }, (res) {
        if (res != null) {
          logPrint(res.additionalUserInfo.toString());
          logPrint(res.user.toString());
          logPrint(res.credential.toString());
        }
      });
      emit(LoginState(blocState: BlocState.Successed));
    } catch (e) {
      emit(LoginState(blocState: BlocState.Failed, error: e.toString()));
    }
  }

  Future<void> signIn(String contact,
      {required String password,
      required bool isDoctor,
      required bool isPatient,
      bool remember = false}) async {
    emit(LoginState(blocState: BlocState.Pending));
    String? error;

    try {
      if (isPatient) {
        var response = await _authUsecase.signInPatient(
            phone: contact, password: password);
        response.fold((errorRes) {
          logPrint(errorRes.message);
          logPrint("CHECKKK");
          error = errorRes.message;
          // throw errorRes.message;
        }, (res) {
          AppStorage().setString(
              key: DataConstants.PATIENT, value: json.encode(res.toJson()));
          AppController.instance.authState = AuthState.PatientAuthorized;
        });
      } else if (isDoctor) {
        // LoginResponse response =
        //     await _commonRepository.loginDoctor(phone.trim(), password.trim());
        // AppStorage()
        //     .setString(key: DataConstants.DOCTOR, value: response.toJson());
        // // doctor = true;
        // AppController.instance.authState = AuthState.DoctorAuthorized;
      }
      AppStorage().setBool(key: DataConstants.REMEMBER, value: remember);
      // SocketManager.instance.close();
      // SocketManager.instance.init();
      emit(LoginState(blocState: BlocState.Successed));
    } catch (e) {
      AppController.instance.authState = AuthState.Unauthorized;
      error = e.toString();
    }
    if (error != null) {
      emit(LoginState(error: error.toString(), blocState: BlocState.Failed));
    }

    // if (isPatient == true) {
    //   try {
    //     LoginResponse response =
    //         await _commonRepository.loginPatient(phone.trim(), password.trim());
    //     AppStorage()
    //         .setString(key: DataConstants.PATIENT, value: response.toJson());
    //     patient = true;
    //   } catch (e) {
    // DioException er = e as DioException;
    // // errorPatient = er.response!.data['message'].toString();
    //   }
    // }
    // if (isDoctor == true) {
    //   try {
    //     LoginResponse response =
    //         await _commonRepository.loginDoctor(phone.trim(), password.trim());
    //     AppStorage()
    //         .setString(key: DataConstants.DOCTOR, value: response.toJson());
    //     doctor = true;
    //   } catch (e) {
    //     DioException er = e as DioException;
    //     errorDoctor = er.response!.data['message'].toString();
    //   }
    // }
    // if (doctor == true || patient == true) {
    //   if (doctor == true && patient == true) {
    //     AppController.instance.authState = AuthState.AllAuthorized;
    //   } else if (doctor == true) {
    //     AppController.instance.authState = AuthState.DoctorAuthorized;
    //   } else {
    //     AppController.instance.authState = AuthState.PatientAuthorized;
    //   }
    // AppStorage().setBool(key: DataConstants.REMEMBER, value: remember);
    // emit(LogInSuccessed(
    //     isDoctor: doctor,
    //     isPatient: patient,
    //     errorPatient: errorPatient,
    //     errorDoctor: errorDoctor));
    // }
    // else {
    //   AppController.instance.authState = AuthState.Unauthorized;
    //   emit(
    //     LogInError(
    //         isDoctor: false,
    //         isPatient: false,
    //         errorDoctor: errorDoctor,
    //         errorPatient: errorPatient),
    //   );
    // }
  }

  // Future<void> logout() async {
  //   emit(LogoutState(blocState: BlocState.Pending));
  //   try {
  //     // await RestClient().logout();
  //     emit(LogoutState(blocState: BlocState.Successed));
  //   } catch (e) {
  //     logPrint(e);
  //     emit(LogoutState(blocState: BlocState.Failed, error: e.toString()));
  //   }
  // }

  Future<void> changePassword(
      {required String password, required String newPassword}) async {
    emit(ChangePasswordState(blocState: BlocState.Pending));
    try {
      // int? code;
      // if (AppController().authState == AuthState.DoctorAuthorized) {
      //   code = await _doctorRepository.changePassword(
      //       password: password, newPassword: newPassword);
      // }
      // if (AppController().authState == AuthState.PatientAuthorized) {
      //   code = await _userRepository.changePassword(
      //       password: password, newPassword: newPassword);
      // }

      // if (code == 200 || code == 201) {
      //   emit(ChangePasswordState(blocState: BlocState.Successed));
      // } else {
      //   emit(
      //       ChangePasswordState(blocState: BlocState.Failed, error: 'failure'));
      // }
    } on DioException catch (e) {
      emit(ChangePasswordState(
          blocState: BlocState.Failed,
          error: e.response!.data['message'].toString()));
    } catch (e) {
      logPrint(e);
      emit(ChangePasswordState(
          blocState: BlocState.Failed, error: e.toString()));
    }
  }

  Future<void> resetPassword(
      {required String email,
      required String otp,
      required String password,
      required String confirmPassword,
      bool isDoctor = false}) async {
    emit(ResetPasswordState(blocState: BlocState.Pending));
    try {
      // int? code;
      // if (isDoctor) {
      //   code = await _doctorRepository.resetPassword(
      //       password: password,
      //       confirmPassword: confirmPassword,
      //       email: email,
      //       otp: otp);
      // } else {
      //   code = await _userRepository.resetPassword(
      //       password: password,
      //       confirmPassword: confirmPassword,
      //       email: email,
      //       otp: otp);
      // }

      // if (code == 200 || code == 201) {
      //   emit(ResetPasswordState(blocState: BlocState.Successed));
      // } else {
      //   emit(ResetPasswordState(blocState: BlocState.Failed, error: 'failure'));
      // }
    } on DioException catch (e) {
      emit(ResetPasswordState(
          blocState: BlocState.Failed,
          error: e.response!.data['message'].toString()));
    } catch (e) {
      logPrint(e);
      emit(
          ResetPasswordState(blocState: BlocState.Failed, error: e.toString()));
    }
  }

  Future<void> sendOTP({required String email, bool isDoctor = false}) async {
    emit(SendOTPState(blocState: BlocState.Pending));
    try {
      // int? code;
      // if (isDoctor) {
      //   code = await _doctorRepository.sendOTP(email: email);
      // } else {
      //   code = await _userRepository.sendOTP(email: email);
      // }

      // if (code == 200 || code == 201) {
      //   emit(SendOTPState(blocState: BlocState.Successed));
      // } else {
      //   emit(SendOTPState(blocState: BlocState.Failed, error: 'failure'));
      // }
    } on DioException catch (e) {
      emit(SendOTPState(
          blocState: BlocState.Failed,
          error: e.response!.data['message'].toString()));
    } catch (e) {
      logPrint(e);
      emit(SendOTPState(blocState: BlocState.Failed, error: e.toString()));
    }
  }
}
