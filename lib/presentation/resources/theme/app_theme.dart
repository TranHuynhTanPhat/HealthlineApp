import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../values_manager.dart';
import 'text_theme.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  dividerTheme: const DividerThemeData(color: colorF2F5FF, thickness: 1),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: transparent),
  bottomSheetTheme:  const BottomSheetThemeData(backgroundColor: transparent, elevation: 0),
  canvasColor: transparent,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: secondary, circularTrackColor: secondary, color: white),
  // main color of the app
  primaryColor: primary,
  primaryColorLight: primary.withOpacity(.7),
  primaryColorDark: secondary,
  disabledColor: white.withOpacity(.5), // will be use incase of disabled button

  splashColor: color1F1F1F.withOpacity(.2),

  colorScheme: ColorScheme(
    background: white, // background
    onBackground: colorA8B1CE,
    primary: primary, //button
    onPrimary: white, // text on button
    brightness: Brightness.light,
    secondary: secondary,
    onSecondary: white,
    error: Colors.red.shade400,
    onError: Colors.red,
    surface: white, //appbar
    onSurface: color1F1F1F, //text
  ),

  // card view theme
  cardTheme: const CardTheme(
      color: white, shadowColor: black26, elevation: AppSize.s4),

  // App bar theme
  // appBarTheme: AppBarTheme(
  //   centerTitle: true,
  //   backgroundColor: white,
  //   elevation: AppSize.s1_5,
  //   shadowColor: primary.withOpacity(.7),
  // ),

  // Button theme
  buttonTheme: ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: white.withOpacity(.5),
    buttonColor: primary,
    splashColor: white.withOpacity(1),
  ),

  // elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  ),

  // Text theme

  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(AppPadding.p16),

    // hint style
    hintStyle: textTheme.bodyLarge
            ?.copyWith(color: colorA8B1CE, fontWeight: FontWeight.w600),

    // label style
    // labelStyle: mediumStyle(color: color1F1F1F),

    // error style
    errorStyle: textTheme.bodySmall
            ?.copyWith(color: Colors.redAccent),

    // enable border
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: color1F1F1F.withOpacity(.5), width: AppSize.s1_5),
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),

    // forcused border
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),

    // error border
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: error, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),

    // forcused error border
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(
        Radius.circular(AppSize.s8),
      ),
    ),
  ),
);
