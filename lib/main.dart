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
      title: 'Covid-19 Information App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
