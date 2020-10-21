import 'package:flutter/material.dart';
import 'package:covidstatisticsapplication/Model/countryModel.dart';
import 'package:covidstatisticsapplication/components/big_detail_bloc.dart';
import 'package:covidstatisticsapplication/components/clickable_big_detail_bloc.dart';
import 'package:covidstatisticsapplication/components/detail_bloc_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  List<Country> cLst;
  Country c;
  String cN;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    cLst = data["cLst"];
    cN = data["cN"];
    if (cN != null) {
      c = cLst.where((i) => i.countryName == cN).elementAt(0);
    } else {
      c = cLst.where((i) => i.countryName == "Turkey").elementAt(0);
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: body(height, width),
    );
  }

  Widget get appBar => AppBar(
        title: Text("Covid-19 Statics"),
        centerTitle: true,
        elevation: 0,
      );

  Widget body(double height, width) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(height: 25),
          clickablebigdetailbloc(height, width),
          confirmedDetailBloc(height, width),
          deathsDetailBloc(height, width),
          recoveredDetailBloc(height, width),
          dateBloc(height, width),
        ],
      ),
    );
  }

  Widget clickablebigdetailbloc(double height, width) {
    return ClickableBigDetailBloc(
      titleText: c.countryName.toUpperCase().toString(),
      height: height / 15,
      width: width / (1.2),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/selectCountry',
            arguments: {'cLst': cLst});
      },
    );
  }

  Widget confirmedDetailBloc(double height, width) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      margin: EdgeInsets.only(top: 30),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailBloc(
            titleText: "Total Confirmed:",
            detailText: c.totalConfirmed.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
          SizedBox(width: 25),
          DetailBloc(
            titleText: "New Confirmed:",
            detailText: c.newConfirmed.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
        ],
      ),
    );
  }

  Widget deathsDetailBloc(double height, width) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      margin: EdgeInsets.only(top: 30),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailBloc(
            titleText: "Total Deaths:",
            detailText: c.totalDeaths.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
          SizedBox(width: 25),
          DetailBloc(
            titleText: "New Deaths:",
            detailText: c.newDeaths.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
        ],
      ),
    );
  }

  Widget recoveredDetailBloc(double height, width) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      margin: EdgeInsets.only(top: 30),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailBloc(
            titleText: "Total Recovered:",
            detailText: c.totalRecovered.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
          SizedBox(width: 25),
          DetailBloc(
            titleText: "New Recovered:",
            detailText: c.newRecovered.toString(),
            height: height / 8,
            width: width / (2.5),
          ),
        ],
      ),
    );
  }

  Widget dateBloc(double height, width) {
    return BigDetailBloc(
      titleText: "Date:",
      detailText: c.date.toString().substring(0, 10),
      height: height / 10,
      width: width / (1.2),
    );
  }
}
