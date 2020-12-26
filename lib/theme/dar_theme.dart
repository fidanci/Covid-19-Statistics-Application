import 'package:covidstatisticsapplication/helper/AppColors.dart';
import 'package:flutter/material.dart'
    show
        Brightness,
        FloatingActionButtonThemeData,
        FontWeight,
        IconThemeData,
        TextTheme,
        ThemeData,
        VisualDensity;

final themeDarkData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  primaryColor: AppColors.colorDarkThemePrimary,
  accentColor: AppColors.colorDarkThemeAccent,
  scaffoldBackgroundColor: AppColors.colorDarkThemePrimary,
);
