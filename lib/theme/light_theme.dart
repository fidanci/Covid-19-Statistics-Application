import 'package:covidstatisticsapplication/helper/AppColors.dart';
import 'package:flutter/material.dart'
    show Brightness, ThemeData, VisualDensity;

final themeLightData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: AppColors.colorLightPrimary,
  scaffoldBackgroundColor: AppColors.colorWhitePrimary,
);
