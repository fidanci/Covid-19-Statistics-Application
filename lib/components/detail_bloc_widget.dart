import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailBloc extends StatefulWidget {
  @override
  _DetailBlocState createState() => _DetailBlocState();

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
  FontWeight detailFontWeight;

  DetailBloc({
    @required this.titleText,
    @required this.detailText,
    this.titleFontSize: 20,
    this.detailFontSize: 25,
    @required this.height,
    @required this.width,
    this.radius: 15,
    this.blocColor: Colors.teal,
    this.titleTextColor: Colors.white,
    this.detailTextColor: Colors.white,
    this.titleFontWeight: FontWeight.w400,
    this.detailFontWeight: FontWeight.w400,
  });
}

class _DetailBlocState extends State<DetailBloc> {
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
    var detailFontWeight = widget.detailFontWeight;

    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: blocColor,
      ),
      height: height,
      width: width,
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Text(
                titleText,
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: detailFontSize,
                  color: detailTextColor,
                  fontWeight: detailFontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
