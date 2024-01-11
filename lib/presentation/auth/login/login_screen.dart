// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthline/app/app_controller.dart';

import '../../../util/keyboard.dart';
import '../../../util/translate.dart';
import '../../cubits/export.dart';
import '../../resources/export.dart';
import 'components/exports.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginState) {
          if (state.blocState == BlocState.Pending) {
            EasyLoading.show(maskType: EasyLoadingMaskType.black);
          } else if (state.blocState == BlocState.Successed) {
            EasyLoading.dismiss();
            // if (state.errorDoctor != null) {
            //   EasyLoading.showToast(
            //       translate(context, 'login_to_doctor_account_failed'));
            // }
            // if (state.errorPatient != null) {
            //   print(state.errorPatient);
            //   EasyLoading.showToast(
            //       translate(context, 'login_to_patient_account_failed'));
            // }
            // if (AppController.instance.authState ==
            //     AuthState.DoctorAuthorized) {
            //   Navigator.pushReplacementNamed(context, mainScreenDoctorRoute);
            // } else {
            //   Navigator.pushReplacementNamed(context, mainScreenPatientRoute);
            // }
          } else if (state.blocState == BlocState.Failed) {
            EasyLoading.dismiss();
            EasyLoading.showToast(translate(context, state.error));
          }
        }
      },
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => KeyboardUtil.hideKeyboard(context),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: AbsorbPointer(
                absorbing: state.blocState == BlocState.Pending,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: dimensHeight() * 10,
                      horizontal: dimensWidth() * 3),
                  children: [
                    const HeaderLogIn(),
                    SizedBox(
                      height: dimensHeight() * 3,
                    ),
                    const LogInForm(),
                    const OptionLogIn()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
