import 'package:covidstatisticsapplication/helper/AppStrings.dart';
import 'package:covidstatisticsapplication/screen/home.dart';
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
        primarySwatch: Colors.teal,
        accentColor: Colors.teal,
        appBarTheme: AppBarTheme(color: Colors.teal),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/selectCountry': (context) => SelectCountry(),
      },
    );
  }
}
