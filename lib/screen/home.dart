import 'package:autocomplete_textfield/autocomplete_textfield.dart';
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

  AutoCompleteTextField autoCompleteTextField;
  GlobalKey<AutoCompleteTextFieldState<Country>> key = new GlobalKey();

  Widget row(Country c) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      color: Colors.white.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            c.countryName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

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

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body(height, width),
      ),
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
          clickablebigdetailbloc(height, width, context),
          confirmedDetailBloc(height, width),
          deathsDetailBloc(height, width),
          recoveredDetailBloc(height, width),
          dateBloc(height, width),
        ],
      ),
    );
  }

  Widget clickablebigdetailbloc(double height, width, BuildContext context) {
    return ClickableBigDetailBloc(
      titleText: c.countryName.toUpperCase().toString(),
      height: height / 15,
      width: width / (1.2),
      onPressed: () {
        /*Navigator.pushReplacementNamed(context, '/selectCountry',
            arguments: {'cLst': cLst});*/
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          isScrollControlled: true,
          backgroundColor: Colors.teal,
          context: context,
          builder: (context) => Container(
            color: Colors.teal,
            height: 600,
            width: width,
            child: Column(
              children: <Widget>[
                Divider(
                  indent: 165,
                  endIndent: 165,
                  thickness: 2,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Container(
                  height: height / (3),
                  width: width / (1.2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        autoCompleteTextField = AutoCompleteTextField<Country>(
                          key: key,
                          clearOnSubmit: false,
                          suggestions: cLst,
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 30, 10, 20),
                            hintText: "Search Country Name",
                            hintStyle: TextStyle(color: Colors.black87),
                          ),
                          itemFilter: (item, query) {
                            return item.countryName
                                .toLowerCase()
                                .startsWith(query.toLowerCase());
                          },
                          itemSorter: (a, b) {
                            return a.countryName.compareTo(b.countryName);
                          },
                          itemSubmitted: (item) {
                            setState(() {
                              autoCompleteTextField.textField.controller.text =
                                  item.countryName;
                            });
                          },
                          itemBuilder: (context, item) {
                            return row(item);
                          },
                        ),
                        Center(
                          child: FlatButton.icon(
                            icon: Icon(Icons.flag),
                            color: Colors.white60,
                            label: Text("Change Country"),
                            onPressed: () {
                              String ip = autoCompleteTextField
                                  .textField.controller.text;
                              if (ip == null || ip.length == 0) {
                                showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    title: new Text("Error!"),
                                    content: Text("Please input country name"),
                                  ),
                                );
                              } else {
                                print(ip);
                                print(cLst.where((i) => i.countryName == ip));
                                if (cLst
                                        .where((i) => i.countryName == ip)
                                        .length >
                                    0) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home', arguments: {
                                    'cN': autoCompleteTextField
                                        .textField.controller.text,
                                    'cLst': cLst
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                      title: new Text("Not Found"),
                                      content: new Text(
                                          "Country input is not a valid name"),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
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

  // ignore: missing_return
  Widget modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.teal,
          height: 450,
          child: Column(
            children: <Widget>[
              Divider(
                indent: 165,
                endIndent: 165,
                thickness: 2,
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
