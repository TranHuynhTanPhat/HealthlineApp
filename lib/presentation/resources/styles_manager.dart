import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    double? height, double? letterSpacing) {
  return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing);
}

TextStyle thinStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(fontSize ?? FontSize.c12, FontWeightManager.thin, color, height, letterSpacing);
}

TextStyle extraThinStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.extraLight, color, height, letterSpacing);
}

TextStyle regularStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.regular, color, height, letterSpacing);
}

TextStyle lightStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.light, color, height, letterSpacing);
}

TextStyle mediumStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.medium, color, height, letterSpacing);
}

TextStyle semiBoldStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.semiBold, color, height, letterSpacing);
}

TextStyle boldStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(fontSize ?? FontSize.c12, FontWeightManager.bold, color, height, letterSpacing);
}

TextStyle extraBoldStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.extraBold, color, height, letterSpacing);
}

TextStyle blackStyle({double? fontSize, required Color color, double? height, double? letterSpacing}) {
  return _getTextStyle(
      fontSize ?? FontSize.c12, FontWeightManager.black, color, height, letterSpacing);
}
