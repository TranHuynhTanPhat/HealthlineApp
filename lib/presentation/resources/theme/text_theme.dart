import 'package:flutter/material.dart';

import '../color_manager.dart';
import '../font_manager.dart';
import '../styles_manager.dart';

final textTheme = TextTheme(
  displayLarge: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c56,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c56,
  //   height: 64 / 57,
  //   letterSpacing: -0.25,
  // ),
  displayMedium: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c48,
    height: 52 / 45,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c48,
  // height: 52 / 45,
  // ),
  displaySmall: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c36,
    height: 44 / 36,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c36,
  //   height: 44 / 36,
  // ),
  headlineLarge: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c32,
    height: 40 / 32,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c32,
  //   height: 40 / 32,
  // ),
  headlineMedium: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c28,
    height: 36 / 28,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c28,
  //   height: 36 / 28,
  // ),
  headlineSmall: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c24,
    height: 32 / 24,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c24,
  //   height: 32 / 24,
  // ),
  titleLarge: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c20,
    height: 28 / 22,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c20,
  //   height: 28 / 22,
  // ),
  titleMedium: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c16,
    height: 24 / 16,
    letterSpacing: 0.1,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c16,
  //   height: 24 / 16,
  //   letterSpacing: 0.1,
  // ),
  titleSmall: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c14,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c14,
  //   height: 20 / 14,
  //   letterSpacing: 0.1,
  // ),
  labelLarge: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c16,
    height: 20 / 14,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c16,
  //   height: 20 / 14,
  // ),
  labelMedium: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c14,
    height: 16 / 12,
  ),
  //  GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c14,
  //   height: 16 / 12,
  // ),
  labelSmall: boldStyle(
    color: color1F1F1F,
    fontSize: FontSize.c12,
    height: 16 / 11,
  ),
  //  GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.bold,
  //   fontSize: FontSize.c12,
  //   height: 16 / 11,
  // ),
  bodyLarge: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c16,
    height: 24 / 16,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c16,
  //   height: 24 / 16,
  // ),
  bodyMedium: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c14,
    height: 20 / 14,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c14,
  //   height: 20 / 14,
  // ),
  bodySmall: regularStyle(
    color: color1F1F1F,
    fontSize: FontSize.c12,
    height: 16 / 12,
  ),
  // GoogleFonts.roboto(
  //   fontWeight: FontWeightManager.regular,
  //   fontSize: FontSize.c12,
  //   height: 16 / 12,
  // ),
);
