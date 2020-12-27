import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:covidstatisticsapplication/Model/countryModel.dart';
import 'package:covidstatisticsapplication/helper/AppStrings.dart';
import 'package:covidstatisticsapplication/helper/constant.dart';
import 'package:covidstatisticsapplication/widgets/counter.dart';
import 'package:covidstatisticsapplication/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

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
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    cLst = data["cLst"];
    cN = data["cN"];
    if (cN != null) {
      c = cLst.where((i) => i.countryName == cN).elementAt(0);
    } else {
      c = cLst
          .where((i) => i.countryName == AppString.defaultCountry)
          .elementAt(0);
    }

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Tek ihtiyacın olan",
              textBottom: "Evde kalmak.",
              offset: offset,
            ),
            GestureDetector(
              onTap: () => showModalBottom(context, size.width, size.height),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text("${c.countryName.toUpperCase().toString()}"),
                    ),
                    SvgPicture.asset("assets/icons/dropdown.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Vaka güncellemesi\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text:
                                  "Son güncelleme: ${c.date.toString().substring(0, 10)}",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          vakaDetay(context);
                        },
                        child: Text(
                          "Detayları görüntüle",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: c.newConfirmed,
                          title: AppString.newConfirmed,
                        ),
                        Counter(
                          color: kDeathColor,
                          number: c.newDeaths,
                          title: AppString.newDeaths,
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: c.newRecovered,
                          title: AppString.newRecovered,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Virüsün yayılması",
                        style: kTitleTextstyle,
                      ),
                      GestureDetector(
                        onTap: () {}, //TODO: En yakın zamanda eklenecek ibaresi
                        child: Text(
                          "Detayları görüntüle",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showModalBottom(BuildContext context, width, double height) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        height: 350,
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
                        hintText: AppString.searchCountry,
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
                        label: Text(AppString.changeCountry),
                        onPressed: () {
                          String ip =
                              autoCompleteTextField.textField.controller.text;
                          if (ip == null || ip.length == 0) {
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                title: new Text(AppString.error),
                                content: Text(AppString.inputCountryName),
                              ),
                            );
                          } else {
                            print(ip);
                            print(cLst.where((i) => i.countryName == ip));
                            if (cLst.where((i) => i.countryName == ip).length >
                                0) {
                              Navigator.pushReplacementNamed(context, '/home',
                                  arguments: {
                                    'cN': autoCompleteTextField
                                        .textField.controller.text,
                                    'cLst': cLst
                                  });
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  title: new Text(AppString.notFound),
                                  content:
                                      new Text(AppString.countryNameIsValid),
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
  }

  Future vakaDetay(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 12),
                ListTile(
                  leading: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back) // the arrow back icon
                        ),
                  ),
                  title: Center(
                    child: Text(
                      "Tüm vaka detayları",
                      textAlign: TextAlign.center,
                    ), // Your desired title
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Counter(
                              color: kInfectedColor,
                              number: c.newConfirmed,
                              title: AppString.newConfirmed,
                            ),
                            SizedBox(width: 70),
                            Counter(
                              color: kInfectedColor,
                              number: c.totalConfirmed,
                              title: AppString.totalConfirmed,
                            ),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Counter(
                              color: kRecovercolor,
                              number: c.newRecovered,
                              title: AppString.newRecovered,
                            ),
                            SizedBox(width: 50),
                            Counter(
                              color: kRecovercolor,
                              number: c.totalRecovered,
                              title: AppString.totalRecovered,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Counter(
                              color: kDeathColor,
                              number: c.newDeaths,
                              title: AppString.newDeaths,
                            ),
                            SizedBox(width: 90),
                            Counter(
                              color: kDeathColor,
                              number: c.totalDeaths,
                              title: AppString.totalDeaths,
                            ),
                          ],
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
}
