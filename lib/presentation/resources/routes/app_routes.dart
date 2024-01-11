// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:healthline/app/app_controller.dart';

// class AppRoute {
//   final _vaccineRecordCubit = VaccineRecordCubit();
//   final _authenticationCubit = AuthenticationCubit();
//   final _medicalRecordCubit = MedicalRecordCubit();
//   final _patientProfileCubit = PatientProfileCubit();
//   final _docsVaccination = DocsVaccinationCubit();
//   final _doctorScheduleCubit = DoctorScheduleCubit();
//   final _doctorProfileCubit = DoctorProfileCubit();
//   final _patientRecordCubit = PatientRecordCubit();
//   final _doctorCubit = DoctorCubit();
//   final _newsCubit = NewsCubit();
//   final _forumCubit = ForumCubit();
//   final _consultationCubit = ConsultationCubit();
//   // final _applicationUpdateBloc = ApplicationUpdateCubit();

//   void dispose() {
//     _vaccineRecordCubit.close();
//     _authenticationCubit.close();
//     _medicalRecordCubit.close();
//     _patientProfileCubit.close();
//     _docsVaccination.close();
//     _doctorScheduleCubit.close();
//     _doctorProfileCubit.close();
//     _patientRecordCubit.close();
//     _doctorCubit.close();
//     _newsCubit.close();
//     _forumCubit.close();
//     _consultationCubit.close();
//     // _applicationUpdateBloc.close();

//     AppController.instance.close();
//   }

//   Route? onGeneralRoute(RouteSettings settings) {
//     if (AppController.instance.authState == AuthState.DoctorAuthorized ||
//         AppController.instance.authState == AuthState.PatientAuthorized ||
//         AppController.instance.authState == AuthState.Unauthorized) {
//       switch (settings.name) {
//         case forumName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _forumCubit,
//               child: const ForumScreen(),
//             ),
//           );

//         case newsName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _newsCubit,
//               child: const NewsScreen(),
//             ),
//           );
//         case detailNewsName:
//           final args = settings.arguments as String?;
//           return MaterialPageRoute(
//             builder: (_) => DetailNewsScreen(args: args),
//           );
//         case termsAndConditionsName:
//           return MaterialPageRoute(
//             builder: (_) => const TermsAndConditionsScreen(),
//           );
//         case faqsName:
//           return MaterialPageRoute(
//             builder: (_) => const FAQsScreen(),
//           );
//         case privacyPolicyName:
//           return MaterialPageRoute(
//             builder: (_) => const PrivacyPolicyScreen(),
//           );
//       }
//     }
//     if (AppController.instance.authState == AuthState.DoctorAuthorized ||
//         AppController.instance.authState == AuthState.PatientAuthorized) {
//       switch (settings.name) {
//         case editPostName:
//           final args = settings.arguments as String?;

//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _forumCubit,
//               child: EditPostScreen(args: args),
//             ),
//           );
//         case bugReportName:
//           return MaterialPageRoute(
//             builder: (_) => const BugReportScreen(),
//           );
//         case walletName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _patientProfileCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _doctorProfileCubit,
//                 ),
//               ],
//               child: const WalletScreen(),
//             ),
//           );
//         case changePasswordName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _authenticationCubit,
//               child: const ChangePassword(),
//             ),
//           );
//         case detailConsultationName:
//           final args = settings.arguments as String?;
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _consultationCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _patientRecordCubit,
//                 ),
//               ],
//               child: DetailConsultationScreen(
//                 args: args,
//               ),
//             ),
//           );
//         case updateName:
//           return MaterialPageRoute(
//             builder: (_) => const UpdateScreen(),
//           );
//       }
//     }
//     if (AppController.instance.authState == AuthState.Unauthorized) {
//       switch (settings.name) {
//         case onboardingName:
//           return MaterialPageRoute(
//             builder: (_) => const OnboardingScreen(),
//           );
//         case signUpName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _authenticationCubit,
//               child: const SignUpScreen(),
//             ),
//           );
//         case forgetPasswordName:
//           bool isDoctor = settings.arguments as bool? ?? false;
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _authenticationCubit,
//               child: ForgotPasswordScreen(isDoctor: isDoctor),
//             ),
//           );

//         default:
//           // case logInName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _authenticationCubit,
//               child: const LogInScreen(),
//             ),
//           );
//       }
//     } else if (AppController.instance.authState == AuthState.DoctorAuthorized) {
//       switch (settings.name) {
//         case mainScreenDoctorName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _authenticationCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _doctorProfileCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _doctorScheduleCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _consultationCubit,
//                 ),
//               ],
//               child: const MainScreenDoctor(),
//             ),
//           );
//         case shiftDoctorName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: _doctorScheduleCubit),
//               ],
//               child: const ShiftScreen(),
//             ),
//           );
//         case updateProfileDoctorName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _doctorProfileCubit,
//               child: const UpdateProfileScreen(),
//             ),
//           );
//         case updateDefaultScheduleDoctorName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _doctorScheduleCubit,
//               child: const UpdateDefaultScheduleScreen(),
//             ),
//           );
//         case updateScheduleByDayDoctorName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _doctorScheduleCubit,
//               child: const UpdateScheduleByDayScreen(),
//             ),
//           );
//       }
//     } else if (AppController.instance.authState ==
//         AuthState.PatientAuthorized) {
//       switch (settings.name) {
//         case mainScreenPatientName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _authenticationCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _vaccineRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _medicalRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _patientRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _doctorCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _consultationCubit,
//                 ),
//               ],
//               child: const MainScreenPatient(),
//             ),
//           );
//         case doctorName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _doctorCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _consultationCubit,
//                 ),
//               ],
//               child: const DoctorScreen(),
//             ),
//           );
//         case detailDoctorName:
//           final args = settings.arguments as String?;
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _consultationCubit,
//               child: DetailDoctorScreen(
//                 args: args,
//               ),
//             ),
//           );
//         case accountSettingName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _authenticationCubit,
//               child: const AccountSettingScreen(),
//             ),
//           );
//         case applicationSettingName:
//           return MaterialPageRoute(
//             builder: (_) => const ApplicationSettingScreen(),
//           );
//         case contactName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _patientProfileCubit,
//               child: const ContactScreen(),
//             ),
//           );

//         case vaccinationName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _vaccineRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _medicalRecordCubit,
//                 ),
//               ],
//               child: const VaccinationScreen(),
//             ),
//           );
//         case addVaccinationName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _vaccineRecordCubit,
//               child: const AddVaccinationScreen(),
//             ),
//           );

//         case refVaccinationName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider(
//               create: (context) => _docsVaccination,
//               child: const DocsVaccinationScreen(),
//             ),
//           );
//         case updateHealthStatName:
//           return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//               value: _medicalRecordCubit,
//               child: const HealthStatUpdateScreen(),
//             ),
//           );
//         case patientRecordName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _medicalRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _patientRecordCubit,
//                 ),
//               ],
//               child: const PatientRecordScreen(),
//             ),
//           );
//         case addPatientRecordName:
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _patientRecordCubit,
//                 ),
//               ],
//               child: const AddPatientRecordScreen(),
//             ),
//           );
//         case helpsName:
//           return MaterialPageRoute(
//             builder: (_) => const HelpsScreen(),
//           );
//         // case timelineDoctorName:
//         // String? args = settings.arguments as String?;
//         //   return MaterialPageRoute(
//         //     builder: (_) => BlocProvider.value(
//         //       value: _consultationCubit,
//         //       child: TimelineDoctorScreen(args: args),
//         //     ),
//         //   );
//         // case paymentMethodsName:
//         //   return MaterialPageRoute(
//         //     builder: (_) => BlocProvider.value(
//         //       value: _consultationCubit,
//         //       child: const PaymentMethodScreen(),
//         //     ),
//         //   );
//         // case invoiceName:
//         //   return MaterialPageRoute(
//         //     builder: (_) => BlocProvider.value(
//         //       value: _consultationCubit,
//         //       child: const InvoiceScreen(),
//         //     ),
//         //   );
//         case createConsultationName:
//           String? args = settings.arguments as String?;
//           return MaterialPageRoute(
//             builder: (_) => MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(
//                   value: _consultationCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _medicalRecordCubit,
//                 ),
//                 BlocProvider.value(
//                   value: _patientRecordCubit,
//                 ),
//               ],
//               child: CreateConsultationScreen(
//                 args: args,
//               ),
//             ),
//           );
//         // case formConsultationName:
//         //   return MaterialPageRoute(
//         //     builder: (_) => BlocProvider.value(
//         //       value: _consultationCubit,
//         //       child: const FormConsultationScreen(),
//         //     ),
//         //   );
//         // case formMedicalDeclarationName:
//         //   return MaterialPageRoute(
//         //     builder: (_) => MultiBlocProvider(
//         //       providers: [
//         //         BlocProvider.value(
//         //           value: _consultationCubit,
//         //         ),
//         //         BlocProvider.value(
//         //           value: _patientRecordCubit,
//         //         ),
//         //       ],
//         //       child: const FormMedicalDeclaration(),
//         //     ),
//         //   );
//       }
//     }
//     return MaterialPageRoute(
//       builder: (_) => MaterialApp(home: Container(),),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_controller.dart';
import '../../auth/forget_password/forgot_password_screen.dart';
import '../../auth/login/login_screen.dart';
import '../../auth/signup/signup_screen.dart';
import '../../cubits/cubit_authentication/authentication_cubit.dart';
import '../../license/bug_report.dart';
import '../../license/faqs_screen.dart';
import '../../license/privacy_policy_screen.dart';
import '../../onboarding/onboarding.dart';
import '../../splash/splash_screen.dart';
import 'app_pages.dart';

class AppRoute {
  // final _vaccineRecordCubit = VaccineRecordCubit();
  final _authenticationCubit = AuthenticationCubit();
  // final _medicalRecordCubit = MedicalRecordCubit();
  // final _patientProfileCubit = PatientProfileCubit();
  // final _docsVaccination = DocsVaccinationCubit();
  // final _doctorScheduleCubit = DoctorScheduleCubit();
  // final _doctorProfileCubit = DoctorProfileCubit();
  // final _patientRecordCubit = PatientRecordCubit();
  // final _doctorCubit = DoctorCubit();
  // final _newsCubit = NewsCubit();
  // final _forumCubit = ForumCubit();
  // final _consultationCubit = ConsultationCubit();
  // final _applicationUpdateBloc = ApplicationUpdateCubit();

  void dispose() {
    // _vaccineRecordCubit.close();
    _authenticationCubit.close();
    // _medicalRecordCubit.close();
    // _patientProfileCubit.close();
    // _docsVaccination.close();
    // _doctorScheduleCubit.close();
    // _doctorProfileCubit.close();
    // _patientRecordCubit.close();
    // _doctorCubit.close();
    // _newsCubit.close();
    // _forumCubit.close();
    // _consultationCubit.close();
    // _applicationUpdateBloc.close();

    AppController.instance.close();
  }

  Route? onGeneralRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case logInRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authenticationCubit,
            child: const LogInScreen(),
          ),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authenticationCubit,
            child: const SignUpScreen(),
          ),
        );
      case forgetPasswordRoute:
        bool isDoctor = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authenticationCubit,
            child: ForgotPasswordScreen(isDoctor: isDoctor),
          ),
        );
      case faqsRoute:
        return MaterialPageRoute(
          builder: (_) => const FAQsScreen(),
        );
      case privacyPolicyRoute:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case bugReportRoute:
        return MaterialPageRoute(
          builder: (_) => const BugReportScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MaterialApp(
            home: Container(),
          ),
        );
    }
  }
}
