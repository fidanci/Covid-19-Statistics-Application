import 'package:covidstatisticsapplication/helper/AppStrings.dart';
import 'package:covidstatisticsapplication/helper/constant.dart';
import 'package:covidstatisticsapplication/screen/home.dart';
import 'package:covidstatisticsapplication/screen/home_screen.dart';
import 'package:covidstatisticsapplication/screen/loading.dart';
import 'package:covidstatisticsapplication/screen/selectCountry.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          body1: TextStyle(color: kBodyTextColor),
        ),
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingPage(),
        '/home': (context) => HomeScreen(),
        '/selectCountry': (context) => SelectCountry(),
      },
    );
  }
}
