import 'package:covidstatisticsapplication/Model/countryModel.dart';
import 'package:covidstatisticsapplication/helper/AppStrings.dart';
import 'package:covidstatisticsapplication/service/covid-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<Country> cLst;

  parseData(dynamic json) {
    var list = json['Countries'] as List;
    cLst = list.map((i) => Country.fromJson(i)).toList();
  }

  void fetchData() async {
    var data = await getData();
    parseData(data);
    Navigator.pushReplacementNamed(context, '/home', arguments: {'cLst': cLst});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  AppString.appName,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: SpinKitPulse(
                  color: Colors.white70,
                  size: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
