import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:healthline/presentation/resources/string_manager.dart';

import '../presentation/cubits/export.dart';
import '../presentation/resources/export.dart';
import '../util/config_loading.dart';

// final GlobalKey<NavigatorState>? navigatorKey =AliceInspector().dev
//                     ? AliceInspector().alice.getNavigatorKey()
//                     : GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp._instance(); // private name contructor

  static const MyApp instance =
      MyApp._instance(); // single instance --singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRoute();

  @override
  void dispose() {
    // _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configLoading(context);

    late Locale locale;
    if (Platform.localeName.contains('vi')) {
      locale = const Locale('vi');
    } else {
      locale = const Locale('en');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ResCubit(locale),
            ),
            BlocProvider(
              create: (context) => ApplicationUpdateCubit(),
            ),
          ],
          child: BlocBuilder<ResCubit, ResState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: StringManager.appName,
                // home: MediaQuery(
                //   data: MediaQuery.of(context).copyWith(
                //     textScaler: const TextScaler.linear(1.0),
                //   ),
                //   child: const SplashScreen(),
                // ),
                theme: appTheme,
                onGenerateRoute: _router.onGeneralRoute,
                initialRoute: splashRoute,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                locale: state.locale,
                builder: EasyLoading.init(),
                navigatorKey: navigatorKey,
                navigatorObservers: [SentryNavigatorObserver()],
              );
            },
          ),
        );
      },
    );
  }
}
