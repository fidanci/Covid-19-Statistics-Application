import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigDetailBloc extends StatefulWidget {
  @override
  _BigDetailBlocState createState() => _BigDetailBlocState();

  String titleText;
  String detailText;
  double titleFontSize;
  double detailFontSize;
  double height;
  double width;
  double radius;
  Color blocColor;
  Color titleTextColor;
  Color detailTextColor;
  FontWeight titleFontWeight;

  BigDetailBloc({
    @required this.titleText,
    @required this.detailText,
    this.titleFontSize: 20,
    this.detailFontSize: 30,
    @required this.height,
    @required this.width,
    this.radius: 15,
    this.blocColor: Colors.teal,
    this.titleTextColor: Colors.white,
    this.detailTextColor: Colors.white,
    this.titleFontWeight: FontWeight.w400,
  });
}

class _BigDetailBlocState extends State<BigDetailBloc> {
  @override
  Widget build(BuildContext context) {
    var titleText = widget.titleText;
    var detailText = widget.detailText;
    var titleFontSize = widget.titleFontSize;
    var detailFontSize = widget.detailFontSize;
    var height = widget.height;
    var width = widget.width;
    var radius = widget.radius;
    var blocColor = widget.blocColor;
    var titleTextColor = widget.titleTextColor;
    var detailTextColor = widget.detailTextColor;
    var titleFontWeight = widget.titleFontWeight;

    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      margin: EdgeInsets.only(top: 30),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: blocColor,
      ),
      child: Row(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 25),
              padding: EdgeInsets.only(left: 100),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        color: titleTextColor,
                        fontWeight: titleFontWeight,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      detailText,
                      style: TextStyle(
                        fontSize: detailFontSize,
                        letterSpacing: 1,
                        color: detailTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
