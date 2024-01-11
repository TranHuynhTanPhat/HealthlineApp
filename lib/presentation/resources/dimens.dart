import 'package:flutter/material.dart';

import '../../util/log_data.dart';

class SizeConfig {
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _blockWidth = 0;
  double _blockHeight = 0;

  static double textMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    logPrint("$_screenWidth $_screenHeight");
    _blockWidth = _screenWidth / 50.5854791898;
    _blockHeight = _screenHeight / 112.4121759774;
    logPrint('$_blockWidth $_blockHeight');
    textMultiplier = _blockHeight;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}

double maxWidth() => SizeConfig.widthMultiplier * 50;
double maxHeight() => SizeConfig.heightMultiplier * 100;
double dimensWidth() => SizeConfig.widthMultiplier;
double dimensHeight() => SizeConfig.heightMultiplier;
double dimensText() => SizeConfig.textMultiplier;
// double dimensImage() => SizeConfig.imageSizeMultiplier;
// double dimensIcon() => SizeConfig.widthMultiplier * 4;

