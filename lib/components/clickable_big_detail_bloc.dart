import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClickableBigDetailBloc extends StatefulWidget {
  @override
  _ClickableBigDetailBlocState createState() => _ClickableBigDetailBlocState();

  String titleText;
  double titleFontSize;
  double height;
  double width;
  double radius;
  Color blocColor;
  Color titleTextColor;
  Color iconColor;
  VoidCallback onPressed;

  ClickableBigDetailBloc({
    @required this.titleText,
    this.titleFontSize: 30,
    @required this.height,
    @required this.width,
    this.radius: 15,
    this.blocColor: Colors.teal,
    this.titleTextColor: Colors.white,
    @required this.onPressed,
  });
}

class _ClickableBigDetailBlocState extends State<ClickableBigDetailBloc> {
  @override
  Widget build(BuildContext context) {
    var titleText = widget.titleText;
    var titleFontSize = widget.titleFontSize;
    var height = widget.height;
    var width = widget.width;
    var radius = widget.radius;
    var blocColor = widget.blocColor;
    var titleTextColor = widget.titleTextColor;
    var onPressed = widget.onPressed;

    return AnimatedContainer(
      duration: Duration(milliseconds: 25),
      width: width /*width / (1.2)*/,
      height: height /*height / 15*/,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: Colors.teal,
      ),
      child: Row(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 80),
              child: RaisedButton.icon(
                color: blocColor,
                elevation: 0,
                onPressed: onPressed,
                /*() {
                  Navigator.pushReplacementNamed(context, '/selectCountry',
                      arguments: {'cLst': cLst});
                },*/
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: Text(
                  titleText,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    letterSpacing: 1,
                    color: titleTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
