import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:covidstatisticsapplication/Model/countryModel.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  Map data = {};
  List<Country> cLst;

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

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Change Country"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: height / (1.3),
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
                      String ip =
                          autoCompleteTextField.textField.controller.text;
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
                        if (cLst.where((i) => i.countryName == ip).length > 0) {
                          Navigator.pushReplacementNamed(
                              context, '/home', arguments: {
                            'cN':
                                autoCompleteTextField.textField.controller.text,
                            'cLst': cLst
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              title: new Text("Not Found"),
                              content:
                                  new Text("Country input is not a valid name"),
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
      ),
    );
  }
}
