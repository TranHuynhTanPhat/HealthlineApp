// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthline/data/storage/app_storage.dart';
import 'package:healthline/data/storage/data_constants.dart';

import '../../util/linear_progress_indicator.dart';
import '../cubits/cubit_application_update/application_update_cubit.dart';
import '../resources/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTimer() {
    Future.delayed(const Duration(seconds: 2), _goNext);
    // Future.delayed(const Duration(milliseconds: 1000), () async {
    //   bool? firstTime = AppStorage().getBool(key: DataConstants.FIRST_TIME);
    //   // prefs.setBool('first_time', true);
    //   try {
    //     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //         await PushNotificationManager().getNotificationAppLaunchDetails();
    //     final didNotificationLaunchApp =
    //         notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

    //     if (didNotificationLaunchApp) {
    //       Navigator.pushReplacementNamed(context,
    //           notificationAppLaunchDetails!.notificationResponse!.payload!);
    //       PushNotificationManager().cancelNotification(
    //           notificationAppLaunchDetails.notificationResponse?.id);
    //     } else {
    //       if (firstTime != null && !firstTime) {
    //         if (AppController.instance.authState == AuthState.Unauthorized) {
    //           Navigator.pushReplacementNamed(context, logInName);
    //         } else if (
    //             // AppController.instance.authState ==
    //             //       AuthState.AllAuthorized ||
    //             AppController.instance.authState ==
    //                 AuthState.DoctorAuthorized) {
    //           Navigator.pushReplacementNamed(context, mainScreenDoctorName);
    //         } else {
    //           Navigator.pushReplacementNamed(context, mainScreenPatientName);
    //         }
    //       } else {
    //         AppStorage().setBool(key: DataConstants.FIRST_TIME, value: false);
    //         Navigator.pushReplacementNamed(context, onboardingName);
    //       }
    //     }
    //   } catch (e) {
    //     logPrint(e);
    //   }

    //   // Navigator.pushReplacementNamed(context, mainScreenPatientName);
    // });
  }

  _goNext() {
    bool? firstTime = AppStorage().getBool(key: DataConstants.FIRST_TIME);
    if (firstTime == true) {
      AppStorage().setBool(key: DataConstants.FIRST_TIME, value: false);

      Navigator.pushReplacementNamed(context, onboardingRoute);
    }else{
      Navigator.pushReplacementNamed(context, logInRoute);

    }
  }

  @override
  void initState() {
    if (!mounted) return;
    context.read<ApplicationUpdateCubit>().requestCurrentPatchNumber();
    context.read<ApplicationUpdateCubit>().checkForUpdate();
    // PushNotificationManager()
    //     .configureDidReceiveLocalNotificationSubject(context);
    // PushNotificationManager().configureSelectNotificationSubject(context);

    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.hospital,
            color: secondary,
            size: dimensWidth() * 20,
          ),
          // Container(
          //   padding: EdgeInsets.only(top: dimensHeight() * 2),
          //   width: dimensWidth() * 100,
          //   alignment: Alignment.center,
          //   child: Text(
          //     'HealthLine',
          //     style: Theme.of(context)
          //         .textTheme
          //         .displaySmall
          //         ?.copyWith(color: white),
          //   ),
          // ),
          // ProgressIndicator()
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p40, vertical: AppPadding.p40),
            child: LinearProgressIndicatorLoading(),
          )
        ],
      ),
    );
  }
}
